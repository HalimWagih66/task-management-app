
import 'package:flutter/material.dart';
import '../../../../task_management_app.dart';

class CustomDisplayError extends StatelessWidget {
  const CustomDisplayError({
    super.key, required this.errorMessage,
  });
  final String errorMessage;
  @override
  Widget build(BuildContext context) {
    return Center(child: Text(errorMessage,style: textThemeApp.font18SecondPrimaryBold.copyWith(color: textThemeApp.primaryColor),));
  }
}