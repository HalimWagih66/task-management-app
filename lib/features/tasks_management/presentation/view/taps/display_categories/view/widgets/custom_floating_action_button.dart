import 'package:flutter/material.dart';

import '../../../../../../../../core/utils/style/theme/constant_colors.dart';
import '../../../../../../../../task_management_app.dart';


class CustomFloatingActionButton extends StatelessWidget {
  const CustomFloatingActionButton({super.key, this.onPressed,});
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 18.0),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: FloatingActionButton(
          backgroundColor: primaryColorApp,
          onPressed: () {
            onPressed!();
          },
          child: Icon(
             Icons.add, color: textThemeApp.secondPrimaryColor,
          ),
        ),
      ),
    );
  }
}