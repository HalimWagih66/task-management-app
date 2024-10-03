import 'package:flutter/material.dart';
import 'package:task_management_app/core/utils/style/theme/constant_colors.dart';
class CustomCircleImage extends StatelessWidget {
   const CustomCircleImage( {super.key, required this.child, required this.firstRadios, required this.secondRadios,});
  final Widget child;
  final double firstRadios;
  final double secondRadios;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: primaryColorApp,
      radius: firstRadios,
      child: CircleAvatar(
        radius: secondRadios,
        backgroundColor: Colors.white,
        child: child
      ),
    );
  }
}