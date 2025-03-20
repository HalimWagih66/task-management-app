
import 'package:flutter/material.dart';
import 'package:task_management_app/task_management_app.dart';


ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showMessageWithSnackBar({required Color background,required String message,required BuildContext context}){
   return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
       backgroundColor: background,
       duration: const Duration(seconds: 5),
       content: Text(message,style: textThemeApp.font17PrimaryMedium.copyWith(color: textThemeApp.secondPrimaryColor)),
     ),
   );
}