import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../material_application.dart';

class UserQuestionAboutRegistration extends StatelessWidget {
  const UserQuestionAboutRegistration({super.key,
    required this.questionText,
    required this.actionText,
    required this.routeName, this.colorText});
  final String questionText;
  final String actionText;
  final Color? colorText;
  final String routeName;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(questionText, style: textThemeApp.font13PrimaryRegular.copyWith(color: colorText)),
        TextButton(
          style: TextButton.styleFrom(padding: EdgeInsets.zero),
          onPressed: () {
            GoRouter.of(context).replace(routeName);
          },
          child: Text(actionText, style: textThemeApp.font13PrimaryRegular.copyWith(fontWeight: FontWeight.w900,color: colorText)),
        )
      ],
    );
  }
}
