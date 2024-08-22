import 'package:task_management_app/features/auth/presentation/sign_up/presentation/manager/image_picker_cubit/image_picker_cubit.dart';
import 'package:task_management_app/features/profile/data/profile_repo.dart';


class ChangeImageCubit extends ImagePickerCubit {
  ProfileRepo profileRepo;
  ChangeImageCubit({required this.profileRepo});
  Future<void> changeImageByCamera({required String fileName, required String pathTheFile,required String uid})async{
    if(await super.onPressedCamera()){
      emit(ImagePickerLoading());
      await caseImagePickerInNotNull(pathTheFile:pathTheFile, fileName:fileName,uid: uid);
    }
  }

  Future<void> changeImageByGallery({required String fileName, required String pathTheFile,required String uid})async{
    if(await super.onPressedGallery()){
      emit(ImagePickerLoading());
      await caseImagePickerInNotNull(pathTheFile:pathTheFile, fileName:fileName,uid: uid);
    }
  }

  Future<void> caseImagePickerInNotNull({required String pathTheFile,required String fileName,required String uid}) async {
    var result = await profileRepo.uploadFileInDatabase(pathTheFile: pathTheFile, file: super.pickedImage!, fileName: fileName);
    result.fold((failure) {
      emit(ImagePickerFailure(errorMessage: failure.message));
    }, (imageUrl) async{
      await profileRepo.editFieldInUserInDatabase(uid: uid, collectionName: "users", newData: {"imageUrl":imageUrl});
      emit(ImagePickerSuccess(imageUrl: imageUrl));
    },);
  }
}
