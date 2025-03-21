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
      radius: secondRadios+4,
      backgroundColor: primaryColorApp,
      child: CircleAvatar(
        radius: secondRadios+2,
        backgroundColor: Colors.white,
        child: CircleAvatar(
          radius: secondRadios,
          backgroundColor: Colors.white,
          child: AspectRatio(
            aspectRatio: 1,
            child: child
          ),
        ),
      ),
    );
  }
}