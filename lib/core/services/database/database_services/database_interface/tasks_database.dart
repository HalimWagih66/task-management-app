import 'package:task_management_app/core/utils/functions/custom_typedef.dart';
import '../../../../../features/tasks_management/data/models/task_model.dart';

abstract class TasksDatabase {

  Future<String?> addTaskInDatabase({required String uid, required TaskModel taskModel, required String categoryId});

  Future<void> deleteTaskFromDatabase({required String uid, required String categoryId, required String taskID});

  Future<void> editFieldsInTaskInDatabase({required String taskId, required String categoryId, required String uid, required Map<String, dynamic>newData});

  Future<void> trackTodayTaskCount({required String categoryId, required String uid, required int dateTime, required EventFunctionAsync eventFunction});

  Future<void> trackCompletedTasksToday({required String categoryId, required String uid, required int dateTime, required EventFunctionAsync eventFunction});

  Future<TaskModel?> fetchASpecificTask({required String uid, required String taskId, required String categoryId});

  Future<List<TaskModel>> fetchTasksByStatus({required String categoryId, required int status, required String uid, required DateTime dateTime});

  Future<List<TaskModel>> fetchTasksByDate({required String categoryId, required String uid, required DateTime dateTime});

  Future<void> trackInformationAboutTasks({required String categoryId, required int status, required String uid, required DateTime dateTime, required EventFunctionAsync eventFunctionTrackCompletedTasksToday, required EventFunctionAsync eventFunctionTrackTodayTaskCount});

}