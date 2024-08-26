import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_management_app/core/utils/constant/firebase/firebase_storage_constant.dart';
import 'package:task_management_app/features/profile/data/repos/profile_repo.dart';
part  'edit_profile_form_state.dart';


class EditProfileFormCubit extends Cubit<EditProfileFormState> {
  ProfileRepo profileRepo;
  File? pickImage;
  EditProfileFormCubit({required this.profileRepo}) : super(EditProfileFormInitial());

  Future<void> editFieldInUserInDatabase({required Map<String, dynamic> newData,required uid,required String editType})async{
    emit(EditProfileFormLoading());
    var result = await profileRepo.editFieldInUserInDatabase(uid: uid,newData: newData);
    result.fold((failure) {
      emit(EditProfileFormFailure(failure.message));
    }, (success) {
      emit(EditProfileFormSuccess(editType: editType));
    },);
  }

  Future<void> changePassword({required String newPassword})async{
    emit(EditProfileFormLoading());
    var result = await profileRepo.changePassword(newPassword: newPassword);
    result.fold((failure) {
      emit(EditProfileFormFailure(failure.message));
    }, (success) {
      emit(EditProfileFormSuccess(editType: "password"));
    },);
  }
  Future<void> changeUserImage({required File file,required String uid})async{
    emit(EditProfileFormLoading());
    var result = await profileRepo.uploadFileInDatabase(file: file,pathTheFile: FirebaseStorageConstant.getPathTheImage(email: FirebaseAuth.instance.currentUser!.email!, folderName: FirebaseStorageConstant.person),fileName: FirebaseStorageConstant.userImageFileName);
    result.fold((failure) {
      emit(EditProfileFormFailure(failure.message));
    }, (imageUrl) async{
      await editFieldInUserInDatabase(uid: uid,newData: {"imageUrl":imageUrl},editType: "image");
    },);
  }
}
