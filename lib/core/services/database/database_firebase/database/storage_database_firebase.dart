import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:task_management_app/core/services/database/database_services/database_interface/storage_database.dart';

import '../../../../errors/exceptions.dart';

class StorageDatabaseFirebase implements StorageDatabase{
  @override
  Future<String> uploadFileInDatabase({required String pathTheFile, required File file, required String fileName}) async{
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