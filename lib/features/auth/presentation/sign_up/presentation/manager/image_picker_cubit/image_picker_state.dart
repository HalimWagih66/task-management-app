part of 'image_picker_cubit.dart';

class ImagePickerState {}

final class ImagePickerInitial extends ImagePickerState {}

final class ImagePickerSuccess extends ImagePickerState {
  String? imageUrl;
  File? file;
  ImagePickerSuccess({this.file,this.imageUrl});
}

final class ImagePickerLoading extends ImagePickerState {}

final class CheckPickedImageIsNull extends ImagePickerState {}

final class CheckPickedImageIsNotNull extends ImagePickerState {}
