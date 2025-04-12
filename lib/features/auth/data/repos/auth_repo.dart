import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:task_management_app/core/errors/failures.dart';
import 'package:task_management_app/core/models/user_model.dart';

abstract class AuthRepo{
  Future<Either<Failure, UserModel>> createAccountWithEmailAndPassword({required UserModel userModel,required File file,required String password});
  Future<Either<Failure, String?>> loginWithEmailAndPassword({required String emailAddress, required String password});
  Future<Either<Failure, UserModel>> signInByGoogle();
  Future<Either<Failure, bool>> resetPassword(String email);
  Future<Either<Failure, UserModel>> signUpByGoogle();
}