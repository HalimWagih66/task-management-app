import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:task_management_app/core/errors/failures.dart';
import '../../../../core/utils/functions/custom_typedef.dart';
import '../models/category_model.dart';
import '../models/task_model.dart';

abstract class TasksManagementRepo {
  Future<Either<Failure, List<CategoryModel>>> fetchCategories({required String uid});

  Future<Either<Failure, String>> uploadImageOnDatabase({required String pathTheFile, required File file, required String fileName});

  Future<Either<Failure, String>> addCategory({required String uid,required CategoryModel categoryModel});


  Future<Either<Failure, bool>> deleteCategory({required String uid,required String categoryId});

  Future<Either<Failure, bool>> removeFileFromDatabase({required String uid, required String categoryId,required String fileNme,required String pathTheFile});

  Future<Either<Failure, bool>> editCategory({required String uid,required String categoryId, required Map<String, dynamic> newData});

  Either<Failure, bool> listenIngCollectionCategories({required String uid,required EventFunction executeFunction});

  Future<Either<Failure, String?>>addTaskInDatabase({required String uid,required TaskModel taskModel, required String categoryId});

  Future<Either<Failure, bool>> deleteTaskFromDatabase({required String uid, required String categoryId,required String taskID});

  Future<Either<Failure, bool>> editFieldsInTaskInDatabase({required String taskId, required String categoryId,required String uid,required Map<String,dynamic>newData});

  Future<Either<Failure, TaskModel?>> fetchASpecificTask({required String uid, required String taskId, required String categoryId});

  Future<Either<Failure, void>> trackInformationAboutTasks({required String categoryId, required String uid, required DateTime dateTime,required EventFunctionAsync eventFunctionTrackCompletedTasksToday,required EventFunctionAsync eventFunctionTrackTodayTaskCount});

  Future<Either<Failure, List<TaskModel>>> fetchTasksByStatus({required String categoryId,required int status,required String uid, required DateTime dateTime});

  Future<Either<Failure, List<TaskModel>>> fetchTasksByDate({required String categoryId, required String uid, required DateTime dateTime});


}