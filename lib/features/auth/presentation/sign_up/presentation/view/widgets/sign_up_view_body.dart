import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_management_app/features/auth/presentation/log_in/view/login_view.dart';
import 'package:task_management_app/features/auth/presentation/sign_up/presentation/manager/sign_up_bloc/sign_up_bloc.dart';
import '../../../../../../../core/utils/cubits/image_picker_cubit/image_picker_cubit.dart';
import '../../../../../../../core/utils/widgets/display_images/custom_picked_image_for_add_image.dart';
import '../../../../../../../core/utils/widgets/questions/user_question_about_registration.dart';
import '../../../../../../../task_management_app.dart';
import 'display_registration_methods.dart';
import 'form_sign_up.dart';

class SignUpViewBody extends StatelessWidget {
  const SignUpViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
                Text("Create Account", style: textThemeApp.font32PrimaryExtraBold),
                const SizedBox(height: 10),
                Text("Sign up to get Started!", style: textThemeApp.font15greyRegular),
                const SizedBox(
                  height: 20,
                ),
                CustomPickedImageForAddImage(caseImagePickerSuccess: (){
                  BlocProvider.of<SignUpBloc>(context).pickedImage = BlocProvider.of<ImagePickerCubit>(context).pickedImage;
                }),
                const SizedBox(height: 25),
                Form(
                  key: formKey,
                  child: const FormSignUp(),
                ),
                const SizedBox(height: 25),
                DisplayRegistrationMethods(
                  onPressedSigInWithEmail: () {
                    BlocProvider.of<ImagePickerCubit>(context).checkPickImageNullOrNot();
                    if(formKey.currentState!.validate()){
                      if(BlocProvider.of<SignUpBloc>(context).pickedImage != null){
                        BlocProvider.of<SignUpBloc>(context).add(SignUpWithEmailAndPassword());
                      }
                    }
                  },
                  titleButtonWithEmail: "Sign Up",
                  titleButtonGoogle: "Sign Up Using Google",
                ),
                const UserQuestionAboutRegistration(
                  questionText: "Already have an account?",
                  actionText: "Login",
                  routeName: LoginView.routeName,
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
