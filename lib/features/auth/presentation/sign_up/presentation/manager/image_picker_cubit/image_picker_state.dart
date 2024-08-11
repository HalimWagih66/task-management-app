part of 'image_picker_cubit.dart';

class ImagePickerState {}

final class ImagePickerInitial extends ImagePickerState {}

final class ImagePickerSuccess extends ImagePickerState {
  File file;
  ImagePickerSuccess({required this.file});
}

final class CheckPickedImageIsNull extends ImagePickerState {}

final class CheckPickedImageIsNotNull extends ImagePickerState {}
