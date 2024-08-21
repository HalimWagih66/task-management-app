
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:task_management_app/core/utils/widgets/display_images/custom_circle_image.dart';
import 'package:task_management_app/core/utils/widgets/display_images/custom_circle_image_for_file_image.dart';
import 'package:task_management_app/features/auth/presentation/sign_up/presentation/manager/sign_up_bloc/sign_up_bloc.dart';

import '../../../../../../../core/utils/widgets/dialogs/show_dialog_upload_image.dart';
import '../../../../../../../material_application.dart';
import '../../manager/image_picker_cubit/image_picker_cubit.dart';

class CustomPickedImage extends StatelessWidget {
  const CustomPickedImage({super.key});

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
            BlocProvider.of<SignUpBloc>(context).pickedImage = state.file;
            GoRouter.of(context).pop();
          }
        },
        builder: (context,state) {
          if(state is CheckPickedImageIsNull){
            return Column(
              children: [
                CustomCircleImage(
                child: CustomCircleImageForFileImage(imageProvider: imagePickerCubit.pickedImage == null?null:FileImage(imagePickerCubit.pickedImage!))
                ),
                const SizedBox(height: 20),
                Text("Please Enter your Image",style: textThemeApp.font13PrimaryRegular.copyWith(color: Colors.red),),
              ],
            );
          }
          return CustomCircleImage(
            child: CustomCircleImageForFileImage(
                imageProvider: imagePickerCubit.pickedImage == null?null:FileImage(imagePickerCubit.pickedImage!)
            ),
          );
        },
      ),
    );
  }
}
