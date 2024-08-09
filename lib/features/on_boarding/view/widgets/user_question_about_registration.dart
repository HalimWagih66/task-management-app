import 'package:flutter/material.dart';

import '../../../../app.dart';

class UserQuestionAboutRegistration extends StatelessWidget {
  const UserQuestionAboutRegistration({
    super.key,
    required this.questionText,
    required this.actionText,
    this.onPressed,
  });

  final String questionText;
  final String actionText;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(questionText, style: themeApp.font13SecondPrimaryRegular),
        TextButton(
          style: TextButton.styleFrom(padding: EdgeInsets.zero),
          onPressed: onPressed,
          child: Text(actionText, style: themeApp.font13SecondPrimaryRegular.copyWith(fontWeight: FontWeight.w900)),
        )
      ],
    );
  }
}
