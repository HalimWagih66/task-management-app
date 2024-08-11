import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:task_management_app/core/errors/exceptions.dart';
import 'package:task_management_app/core/models/user_model.dart';
import 'package:task_management_app/core/services/firebase/database_services.dart';

class FirebaseDataBase implements DatabaseServices{
   CollectionReference<UserModel> getUsersCollection({required String collectionName}){
    return FirebaseFirestore.instance.collection(collectionName).withConverter(
      fromFirestore: (snapshot, options) =>
          UserModel.fromFJson(snapshot.data()),
      toFirestore: (value, options) => value.toJson(),
    );
  }
   @override
  Future<void> createUser({required Map<String,dynamic> userJson,required String collectionName})async{
     UserModel userModel = UserModel.fromFJson(userJson);
    var usersCollection = getUsersCollection(collectionName:collectionName);
    var doc = usersCollection.doc(userModel.id);
    await doc.set(userModel);
  }
  @override
  Future<void> removeUser({required String uId, required String collectionName})async{
    var usersCollection = getUsersCollection(collectionName: collectionName);
    var doc = usersCollection.doc(uId);
    await doc.delete();
  }
  @override
  Future<UserModel?> getUser({required String uid, required String collectionName})async{
    var doc = getUsersCollection(collectionName: collectionName).doc(uid);
    var docSnapshot = await doc.get();
    return docSnapshot.data();
  }
   @override
  Future<void> editFieldInUser({required String uid,required String collectionName, required Map<String, dynamic> newData})async{
    var doc = getUsersCollection(collectionName: collectionName).doc(uid);
    await doc.update(newData);
  }

  @override
  Future<String> uploadFileInDatabase({required String pathTheFile, required File file,required String fileName}) async {
     try {
       FirebaseStorage firebaseStorage = FirebaseStorage.instanceFor(bucket: "gs://task-management-952ef.appspot.com");
       Reference reference = firebaseStorage.ref(pathTheFile).child(fileName);
       UploadTask uploadTask = reference.putFile(file);
       TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() {});
       return await taskSnapshot.ref.getDownloadURL();
     } on FirebaseException catch (e) {
       switch (e.code) {
         case 'storage/unauthorized':
           throw CustomException(errorMessage: "You are not authorized to store files on the server");
         case 'storage/quota-exceeded':
           throw CustomException(errorMessage: "The specified quota has been filled , try again later ");
         default:
           throw CustomException(errorMessage: e.code);
       }
     } catch (e) {
       throw CustomException(errorMessage: e.toString());
     }
   }
}