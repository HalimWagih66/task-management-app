import 'package:flutter/material.dart';
import 'package:task_management_app/core/services/firebase/services/database_services.dart';
import 'package:task_management_app/features/auth/presentation/sign_up/presentation/manager/image_picker_cubit/image_picker_cubit.dart';

part 'change_image_state.dart';

class ChangeImageCubit extends ImagePickerCubit {
  DatabaseServices databaseServices;
  ChangeImageCubit({required this.databaseServices});
  Future<void> changeImageByCamera({required String fileName, required String pathTheFile,required String uid})async{
    if(await super.onPressedCamera()){
      emit(ImagePickerLoading());
      String imageUrl = await caseImagePickerInNotNull(pathTheFile:pathTheFile, fileName:fileName,uid: uid);
      emit(ImagePickerSuccess(imageUrl: imageUrl));
    }
  }

  Future<void> changeImageByGallery({required String fileName, required String pathTheFile,required String uid})async{
    if(await super.onPressedGallery()){
      emit(ImagePickerLoading());
      String imageUrl = await caseImagePickerInNotNull(pathTheFile:pathTheFile, fileName:fileName,uid: uid);
      emit(ImagePickerSuccess(imageUrl: imageUrl));
    }
  }

  Future<String> caseImagePickerInNotNull({required String pathTheFile,required String fileName,required String uid}) async {
    var imageUrl = await databaseServices.uploadFileInDatabase(pathTheFile: pathTheFile, file: super.pickedImage!, fileName: fileName);
    await databaseServices.editFieldInUser(uid: uid, collectionName: "users", newData: {"imageUrl":imageUrl});
    return imageUrl;
  }
}
