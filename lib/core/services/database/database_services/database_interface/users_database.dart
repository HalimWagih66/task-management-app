import '../../../../models/user_model.dart';
import '../../../../utils/functions/custom_typedef.dart';

abstract class UsersDatabase{
  Future<void> createUserInDatabase({required UserModel userModel,required String collectionName});

  Future<void> removeUserFromDatabase({required String uId, required String collectionName});

  Future<UserModel?> getUserFromDatabase({required String uid, required String collectionName});

  void listenIngUserModelInDatabase({required String collection, required String uid,required EventFunction executeFunction});

  Future<void> modifyAFieldInAUserInADatabase({required String uid, required Map<String, dynamic> newData});

}