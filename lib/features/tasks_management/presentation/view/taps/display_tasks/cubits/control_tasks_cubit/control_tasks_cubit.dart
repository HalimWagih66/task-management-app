import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../data/models/task_model.dart';
import '../../../../../../data/repos/tasks_management_repo.dart';
part 'control_tasks_state.dart';

class ControlTasksCubit extends Cubit<ControlTasksState> {
  TasksManagementRepo tasksManagementRepo;
  File? pickImage;
  DateTime dateTime = DateTime.now();
  int status = -1;
  List<TaskModel> tasks = [];

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
      emit(AddTaskSuccess());
    },);
  }
  Future<void>fetchTasks({required String uid, required String categoryId})async {
    if(status == -1){
      await fetchTasksByDate(uid: uid, categoryId: categoryId);
    }else{
      await fetchTasksByState(uid: uid, categoryId: categoryId, status: status);
    }
  }
  Future<void> changeStatus({required String uid, required String categoryId, required int status})async{
    this.status = status;
    await fetchTasksByState(uid: uid, categoryId: categoryId, status: status);
  }

  Future<void> deleteTaskFromDatabase({required String uid, required String categoryId,required String taskID})async{
    var result = await tasksManagementRepo.deleteTaskFromDatabase(uid: uid, categoryId: categoryId, taskID: taskID);
    result.fold((failure) {
      emit(DeleteTaskFailure(errorMessage: failure.message));
    }, (success) async {
      await fetchTasks(uid: uid,categoryId: categoryId);
      emit(DeleteTaskSuccess());
    },);
  }
  Future<void> fetchASpecificTask({required String uid, required String categoryId,required String taskID})async{
    var result = await tasksManagementRepo.fetchASpecificTask(categoryId: categoryId,uid: uid,taskId: taskID);
    result.fold((failure) {
    }, (task) async {
      emit(UpdateTaskSuccess(taskModel: task));
    },);
  }

  Future<void> editFieldsInTaskInDatabase({required String taskId, required String categoryId,required String uid,required Map<String,dynamic>newData}) async {
    var result = await tasksManagementRepo.editFieldsInTaskInDatabase(taskId: taskId, categoryId: categoryId, uid: uid, newData: newData);
    result.fold((failure) {
      emit(EditTaskFailure(errorMessage:failure.message));
    }, (success) {
      emit(EditTaskSuccess());
    },);
  }
  Future<void> fetchTasksByDate({required String uid, required String categoryId})async{
    emit(FetchTasksLoading());
    var res = await tasksManagementRepo.fetchTasksByDate(categoryId: categoryId, uid: uid, dateTime: dateTime);
    res.fold((left) {
      emit(FetchTasksFailure(errorMessage: left.message));
    }, (items) {
      tasks = items;
      if(items.isEmpty){
        emit(FetchTasksIsEmpty());
      }else{
        emit(FetchTasksSuccess(tasks: tasks));
      }
    },);
  }
  Future<void> fetchTasksByState({required String uid, required String categoryId,required int status}) async {
    emit(FetchTasksLoading());
    var res = await tasksManagementRepo.fetchTasksByStatus(categoryId: categoryId, status: status, uid: uid, dateTime: dateTime);
    res.fold((left) {
      emit(FetchTasksFailure(errorMessage: left.message));
    }, (items) {
      tasks = items;
      if(items.isEmpty){
        emit(FetchTasksIsEmpty());
      }else{
        emit(FetchTasksSuccess());
      }
    },);
  }
}
