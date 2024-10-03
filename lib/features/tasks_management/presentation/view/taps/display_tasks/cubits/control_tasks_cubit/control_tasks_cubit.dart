import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:task_management_app/core/utils/constant/firebase/firebase_storage_constant.dart';
import 'package:task_management_app/core/utils/constant/url_temporary.dart';
import '../../../../../../data/models/task_model.dart';
import '../../../../../../data/repos/tasks_management_repo.dart';

part 'control_tasks_state.dart';

class ControlTasksCubit extends Cubit<ControlTasksState> {
  TasksManagementRepo tasksManagementRepo;
  File? pickImage;
  List<Color> importance = const [
    Color(0xffff0000),
    Color(0xffff9900),
    Color(0xffffff00),
    Color(0xff7fff00),
    Color(0xff007fff),
    Color(0xffe5e5e5),
  ];
  final List<String>statusTask = [
    "To-Do",
    "In-Progress",
    "Done"
  ];
  ControlTasksCubit({required this.tasksManagementRepo}) : super(ControlTasksInitial());


  Future<void> addTaskInDatabase({required String uid,required TaskModel taskModel, required String categoryId})async{
    emit(AddTaskLoading());
    var result = await tasksManagementRepo.addTaskInDatabase(uid: uid, taskModel: taskModel, categoryId: categoryId);
    result.fold((failure) {
      emit(AddTaskFailure(errorMessage: failure.message));
    }, (taskID) async{
      String? imageUrl = await uploadTaskImageForAdd(imageName: taskID!);
      await editFieldsInTaskInDatabase(taskId: taskID, categoryId: categoryId, uid: uid, newData: {"imageUrl":imageUrl});
      emit(AddTaskSuccess());
    },);
  }
  Future<String?>uploadTaskImageForAdd({required String imageName})async {
    var result = await tasksManagementRepo.uploadImageOnDatabase(pathTheFile: FirebaseStorageConstant.getPathTheImage(email: FirebaseAuth.instance.currentUser!.email!, folderName: FirebaseStorageConstant.categories), file: pickImage!, fileName: imageName);
    String? photoUrl;
    result.fold((failure) {
      emit(AddTaskFailure(errorMessage: failure.message));
    }, (imageUrl){
      photoUrl = imageUrl;
    },);
    return photoUrl;
  }
  Future<void> deleteTaskFromDatabase({required String uid, required String categoryId,required String taskID})async{
    var result = await tasksManagementRepo.deleteTaskFromDatabase(uid: uid, categoryId: categoryId, taskID: taskID);
    result.fold((failure) {
      emit(DeleteTaskFailure(errorMessage: failure.message));
    }, (success) {
      emit(DeleteTaskSuccess());
    },);
  }

  Future<void> editFieldsInTaskInDatabase({required String taskId, required String categoryId,required String uid,required Map<String,dynamic>newData}) async {
    var result = await tasksManagementRepo.editFieldsInTaskInDatabase(taskId: taskId, categoryId: categoryId, uid: uid, newData: newData);
    result.fold((failure) {
      emit(EditTaskFailure(errorMessage:failure.message));
    }, (success) {

    },);
  }

  void listenToTasksFromTheDatabase({required String categoryId,required String uid, required DateTime dateTime}){
    var result = tasksManagementRepo.listenToTasksFromTheDatabase(categoryId: categoryId, uid: uid, dateTime: dateTime);
    result.fold((failure) {
      emit(FetchTasksFailure(errorMessage: failure.message));
    }, (tasks) {
      tasks = List.generate(5, (index) => TaskModel(title: "title",time: "10:30",desc: "desc",priority: 1,taskId: "",status: 1,imageUrl: TemporaryUrls.displayImageCaseBaseImageIsNull,date: DateTime.now()));
      if(tasks.isEmpty){
        emit(FetchTasksIsEmpty());
      }else {
        emit(FetchTasksSuccess(tasks: tasks));
      }
    },);
  }

  void listenToTasksFromTheDatabaseUsingFilter({required String categoryId,required int status,required String uid, required DateTime dateTime}){
    var result = tasksManagementRepo.listenToTasksFromTheDatabaseUsingFilter(categoryId: categoryId, status: status, uid: uid, dateTime: dateTime);
    result.fold((failure) {
      emit(FetchTasksFailure(errorMessage: failure.message));
    }, (tasks) {
      emit(FetchTasksSuccess(tasks: tasks));
    },);
  }

}
