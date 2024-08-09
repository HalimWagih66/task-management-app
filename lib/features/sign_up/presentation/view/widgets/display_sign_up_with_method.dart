import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_management_app/provider/settings_provider.dart';

class DisplaySignUpWithMethod extends StatelessWidget {
  const DisplaySignUpWithMethod({
    super.key, required this.image, required this.text, this.colorText,
  });
  final String image;
  final String text;
  final Color? colorText;
  @override
  Widget build(BuildContext context) {
    var textStyleApp = Provider.of<SettingsProvider>(context).textThemeApp;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(image,height: 22,color: colorText),
        const SizedBox(width: 5),
        Text(text,style: textStyleApp.font17PrimaryMedium.copyWith(color: colorText)),
      ],
    );
  }
}
