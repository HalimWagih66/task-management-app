import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:task_management_app/core/models/user_model.dart';
import '../../../../features/tasks_management/data/models/category_model.dart';
import '../../../utils/functions/custom_typedef.dart';

abstract class DatabaseServices{
  Future<void> createUser({required Map<String,dynamic> userJson,required String collectionName});
  Future<void> removeUser({required String uId, required String collectionName});
  Future<UserModel?> getUser({required String uid, required String collectionName});
  void listenIngUserModel({required String collection, required String uid,required EventFunction executeFunction});
  Future<void> editFieldInUserInDatabase({required String uid,required String collectionName, required Map<String, dynamic> newData});
  Future<String> uploadFileInDatabase({required String pathTheFile, required File file,required String fileName});
  Future<QuerySnapshot<CategoryModel>> fetchCategories({required String uid});
  CollectionReference<CategoryModel> getCategoryCollection({required String uid});
  void listenIngCollectionCategories({required String uid,required EventFunction executeFunction});
  Future<void>deleteCategory({required String categoryId,required String uid});
  Future<void> editCategory({required String categoryId, required String uid,required Map<String,dynamic> newData});
  Future<String?> addCategory({required String uid,required CategoryModel categoryModel});

}