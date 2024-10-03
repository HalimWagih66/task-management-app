import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:task_management_app/core/errors/failures.dart';
import 'package:task_management_app/core/utils/constant/sentence/sentence.dart';
import 'package:task_management_app/core/utils/functions/custom_typedef.dart';
import 'package:task_management_app/features/tasks_management/data/models/task_model.dart';
import 'package:task_management_app/features/tasks_management/data/repos/tasks_management_repo.dart';
import '../../../../core/errors/exceptions/exceptions.dart';
import '../../../../core/services/database/database_services/database_services.dart';
import '../models/category_model.dart';

class TasksManagementRepoImpl implements TasksManagementRepo{
  DatabaseServices databaseServices;
  TasksManagementRepoImpl({required this.databaseServices});

  @override
  Future<Either<Failure, List<CategoryModel>>> fetchCategories({required String uid}) async{
      try {
        var items = await databaseServices.categoriesDatabase.fetchCategories(uid: uid);
        return right(items);
      } on CustomException catch (e) {
        return left(ServerFailure(e.errorMessage));
      } catch(e){
        return left(ServerFailure(Sentence.somethingWentWrongPleaseTryAgain));
      }
  }

  @override
  Future<Either<Failure, String>> uploadImageOnDatabase({required String pathTheFile, required File file, required String fileName}) async {
    try {
      String imageUrl = await databaseServices.storageDatabase.uploadFileInDatabase(pathTheFile: pathTheFile, file: file, fileName: fileName);
      return right(imageUrl);
    } on CustomException catch (e) {
      return left(ServerFailure(e.errorMessage));
    } catch(e){
      return left(ServerFailure(Sentence.somethingWentWrongPleaseTryAgain)); 
    }
  }

  @override
  Future<Either<Failure, String>> addCategory({required String uid,required CategoryModel categoryModel})async {
   try {
     String? categoryId = await databaseServices.categoriesDatabase.addCategoryInDatabase(categoryModel: categoryModel, uid: uid);
     return right(categoryId!);
     } on CustomException catch (e) {
     return left(ServerFailure(e.errorMessage));
     } catch(e){
     return left(ServerFailure(Sentence.somethingWentWrongPleaseTryAgain));
   }
  }

  @override
  Future<Either<Failure, bool>> editCategory({required String uid,required String categoryId, required Map<String, dynamic> newData}) async{
    try {
      await databaseServices.categoriesDatabase.editCategoryFromDatabase(categoryId: categoryId, uid: uid, newData: newData);
      return right(true);
    } on CustomException catch (e) {
      return left(ServerFailure(e.errorMessage));
    } catch(e){
      return left(ServerFailure(Sentence.somethingWentWrongPleaseTryAgain));
    }
  }

  @override
  Either<Failure, bool> listenIngCollectionCategories({required String uid, required EventFunction executeFunction}) {
    try {
      databaseServices.categoriesDatabase.listenIngCollectionCategories(uid: uid, executeFunction: executeFunction);
      return right(true);
    } on CustomException catch (e) {
      return left(ServerFailure(e.errorMessage));
    } catch(e){
      return left(ServerFailure(Sentence.somethingWentWrongPleaseTryAgain));
    }
  }

  @override
  Future<Either<Failure, bool>> deleteCategory({required String uid, required String categoryId}) async{
    try {
      await databaseServices.categoriesDatabase.deleteCategoryFromDatabase(categoryId: categoryId, uid: uid);
      return right(true);
    } on CustomException catch (e) {
      return left(ServerFailure(e.errorMessage));
    } catch(e){
      return left(ServerFailure(Sentence.somethingWentWrongPleaseTryAgain));
    }
  }

  @override
  Future<Either<Failure, bool>> removeFileFromDatabase({required String uid, required String categoryId,required String fileNme,required String pathTheFile}) async{
    try {
      await databaseServices.storageDatabase.removeFileInDatabase(pathTheFile: pathTheFile, fileName: fileNme);
      return right(true);
    } on CustomException catch (e) {
      return left(ServerFailure(e.errorMessage));
    }catch (e){
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, String?>> addTaskInDatabase({required String uid, required TaskModel taskModel, required String categoryId})async {
    try {
      String? taskID = await databaseServices.tasksDatabase.addTaskInDatabase(uid: uid, taskModel: taskModel, categoryId: categoryId);
      return right(taskID);
    } on CustomException catch (e) {
      return left(ServerFailure(e.errorMessage));
    }catch (e){
      return left(ServerFailure(Sentence.somethingWentWrongPleaseTryAgain));
    }
  }

  @override
  Future<Either<Failure, bool>> deleteTaskFromDatabase({required String uid, required String categoryId, required String taskID}) async {
    try {
      await databaseServices.tasksDatabase.deleteTaskFromDatabase(uid: uid, categoryId: categoryId, taskID: taskID);
      return right(true);
    } on CustomException catch (e) {
      return left(ServerFailure(e.errorMessage));
    }catch (e){
      return left(ServerFailure(Sentence.somethingWentWrongPleaseTryAgain));
    }
  }

  @override
  Future<Either<Failure, bool>> editFieldsInTaskInDatabase({required String taskId, required String categoryId, required String uid, required Map<String, dynamic> newData}) async {
    try {
      await databaseServices.tasksDatabase.editFieldsInTaskInDatabase(taskId: taskId, categoryId: categoryId, uid: uid, newData: newData);
      return right(true);
    } on CustomException catch (e) {
      return left(ServerFailure(e.errorMessage));
    }catch (e){
      return left(ServerFailure(Sentence.somethingWentWrongPleaseTryAgain));
    }
  }

  @override
  Either<Failure, List<TaskModel>> listenToTasksFromTheDatabase({required String categoryId, required String uid, required DateTime dateTime}) {
    try {
      List<TaskModel> tasks = databaseServices.tasksDatabase.listenToTasksFromTheDatabase(categoryId: categoryId, uid: uid, dateTime: dateTime);
      return right(tasks);
    } on CustomException catch (e) {
      return left(ServerFailure(e.errorMessage));
    }catch (e){
      return left(ServerFailure(Sentence.somethingWentWrongPleaseTryAgain));
    }

  }

  @override
  Either<Failure, List<TaskModel>> listenToTasksFromTheDatabaseUsingFilter({required String categoryId, required int status, required String uid, required DateTime dateTime}) {
    try {
      List<TaskModel> tasks = databaseServices.tasksDatabase.listenToTasksFromTheDatabaseUsingFilter(categoryId: categoryId, status: status, uid: uid, dateTime: dateTime);
      return right(tasks);
    } on CustomException catch (e) {
      return left(ServerFailure(e.errorMessage));
    }catch (e){
      return left(ServerFailure(Sentence.somethingWentWrongPleaseTryAgain));
    }
  }
}