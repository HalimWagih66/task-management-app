import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_management_app/provider/settings_provider.dart';
import 'custom_elevated_button_in_auth.dart';
import 'display_sign_up_with_method.dart';

class DisplayRegistrationMethods extends StatelessWidget {
  const DisplayRegistrationMethods({
    super.key, required this.titleButtonGoogle, required this.titleButtonApple, required this.titleButtonWithEmail,
  });
  final String titleButtonGoogle;
  final String titleButtonApple;
  final String titleButtonWithEmail;
  @override
  Widget build(BuildContext context) {
    var textStyleApp = Provider.of<SettingsProvider>(context).textThemeApp;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        CustomElevatedButtonInAuth(
            onPressed: () {

            }, background:  Colors.yellow,
            child:  Text(titleButtonWithEmail,style: textStyleApp.font17PrimaryMedium)

        ),
        const SizedBox(height: 15),
        CustomElevatedButtonInAuth(
            onPressed: () {

            }, background: const Color(0xff000000),
            child: DisplaySignUpWithMethod(text: titleButtonApple, image: 'assets/images/auth/apple-logo.png',colorText: Colors.white,)
        ),
        const SizedBox(height: 15),
        CustomElevatedButtonInAuth(
            onPressed: () {

            }, background: const Color(0xfff0f5f2), child: DisplaySignUpWithMethod(text: titleButtonGoogle, image: 'assets/images/auth/google-logo.png',)
        ),
      ],
    );
  }
}


