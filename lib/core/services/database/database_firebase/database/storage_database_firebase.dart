import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:task_management_app/core/services/database/database_services/database_interface/storage_database.dart';
import '../../../../errors/exceptions/custom_firebase_exception.dart';
import '../../../../errors/exceptions/exceptions.dart';


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
      throw CustomFirebaseException.fromFirebaseStorage(e.code);
    } catch (e) {
      throw UnknownException(errorMessage:toString());
    }
  }

  @override
  Future<void> removeFileInDatabase({required String pathTheFile, required String fileName}) async{
    try {
      FirebaseStorage firebaseStorage = FirebaseStorage.instanceFor(bucket: "gs://task-management-952ef.appspot.com");
      Reference reference = firebaseStorage.ref(pathTheFile).child(fileName);
      await reference.delete();
    } on FirebaseException catch (e) {
      throw CustomFirebaseException.fromFirebaseStorage(e.code);
    } catch (e) {
      throw UnknownException(errorMessage:e.toString());
    }
  }
}