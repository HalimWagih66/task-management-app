import 'dart:io';

abstract class StorageDatabase{
  Future<String> uploadFileInDatabase({required String pathTheFile, required File file,required String fileName});
  Future<void> removeFileInDatabase({required String pathTheFile,required String fileName});

}