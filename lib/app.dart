import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_management_app/core/utils/app_router.dart';
import 'package:task_management_app/core/utils/theme/text_theme_app_light.dart';

import 'core/utils/theme/text_theme_app.dart';
late TextThemeApp themeApp;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        themeApp = TextThemeLight();
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          routerConfig: AppRouter.appRouter,
        );
      }
    );
  }
}
