import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DisplayImageOnBoarding extends StatelessWidget {
  const DisplayImageOnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 292.h,
      child: AspectRatio(
        aspectRatio: 320/292,
        child: Image.asset("assets/images/on_boarding/onboarding_image.png"),
      ),
    );
  }
}
