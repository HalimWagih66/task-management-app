import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_management_app/provider/settings_provider.dart';

void showMessageWithAwesomeDialog({
    required BuildContext context,
    required String message,
    required DialogType dialogType,
    String? title,
    String? okActionName,
  void Function()? btnOkOnPress,
  void Function()? btnCancelOnPress,
  bool dismissOnTouchOutside = false,
    String? cancelActionName,
    Function? cancelAction,
  }) {
  var textThemeApp = Provider.of<SettingsProvider>(context,listen: false).textThemeApp;
    AwesomeDialog(
      dismissOnTouchOutside: dismissOnTouchOutside,
      dialogBackgroundColor: textThemeApp.secondPrimaryColor,
      context: context,
      dialogType: dialogType,
      title: title,
      titleTextStyle: textThemeApp.font17PrimaryMedium.copyWith(fontSize: 21),
      animType: AnimType.rightSlide,
      desc: message,
      descTextStyle: textThemeApp.font17PrimaryMedium,
      btnCancelOnPress: btnCancelOnPress,
      btnOkOnPress: btnOkOnPress,
      btnOkText: okActionName,
      btnCancelText: cancelActionName,
    ).show();
}
