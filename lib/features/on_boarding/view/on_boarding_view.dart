import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_management_app/core/utils/theme/constant_colors.dart';
import 'package:task_management_app/core/utils/widgets/buttons/animated_button.dart';
import 'package:task_management_app/features/on_boarding/view/widgets/display_image_on_boarding.dart';
import 'package:task_management_app/features/on_boarding/view/widgets/user_question_about_registration.dart';
import '../../../app.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({super.key});
  static const routeName = "/";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryLightColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const SizedBox(height: 50),
            const DisplayImageOnBoarding(),
            Text(
              "Organize your to make a productive day",
              style: themeApp.font32SecondPrimaryExtraBold,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Text(
                "completing the priority tasks or getting the results that can help you maove the project forwerd",
                style: themeApp.font13SecondPrimaryRegular,
              ),
            ),
            CustomAnimatedButton(
              textStyle: themeApp.font18ThirdPrimaryBold.copyWith(fontSize: 14.sp,color: secondPrimaryLightColor),
              text: "Get Started",
              backgroundColor: thirdPrimaryLightColor,
              pressEven: () {},
            ),
            const SizedBox(height: 20),
            UserQuestionAboutRegistration(questionText: "Already have an account?",actionText: "Login",onPressed: () {
              },),
            const SizedBox(height: 20)
          ],
        ),
      ),
    );
  }
}