import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_management_app/core/utils/theme/constant_colors.dart';
class CustomCircleImage extends StatelessWidget {
  const CustomCircleImage( {super.key, required this.child,});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: primaryColorApp,
      radius: 80.w,
      child: CircleAvatar(
        radius: 77.w,
        backgroundColor: Colors.white,
        child: child
      ),
    );
  }
}