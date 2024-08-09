import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_management_app/provider/settings_provider.dart';

class UserQuestionAboutRegistration extends StatelessWidget {
  const UserQuestionAboutRegistration({super.key,
    required this.questionText,
    required this.actionText,
    this.onPressed});
  final String questionText;
  final String actionText;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    var textThemeApp = Provider.of<SettingsProvider>(context).textThemeApp;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(questionText, style: textThemeApp.font13PrimaryRegular.copyWith(color: textThemeApp.secondPrimaryColor)),
        TextButton(
          style: TextButton.styleFrom(padding: EdgeInsets.zero),
          onPressed: onPressed,
          child: Text(actionText, style: textThemeApp.font13PrimaryRegular.copyWith(fontWeight: FontWeight.w900,color: textThemeApp.secondPrimaryColor)),
        )
      ],
    );
  }
}
