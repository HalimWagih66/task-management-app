import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:task_management_app/core/utils/widgets/custom_app_bar.dart';
import 'package:task_management_app/features/sign_up/presentation/view/widgets/sign_up_view_body.dart';

class SignUpView extends StatelessWidget  {
  const SignUpView({super.key});
  static const routeName = "/SignUpView";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: CustomAppBar(
       onPressed: () {
         GoRouter.of(context).pop();
       },
       title: "Sign Up",
       backgroundColor: Colors.transparent,
       leadingIconData: Icons.arrow_back_ios,
     ),
      body: const SignUpViewBody(),
    );
  }
}

