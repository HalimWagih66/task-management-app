import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:task_management_app/core/errors/failures.dart';
import 'package:task_management_app/core/models/user_model.dart';

abstract class AuthRepo{
  Future<Either<Failure, UserModel>> createUserWithEmailAndPassword({required UserModel userModel,required File file,required String password});
  Future<Either<Failure, UserModel>> createUserWithGoogle();
  Future<Either<Failure, User>> loginWithEmail({required String emailAddress, required String password});
}