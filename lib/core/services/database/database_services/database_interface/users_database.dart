import '../../../../models/user_model.dart';
import '../../../../utils/functions/custom_typedef.dart';

abstract class UsersDatabase{
  Future<void> createUserInDatabase({required UserModel userModel});

  Future<void> removeUserFromDatabase({required String uId});

  Future<UserModel?> getUserFromDatabase({required String uid});

  void listenIngUserModelInDatabase({required String uid,required EventFunction executeFunction});

  Future<void> modifyAFieldInAUserInADatabase({required String uid, required Map<String, dynamic> newData});

}