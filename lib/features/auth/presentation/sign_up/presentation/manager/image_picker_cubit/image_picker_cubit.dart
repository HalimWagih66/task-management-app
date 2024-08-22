import 'dart:io';
import 'package:bloc/bloc.dart';

import '../../../../../../../core/utils/functions/image_picker/image_picker_functions.dart';

part 'image_picker_state.dart';

class ImagePickerCubit extends Cubit<ImagePickerState> {
  ImagePickerCubit() : super(ImagePickerInitial());
  File? pickedImage;

  Future<bool> onPressedCamera() async {
    var tempPickedImage = await ImagePackerFunctions.cameraPicker();
    if (tempPickedImage != null) {
      changePickImage(tempPickedImage);
      return true;
    }
    return false;
  }

  Future<bool> onPressedGallery() async {
    File? tempPickedImage = await ImagePackerFunctions.galleryPicker();
    if (tempPickedImage != null) {
      changePickImage(tempPickedImage);
      return true;
    }
    return false;
  }

  void changePickImage(File pickImage) {
    pickedImage = pickImage;
    emit(ImagePickerSuccess(file: pickImage));
  }
  void checkPickedImageNullOrNo(){
    if(pickedImage == null){
      emit(CheckPickedImageIsNull());
    }else{
      emit(CheckPickedImageIsNotNull());
    }
  }

}
