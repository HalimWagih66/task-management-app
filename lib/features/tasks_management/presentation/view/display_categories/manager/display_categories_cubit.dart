import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';
import 'package:task_management_app/core/utils/constant/firebase/firebase_storage_constant.dart';
import 'package:task_management_app/core/utils/functions/image_picker/check_image_picker.dart';
import '../../../../data/models/category_model.dart';
import '../../../../data/repos/tasks_management_repo.dart';
part 'display_categories_state.dart';

class DisplayCategoriesCubit extends Cubit<DisplayCategoriesState> {
  TasksManagementRepo tasksManagementRepo;
  File? pickImage;
  List<CategoryModel> categories = [];
  String? categoryName;
  DisplayCategoriesCubit({required this.tasksManagementRepo}) : super(DisplayCategoriesInitial());
  Future<void>fetchCategories(String uid)async {
    emit(DisplayCategoriesLoading());
    var result = await tasksManagementRepo.fetchCategories(uid: uid);
    result.fold((failure) {
      emit(DisplayCategoriesFailure(errorMessage: failure.message));
    }, (items) {
      if(items.isEmpty){
        emit(DisplayCategoriesIsEmpty(title: "Categories"));
        return;
      }
      categories = items;
      emit(DisplayCategoriesSuccess());
    },
    );
  }
  void listenIngCollectionCategories(String uid)async {
    emit(DisplayCategoriesLoading());
    tasksManagementRepo.listenIngCollectionCategories(uid: uid,executeFunction:(items) {
      if(items.isEmpty){
        emit(DisplayCategoriesIsEmpty(title: "Categories"));
        return;
      }
      categories = items;
      emit(DisplayCategoriesSuccess());
    },);
  }
  Future<void>uploadCategoryImageForEdit({required String uid, required String imageName,required String categoryId})async {
    emit(EditCategoryLoading());
    var result = await tasksManagementRepo.uploadCategoryImage(pathTheFile: FirebaseStorageConstant.getPathTheImage(email: FirebaseAuth.instance.currentUser!.email!, folderName: FirebaseStorageConstant.categories), file: pickImage!, fileName: imageName);
    result.fold((failure) {
      emit(EditCategoryFailure(errorMessage: failure.message));
    }, (imageUrl)async{
      await editCategory(categoryId: categoryId, uid: uid, newData: {"categoryImage":imageUrl});
    },);
  }
  Future<String?>uploadCategoryImageForAdd({required String uid, required String imageName})async {
    var result = await tasksManagementRepo.uploadCategoryImage(pathTheFile: FirebaseStorageConstant.getPathTheImage(email: FirebaseAuth.instance.currentUser!.email!, folderName: FirebaseStorageConstant.categories), file: pickImage!, fileName: imageName);
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
      numberTasks: 0,
      completedTasks: 0,
      categoryName: categoryName ,
      categoryImage: null,
    ));
    result.fold((failure) {
      emit(AddCategoryFailure(errorMessage: failure.message));
    }, (categoryId) async{
      String? imageUrl = await uploadCategoryImageForAdd(uid: uid,imageName: categoryId);
      await editCategory(categoryId: categoryId, uid: uid, newData: {"categoryImage":imageUrl});
      emit(AddCategorySuccess());
    },);
  }
  Future<void> deleteCategory({required String categoryId, required String uid})async{
    var result = await tasksManagementRepo.deleteCategory(uid: uid, categoryId: categoryId);
    result.fold((failure) {
      emit(DisplayCategoriesFailure(errorMessage: failure.message));
    }, (success) {
      
    },);
  }
  Future<void> editCategory({required String categoryId, required String uid,required Map<String,dynamic> newData})async{
    emit(EditCategoryLoading());
    var result = await tasksManagementRepo.editCategory(categoryId: categoryId,uid: uid,newData: newData);
    result.fold((failure) {
      emit(EditCategoryFailure(errorMessage: failure.message));
    }, (success) {
      emit(EditCategorySuccess());
    },);
  }
  bool checkPickImageIsValid(){
    if(pickImage == null){
      emit(CategoryImageIsNotValid());
      return false;
    }
    return true;
  }
  Future<void> onPressedCamera() async {
    pickImage = await CheckImagePicker.onPressedCamera();
    if (pickImage != null) {
      emit(CategoryImageSuccess(file: pickImage!));
      return;
    }
    emit(CategoryImageIsNotValid());
  }
  Future<void> onPressedGallery() async {
    pickImage = await CheckImagePicker.onPressedGallery();
    if (pickImage != null) {
      emit(CategoryImageSuccess(file: pickImage!));
      return;
    }
    emit(CategoryImageIsNotValid());
  }
}
