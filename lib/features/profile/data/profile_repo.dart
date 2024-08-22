import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:task_management_app/core/errors/failures.dart';

abstract class ProfileRepo{
  Future<Either<Failure,bool>>editFieldInUserInDatabase({required String uid,required String collectionName, required Map<String, dynamic> newData});
  Future<Either<Failure, bool>> changePassword({required String newPassword});
  Future<Either<Failure, String>>uploadFileInDatabase({required String pathTheFile, required File file,required String fileName});
}