import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:task_management_app/core/errors/failures.dart';

import '../../../../core/utils/functions/custom_typedef.dart';
import '../models/category_model.dart';

abstract class TasksManagementRepo {
  Future<Either<Failure, List<CategoryModel>>> fetchCategories({required String uid});

  Future<Either<Failure, String>> uploadCategoryImage({required String pathTheFile, required File file, required String fileName});

  Future<Either<Failure, String>> addCategory({required String uid,required CategoryModel categoryModel});

  Future<Either<Failure, bool>> deleteCategory({required String uid,required String categoryId});

  Future<Either<Failure, bool>> removeFileFromDatabase({required String uid, required String categoryId,required String fileNme,required String pathTheFile});


  Future<Either<Failure, bool>> editCategory({required String uid,required String categoryId, required Map<String, dynamic> newData});

  Either<Failure, bool> listenIngCollectionCategories({required String uid,required EventFunction executeFunction});
}