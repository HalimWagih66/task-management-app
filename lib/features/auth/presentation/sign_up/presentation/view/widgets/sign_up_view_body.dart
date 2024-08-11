import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:task_management_app/features/auth/presentation/sign_up/presentation/manager/image_picker_cubit/image_picker_cubit.dart';
import 'package:task_management_app/features/auth/presentation/sign_up/presentation/manager/sign_up_bloc/sign_up_bloc.dart';
import 'package:task_management_app/provider/settings_provider.dart';
import '../../../../../../../core/utils/widgets/user_question_about_registration.dart';
import 'custom_picked_image.dart';
import 'display_registration_methods.dart';
import 'form_sign_up.dart';

class SignUpViewBody extends StatelessWidget {
  const SignUpViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var textStyleApp = Provider.of<SettingsProvider>(context).textThemeApp;
    var formKey = GlobalKey<FormState>();
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text("Create Account", style: textStyleApp.font32PrimaryExtraBold),
                const SizedBox(height: 10),
                Text("Sign up to get Started!", style: textStyleApp.font15greyRegular),
                const SizedBox(
                  height: 20,
                ),
                const CustomPickedImage(),
                const SizedBox(height: 25),
                Form(
                  key: formKey,
                  child: const FormSignUp(),
                ),
                const SizedBox(height: 25),
                DisplayRegistrationMethods(
                  onPressedSigInWithEmail: () {
                    BlocProvider.of<ImagePickerCubit>(context).checkPickedImageNullOrNo();
                    if(formKey.currentState!.validate()){
                      if(BlocProvider.of<ImagePickerCubit>(context).pickedImage != null){
                        BlocProvider.of<SignUpBloc>(context).add(SignUpWithEmailAndPassword());
                      }
                    }
                  },
                  titleButtonWithEmail: "Sign Up",
                  titleButtonGoogle: "Sign Up Using Google",
                ),
                UserQuestionAboutRegistration(
                  questionText: "Already have an account?",
                  actionText: "Login",
                  onPressed: () {

                  },
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
