import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:task_management_app/core/errors/exceptions.dart';
import 'package:task_management_app/core/errors/failures.dart';
import 'package:task_management_app/core/utils/constant/sentence/sentence.dart';
import 'package:task_management_app/core/utils/functions/custom_typedef.dart';
import 'package:task_management_app/features/tasks_management/data/repos/tasks_management_repo.dart';
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
  Future<Either<Failure, String>> uploadCategoryImage({required String pathTheFile, required File file, required String fileName}) async {
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




}