import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_management_app/core/utils/style/theme/constant_colors.dart';
import 'package:task_management_app/core/utils/style/theme/text_theme_app.dart';

class TextThemeLightApp implements TextThemeApp{
  @override
  TextStyle font32PrimaryExtraBold = GoogleFonts.plusJakartaSans(
    fontSize: 32.sp,
    color: primaryTextLightColor,
    fontWeight: FontWeight.w800,
  );
  @override
  TextStyle font13PrimaryRegular = GoogleFonts.plusJakartaSans(
    fontSize: 13.sp,
    color: primaryTextLightColor,
    fontWeight: FontWeight.w400,
  );
  @override
  TextStyle font18SecondPrimaryBold = GoogleFonts.plusJakartaSans(
    fontSize: 18.sp,
    color: secondPrimaryTextLightColor,
    fontWeight: FontWeight.w700,
  );
  @override
  TextStyle font15greyRegular = GoogleFonts.plusJakartaSans(
      fontSize: 15.sp,
      fontWeight: FontWeight.w400,
      color: Colors.grey
  );
  @override
  TextStyle font17PrimaryMedium = GoogleFonts.plusJakartaSans(
      fontWeight: FontWeight.w700,
      fontSize: 17.sp,
      color: primaryTextLightColor
  );

  @override
  Color primaryColor = primaryTextLightColor;

  @override
  Color secondPrimaryColor = secondPrimaryTextLightColor;
}