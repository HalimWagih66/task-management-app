
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_management_app/provider/settings_provider.dart';

ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showMessageWithSnackBar({required Color background,required String message,required BuildContext context}){
  var texTStyleApp = Provider.of<SettingsProvider>(context,listen: false).textThemeApp;
   return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
       backgroundColor: background,
       duration: const Duration(seconds: 5),
       content: Text(message,style: Provider.of<SettingsProvider>(context,listen: false).textThemeApp.font17PrimaryMedium.copyWith(color: texTStyleApp.secondPrimaryColor)),
     ),
   );
}