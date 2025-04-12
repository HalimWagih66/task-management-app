import 'package:dartz/dartz.dart';
import 'package:task_management_app/core/errors/failures.dart';
import 'package:task_management_app/core/models/user_model.dart';
import '../../../core/utils/functions/custom_typedef.dart';


abstract class HomeLayoutRepo{
  Future<Either<Failure,UserModel>> fetchUserModel({required String uid});
  Future<Either<Failure,bool>>signOut();
  void listenIngUserModelInDatabase({required String uid, required EventFunction executeFunction});
}