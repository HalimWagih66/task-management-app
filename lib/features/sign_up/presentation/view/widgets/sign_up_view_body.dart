import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_management_app/provider/settings_provider.dart';
import '../../../../../core/utils/widgets/user_question_about_registration.dart';
import 'display_registration_methods.dart';
import 'form_sign_up.dart';

class SignUpViewBody extends StatelessWidget {
  const SignUpViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var textStyleApp = Provider.of<SettingsProvider>(context).textThemeApp;
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text("Create Account",style: textStyleApp.font32PrimaryExtraBold),
                const SizedBox(height: 10),
                Text("Sign up to get Started!",style: textStyleApp.font15greyRegular),
                const SizedBox(height: 25),
                const FormSignUp(),
                const SizedBox(height: 25),
                const DisplayRegistrationMethods(
                  titleButtonWithEmail: "Sign Up",
                  titleButtonApple: "Sign Up Using Apple",
                  titleButtonGoogle: "Sign Up Using Google",
                ),

                UserQuestionAboutRegistration(questionText: "Already have an account?",actionText: "Login",onPressed: () {},),
              ],
            ),
          ),
        )
      ],
    );
  }
}
