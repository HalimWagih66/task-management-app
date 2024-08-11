import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:task_management_app/features/auth/presentation/log_in/manager/log_in_bloc.dart';
import '../../../../../../core/utils/widgets/user_question_about_registration.dart';
import '../../../../../../provider/settings_provider.dart';
import '../../../sign_up/presentation/view/sign_up_view.dart';
import 'display_login_methods.dart';
import 'log_in_from.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});


  @override
  Widget build(BuildContext context) {
    var formKey = GlobalKey<FormState>();
    var textStyleApp = Provider.of<SettingsProvider>(context).textThemeApp;
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Welcome Back",style: textStyleApp.font32PrimaryExtraBold),
                const SizedBox(
                  height: 10,
                ),
                Text("Enter Your Credential to continue",style: textStyleApp.font15greyRegular),
                const SizedBox(
                  height: 15,
                ),
                Form(
                  key: formKey,
                  child: const LogInFrom(),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                      onPressed: () {
                      },
                      child: Text("Forget Password?",style: textStyleApp.font15greyRegular,)
                  ),
                ),
                SizedBox(
                  height: 17.h,
                ),
                 DisplayLoginMethods(
                   onPressedLoginByEmail: () {
                   if(formKey.currentState!.validate()){
                     BlocProvider.of<LogInBloc>(context).add(LogInByEmailAndPassword());
                   }
                },),
                const SizedBox(height: 10),
                const Spacer(),
                const UserQuestionAboutRegistration(questionText: "Don't have account? ", actionText: "Sign Up", routeName: SignUpView.routeName),
                SizedBox(
                  height: 30.h,
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}