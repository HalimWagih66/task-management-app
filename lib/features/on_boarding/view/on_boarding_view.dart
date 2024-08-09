import 'package:flutter/material.dart';
import 'package:task_management_app/core/utils/theme/constant_colors.dart';
import 'package:task_management_app/features/on_boarding/view/widgets/on_boarding_body.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({super.key});
  static const routeName = "/";
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: primaryColorApp,
      body: OnBoardingBody()
    );
  }
}