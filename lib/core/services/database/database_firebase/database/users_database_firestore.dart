import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:task_management_app/core/models/user_model.dart';
import 'package:task_management_app/core/services/database/database_services/database_interface/users_database.dart';
import 'package:task_management_app/core/utils/functions/custom_typedef.dart';

class UsersDatabaseFirestore implements UsersDatabase{
  CollectionReference<UserModel> getUsersCollection(){
    return FirebaseFirestore.instance.collection(UserModel.collectionName).withConverter(
      fromFirestore: (snapshot, options) =>
          UserModel.fromFJson(snapshot.data()),
      toFirestore: (value, options) => value.toJson(),
    );
  }
  @override
  Future<void> createUserInDatabase({required UserModel userModel})async {
    var usersCollection = getUsersCollection();
    var doc = usersCollection.doc(userModel.id);
    await doc.set(userModel);
  }

  @override
  Future<void> modifyAFieldInAUserInADatabase({required String uid,required Map<String, dynamic> newData})async {
    var doc = getUsersCollection().doc(uid);
    await doc.update(newData);
  }

  @override
  Future<UserModel?> getUserFromDatabase({required String uid})async {
    var doc = getUsersCollection().doc(uid);
    var docSnapshot = await doc.get();
    return docSnapshot.data();
  }

  @override
  void listenIngUserModelInDatabase({required String uid, required EventFunction executeFunction}) {
    getUsersCollection().doc(uid).snapshots().listen((event) {
      executeFunction(event.data());
    },);
  }

  @override
  Future<void> removeUserFromDatabase({required String uId}) async{
    var usersCollection = getUsersCollection();
    var doc = usersCollection.doc(uId);
    await doc.delete();
  }
}