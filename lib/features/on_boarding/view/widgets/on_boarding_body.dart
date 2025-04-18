import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:task_management_app/features/auth/presentation/log_in/view/login_view.dart';
import 'package:task_management_app/features/auth/presentation/sign_up/presentation/view/sign_up_view.dart';
import '../../../../core/utils/widgets/buttons/animated_button.dart';
import '../../../../core/utils/widgets/questions/user_question_about_registration.dart';
import '../../../../task_management_app.dart';
import 'display_image_on_boarding.dart';

class OnBoardingBody extends StatelessWidget {
  const OnBoardingBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const SizedBox(height: 50),
          const DisplayImageOnBoarding(),
          Text(
            "Organize your to make a productive day",
            style: textThemeApp.font32PrimaryExtraBold.copyWith(color: textThemeApp.secondPrimaryColor),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: Text(
              "completing the priority tasks or getting the results that can help you maove the project forwerd",
              style: textThemeApp.font13PrimaryRegular.copyWith(color: textThemeApp.secondPrimaryColor),
            ),
          ),
          CustomAnimatedButton(
            textStyle: textThemeApp.font18SecondPrimaryBold.copyWith(fontSize: 14.sp,color: textThemeApp.secondPrimaryColor),
            text: "Get Started",
            backgroundColor: textThemeApp.primaryColor,
            pressEven: () {
              GoRouter.of(context).replace(SignUpView.routeName);
            },
          ),
          const SizedBox(height: 20),
          UserQuestionAboutRegistration(questionText: "Already have an account?",actionText: "Login",routeName: LoginView.routeName,colorText: textThemeApp.secondPrimaryColor),
          const SizedBox(height: 20)
        ],
      ),
    );
  }
}
