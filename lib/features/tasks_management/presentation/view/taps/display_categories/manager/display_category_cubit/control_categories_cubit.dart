import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:task_management_app/core/utils/constant/firebase/firebase_storage_constant.dart';
import '../../../../../../data/models/category_model.dart';
import '../../../../../../data/repos/tasks_management_repo.dart';
import 'control_categories_state.dart';


class ControlCategoriesCubit extends Cubit<ControlCategoriesState> {
  TasksManagementRepo tasksManagementRepo;
  File? pickImage;
  List<CategoryModel> categories = [];
  String? categoryName;
  ControlCategoriesCubit({required this.tasksManagementRepo}) : super(DisplayCategoriesInitial());
  Future<void> fetchCategories(String uid)async {
    emit(CategoriesLoadingState());
    var result = await tasksManagementRepo.fetchCategories(uid: uid);
    result.fold((failure) {
      emit(CategoriesFailureState(errorMessage: failure.message));
    }, (items) {
      if(items.isEmpty){
        emit(CategoriesIsEmptyState(title: "Categories"));
        return;
      }
      emit(CategoriesSuccessState());
    },
    );
  }
  void listenIngCollectionCategories({required String uid})async {
    emit(CategoriesLoadingState());
    tasksManagementRepo.listenIngCollectionCategories(uid: uid,executeFunction:(items) {
      if(items.isEmpty){
        emit(CategoriesIsEmptyState(title: "Categories"));
        return;
      }
      categories = items;
      emit(CategoriesSuccessState());
    },);
  }
  Future<void>uploadCategoryImageForEdit({required String uid, required String imageName,required String categoryId})async {
    emit(EditCategoryLoading(editType: "image"));
    var result = await tasksManagementRepo.uploadImageOnDatabase(pathTheFile: FirebaseStorageConstant.getPathTheImage(email: FirebaseAuth.instance.currentUser!.email!, folderName: FirebaseStorageConstant.categories), file: pickImage!, fileName: imageName);
    result.fold((failure) {
      emit(EditCategoryFailure(errorMessage: failure.message));
    }, (imageUrl)async{
      await editCategory(categoryId: categoryId, uid: uid, newData: {"categoryImage":imageUrl},editType: "image");
    },);
  }
  Future<String?>uploadCategoryImageForAdd({required String uid, required String imageName})async {
    var result = await tasksManagementRepo.uploadImageOnDatabase(pathTheFile: FirebaseStorageConstant.getPathTheImage(email: FirebaseAuth.instance.currentUser!.email!, folderName: FirebaseStorageConstant.categories), file: pickImage!, fileName: imageName);
    String? photoUrl;
    result.fold((failure) {
      emit(AddCategoryFailure(errorMessage: failure.message));
    }, (imageUrl){
      photoUrl = imageUrl;
    },);
    return photoUrl;
  }

  Future<void> addCategory({required String uid}) async {
    emit(AddCategoryLoading());
    var result = await tasksManagementRepo.addCategory(uid: uid,categoryModel:CategoryModel(
      categoryName: categoryName ,
      categoryImage: null,
      allTasksToday: 0,
      completeTasksInToday: 0
    ));
    result.fold((failure) {
      emit(AddCategoryFailure(errorMessage: failure.message));
    }, (categoryId) async{
      String? imageUrl = await uploadCategoryImageForAdd(uid: uid,imageName: categoryId);
      await editCategory(categoryId: categoryId, uid: uid, newData: {"categoryImage":imageUrl});
      emit(AddCategorySuccess());
    },);
  }

  Future<void> deleteCategory({required String categoryId, required String uid,required String userEmail})async{
    var result = await tasksManagementRepo.deleteCategory(uid: uid, categoryId: categoryId);
    result.fold((failure) {
      emit(DeleteCategoryFailure(errorMessage: failure.message));
    }, (success)async {
      await deleteCategoryImage(uid: uid, categoryId: categoryId, fileNme: categoryId, pathTheFile: FirebaseStorageConstant.getPathTheImage(email: userEmail, folderName: FirebaseStorageConstant.categories));
    },
    );
  }
  Future<void> deleteCategoryImage({required String uid, required String categoryId,required String fileNme,required String pathTheFile}) async {
    var result = await tasksManagementRepo.removeFileFromDatabase(categoryId: categoryId,uid: uid,pathTheFile: pathTheFile,fileNme: fileNme);
    result.fold((failure) {
      emit(DeleteCategoryFailure(errorMessage: failure.message));
    }, (success) {
    },);
  }
  Future<void> editCategory({required String categoryId, required String uid,required Map<String,dynamic> newData,String? editType})async{
    emit(EditCategoryLoading(editType: editType));
    var result = await tasksManagementRepo.editCategory(categoryId: categoryId,uid: uid,newData: newData);
    result.fold((failure) {
      emit(EditCategoryFailure(errorMessage: failure.message));
    }, (success) {
      emit(EditCategorySuccess(editType: editType));
    },);
  }
  Future<void> updateTaskFieldsInTheCategory({required String categoryId, required String uid,required DateTime dateTime}) async {
    await tasksManagementRepo.trackInformationAboutTasks(categoryId: categoryId, uid: uid, dateTime: dateTime, eventFunctionTrackCompletedTasksToday: (event) async{
      await tasksManagementRepo.editCategory(uid: uid, categoryId: categoryId, newData: {"completeTasksInToday":event});
    }, eventFunctionTrackTodayTaskCount: (event)async {
      await tasksManagementRepo.editCategory(uid: uid, categoryId: categoryId, newData: {"allTasksToday":event});
    },);
  }
}