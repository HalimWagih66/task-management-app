import 'dart:io';

import 'image_picker_functions.dart';

class CheckImagePicker{
  static Future<File?> onPressedCamera() async {
    File? pickImage = await ImagePackerFunctions.cameraPicker();
    if (pickImage != null) {
      return pickImage;
    }
    return null;
  }
  static Future<File?> onPressedGallery() async {
    File? pickImage = await ImagePackerFunctions.galleryPicker();
    if (pickImage != null) {
      return pickImage;
    }
    return null;
  }
}