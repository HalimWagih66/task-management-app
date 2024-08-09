


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_management_app/core/utils/theme/constant_colors.dart';
import 'package:task_management_app/core/utils/theme/text_theme_app.dart';

class TextThemeLight implements TextThemeApp{
  @override
  TextStyle font32SecondPrimaryExtraBold = GoogleFonts.plusJakartaSans(
    fontSize: 32.sp,
    color: secondPrimaryLightColor,
    fontWeight: FontWeight.w800,
  );
  @override
  TextStyle font13SecondPrimaryRegular = GoogleFonts.plusJakartaSans(
    fontSize: 13.sp,
    color: secondPrimaryLightColor,
    fontWeight: FontWeight.w400,
  );
  @override
  TextStyle font18ThirdPrimaryBold = GoogleFonts.plusJakartaSans(
    fontSize: 18.sp,
    color: thirdPrimaryLightColor,
    fontWeight: FontWeight.w700,
  );
}