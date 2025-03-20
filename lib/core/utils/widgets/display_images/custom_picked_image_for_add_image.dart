import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:task_management_app/core/utils/widgets/display_images/custom_circle_image.dart';
import 'package:task_management_app/core/utils/widgets/display_images/custom_circle_image_for_file_image.dart';
import '../../../../task_management_app.dart';
import '../../cubits/image_picker_cubit/image_picker_cubit.dart';
import '../dialogs/show_dialog_upload_image.dart';

class CustomPickedImageForAddImage extends StatelessWidget {
  const CustomPickedImageForAddImage({super.key, required this.caseImagePickerSuccess});
  final Function caseImagePickerSuccess;
  @override
  Widget build(BuildContext context) {
    var imagePickerCubit = BlocProvider.of<ImagePickerCubit>(context);
    return InkWell(
      highlightColor: Colors.transparent,
      hoverColor: Colors.transparent,
      splashColor: Colors.transparent,
      onTap: () {
        showDialogUploadImage(context: context, onPressedCamera: imagePickerCubit.onPressedCamera, onPressedGallery:imagePickerCubit.onPressedGallery);
      },
      child: BlocConsumer<ImagePickerCubit,ImagePickerState>(
        listener: (context,state) {
          if(state is ImagePickerSuccess){
            caseImagePickerSuccess();
            GoRouter.of(context).pop();
          }
        },
        builder: (context,state) {
          if(state is ImagePickerFailure){
            return Column(
              children: [
                const CustomCircleImage(
                  firstRadios: 77,
                  secondRadios: 80,
                child: CustomCircleImageForFileImage(imageProvider: null)
                ),
                const SizedBox(height: 5),
                Text("Please Enter category Image",style: textThemeApp.font13PrimaryRegular.copyWith(color: Colors.red),),
              ],
            );
          }
          return CustomCircleImage(
            firstRadios: 80,
            secondRadios: 77,
            child: CustomCircleImageForFileImage(
                imageProvider: imagePickerCubit.pickedImage == null?null:FileImage(imagePickerCubit.pickedImage!)
            ),
          );
        },
      ),
    );
  }
}
