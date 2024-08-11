
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_management_app/provider/settings_provider.dart';

ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showMessageWithSnackPar({required Color background,required String message,required BuildContext context}){
   return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
       backgroundColor: background,
       content: Text(message,style: Provider.of<SettingsProvider>(context,listen: false).textThemeApp.font18SecondPrimaryBold),
     ),
   );
}