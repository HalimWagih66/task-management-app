import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:task_management_app/core/utils/app_router.dart';
import 'package:task_management_app/core/utils/theme/theme_data_app.dart';
import 'package:task_management_app/provider/settings_provider.dart';

import 'material_application.dart';
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return const MaterialApplication();
      }
    );
  }
}
