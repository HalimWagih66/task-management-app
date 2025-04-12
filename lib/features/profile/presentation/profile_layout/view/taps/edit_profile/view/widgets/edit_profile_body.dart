import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../../../../core/utils/cubits/image_picker_cubit/image_picker_cubit.dart';
import '../../../../../../../../../core/utils/style/theme/constant_colors.dart';
import '../../../../../../../../../core/utils/widgets/buttons/custom_elevated_button.dart';
import '../../../../../../../../../core/utils/widgets/dialogs/show_dialog_upload_image.dart';
import '../../../../../../../../../core/utils/widgets/display_images/custom_picked_image_for_change_image.dart';
import '../../../../../../../../home_layout/presentation/manager/user_model_cubit/user_model_cubit.dart';
import '../../manager/edit_profile_form/edit_profile_form_cubit.dart';
import 'custom_display_save_changes_for_edit_profile.dart';
import 'form_edit_profile.dart';

class EditProfileBody extends StatefulWidget {
  const EditProfileBody({super.key});

  @override
  State<EditProfileBody> createState() => _EditProfileBodyState();
}

class _EditProfileBodyState extends State<EditProfileBody> {
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var userModel = BlocProvider.of<UserModelCubit>(context).userModel;
    return Column(
      children: [
        CustomPickedImageForChangeImage(
          caseImagePickerSuccess: (){
            BlocProvider.of<EditProfileFormCubit>(context).pickImage = BlocProvider.of<ImagePickerCubit>(context).pickedImage;
          },
          imageUrl: userModel!.imageUrl!,
          onTap: () {
            showDialogUploadImage(
              context: context,
              onPressedCamera: () async {
                await BlocProvider.of<ImagePickerCubit>(context).onPressedCamera();
              },
              onPressedGallery: () async {
                await BlocProvider.of<ImagePickerCubit>(context).onPressedGallery();
              },
            );
          },
        ),
        const Spacer(
          flex: 2,
        ),
        Form(
          key: formKey,
          child: FormEditProfile(userModel: userModel),
        ),
        const SizedBox(height: 25),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: CustomElevatedButton(
            background: primaryColorApp,
            child: const CustomDisplaySaveChangesForEditProfile(),
            onPressed: () async{
              if(formKey.currentState!.validate());
                if(BlocProvider.of<EditProfileFormCubit>(context).pickImage != null){
                  await BlocProvider.of<EditProfileFormCubit>(context).changeUserImage(file: BlocProvider.of<EditProfileFormCubit>(context).pickImage!,uid: userModel.id!);
                }
            },
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
