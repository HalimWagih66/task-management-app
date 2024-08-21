import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_management_app/core/services/firebase/services/database_services.dart';
import 'package:task_management_app/core/services/service_locator.dart';
import 'package:task_management_app/core/utils/functions/validate/validate_inputs_from_text_valid.dart';
import 'package:task_management_app/core/utils/theme/constant_colors.dart';
import 'package:task_management_app/core/utils/widgets/TextFormField/custom_form_field.dart';
import 'package:task_management_app/core/utils/widgets/buttons/custom_elevated_button.dart';
import 'package:task_management_app/features/profile/presentation/home_layout_profile/cubits/home_layout_profile_cubit.dart';
import 'package:task_management_app/features/profile/presentation/home_layout_profile/view/taps/edit_profile/manager/change_image_cubit/change_image_cubit.dart';
import 'package:task_management_app/features/profile/presentation/home_layout_profile/view/taps/edit_profile/view/widgets/custom_picked_image_for_change_body.dart';
import 'package:task_management_app/material_application.dart';
import '../../../../../../../../core/utils/constant/sentence/firebase_storage_constant.dart';
import '../../../../../../../../core/utils/widgets/custom_app_bar.dart';
import '../../../../../../../home_layout/presentation/manager/user_model_cubit/user_model_cubit.dart';

class EditProfileView extends StatelessWidget {
  const EditProfileView({super.key});

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
                    databaseServices: getIt.get<DatabaseServices>()),
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  children: [
                    CustomTextFormField(
                      contentPadding: 10,
                      textLabel: "Name",
                      initialValue: userModel.name,
                      functionValidate: (name) {
                        return ValidateInputsFromTextValid.validateNameValid(
                            name);
                      },
                    ),
                    const SizedBox(height: 25),
                    CustomTextFormField(
                      contentPadding: 10,
                      textLabel: "Email",
                      enabled: false,
                      initialValue: userModel.email,
                      functionValidate: (name) {
                        return ValidateInputsFromTextValid.validateNameValid(
                            name);
                      },
                    ),
                    const SizedBox(height: 25),
                    CustomTextFormField(
                      contentPadding: 10,
                      textLabel: "Password",
                      initialValue: "******",
                      obscureText: true,
                      functionValidate: (name) {
                        return ValidateInputsFromTextValid.validateNameValid(name);
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 25),
              CustomElevatedButton(
                background: primaryColorApp,
                child: Text("Save Changes",
                    style: textThemeApp.font18SecondPrimaryBold),
                onPressed: () {},
              ),
              const SizedBox(height: 10)
            ],
          ),
        )
      ],
    );
  }
}
