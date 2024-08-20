import 'package:dartz/dartz.dart';
import 'package:task_management_app/core/errors/failures.dart';
import 'package:task_management_app/core/models/user_model.dart';

abstract class HomeLayoutRepo{
  Future<Either<Failure,UserModel>> fetchUserModel({required String uid});
}