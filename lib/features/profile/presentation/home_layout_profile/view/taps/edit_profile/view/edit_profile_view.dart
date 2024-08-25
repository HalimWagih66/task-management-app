import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_management_app/core/services/service_locator.dart';
import 'package:task_management_app/core/utils/theme/constant_colors.dart';
import 'package:task_management_app/core/utils/widgets/buttons/custom_elevated_button.dart';
import 'package:task_management_app/features/profile/data/profile_repo.dart';
import 'package:task_management_app/features/profile/presentation/home_layout_profile/cubits/home_layout_profile_cubit.dart';
import 'package:task_management_app/features/profile/presentation/home_layout_profile/view/taps/edit_profile/manager/change_image_cubit/change_image_cubit.dart';
import 'package:task_management_app/features/profile/presentation/home_layout_profile/view/taps/edit_profile/manager/edit_profile_form/edit_profile_form_cubit.dart';
import 'package:task_management_app/features/profile/presentation/home_layout_profile/view/taps/edit_profile/view/widgets/custom_display_save_changes_for_edit_profile.dart';
import 'package:task_management_app/features/profile/presentation/home_layout_profile/view/taps/edit_profile/view/widgets/custom_picked_image_for_change_body.dart';
import 'package:task_management_app/features/profile/presentation/home_layout_profile/view/taps/edit_profile/view/widgets/form_edit_profile.dart';
import '../../../../../../../../core/utils/constant/firebase/firebase_storage_constant.dart';
import '../../../../../../../../core/utils/widgets/custom_app_bar.dart';
import '../../../../../../../home_layout/presentation/manager/user_model_cubit/user_model_cubit.dart';

class EditProfileView extends StatefulWidget {
  const EditProfileView({super.key});

  @override
  State<EditProfileView> createState() => _EditProfileViewState();
}

class _EditProfileViewState extends State<EditProfileView> {
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var userModel = BlocProvider.of<UserModelCubit>(context).userModel;
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CustomAppBar(
                title: "Edit Profile",
                backgroundColor: Colors.transparent,
                leadingIconData: Icons.arrow_back_ios,
                onPressed: () {
                  BlocProvider.of<HomeLayoutProfileCubit>(context)
                      .animateToPage(0);
                },
              ),
              BlocProvider(
                create: (context) => ChangeImageCubit(
                    profileRepo: getIt.get<ProfileRepo>()),
                child: CustomPickedImageForChangeBody(
                  imageUrl: userModel!.imageUrl!,
                  pathTheFile: FirebaseStorageConstant.getPathTheImage(
                      email: userModel.email!,
                      folderName: FirebaseStorageConstant.person),
                  fileName: FirebaseStorageConstant.userImageFileName,
                  uid: userModel.email!,
                ),
              ),
              const Spacer(
                flex: 2,
              ),
              BlocProvider(
                create: (context) =>
                    EditProfileFormCubit(profileRepo: getIt.get<ProfileRepo>()),
                child: Column(
                  children: [
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
                        onPressed: () {
                          if(formKey.currentState!.validate()) {
                            print("validate form");
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10)
            ],
          ),
        )
      ],
    );
  }
}
