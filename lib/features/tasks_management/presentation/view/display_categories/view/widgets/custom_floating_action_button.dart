import 'package:flutter/material.dart';
import '../../../../../../../core/utils/theme/constant_colors.dart';
import '../../../../../../../material_application.dart';

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
          onPressed: onPressed,
          child: IconButton(
            onPressed: onPressed,
            icon: Icon(Icons.add, color: textThemeApp.secondPrimaryColor),
          ),
        ),
      ),
    );
  }
}