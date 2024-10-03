import '../../../../../features/tasks_management/data/models/task_model.dart';

abstract class TasksDatabase{

  Future<String?> addTaskInDatabase({required String uid,required TaskModel taskModel, required String categoryId});

  Future<void> deleteTaskFromDatabase({required String uid, required String categoryId,required String taskID});

  Future<void> editFieldsInTaskInDatabase({required String taskId, required String categoryId,required String uid,required Map<String,dynamic>newData});

  List<TaskModel> listenToTasksFromTheDatabase({required String categoryId,required String uid, required DateTime dateTime});

  List<TaskModel> listenToTasksFromTheDatabaseUsingFilter({required String categoryId,required int status,required String uid, required DateTime dateTime});

 }