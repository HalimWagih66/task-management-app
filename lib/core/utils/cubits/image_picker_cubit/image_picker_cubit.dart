import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:task_management_app/core/utils/functions/image_picker/check_image_picker.dart';
part 'image_picker_state.dart';

class ImagePickerCubit extends Cubit<ImagePickerState> {
  ImagePickerCubit() : super(ImagePickerInitial());
  File? pickedImage;

  Future<void> onPressedCamera() async {
    emit(ImagePickerLoading());
    pickedImage = await CheckImagePicker.onPressedCamera();
    checkPickImageNullOrNot();
  }

  Future<void> onPressedGallery() async {
    emit(ImagePickerLoading());
    pickedImage = await CheckImagePicker.onPressedGallery();
    checkPickImageNullOrNot();
  }
  void checkPickImageNullOrNot(){
    if(pickedImage == null){
      emit(ImagePickerFailure(errorMessage: "Image not selected."));
    }else{
      emit(ImagePickerSuccess(file: pickedImage));
    }
  }
  bool checkPickImageNullOrNotWithoutEmitSuccess(){
    if(pickedImage == null){
      emit(ImagePickerFailure(errorMessage: "Image not selected."));
      return false;
    }else{
      return true;
    }
  }
}
