import 'dart:io';
import 'package:task_management_app/core/models/user_model.dart';

abstract class DatabaseServices{
  Future<void> createUser({required Map<String,dynamic> userJson,required String collectionName});
  Future<void> removeUser({required String uId, required String collectionName});
  Future<UserModel?> getUser({required String uid, required String collectionName});
  Future<void> editFieldInUserInDatabase({required String uid,required String collectionName, required Map<String, dynamic> newData});
  Future<String> uploadFileInDatabase({required String pathTheFile, required File file,required String fileName});
}