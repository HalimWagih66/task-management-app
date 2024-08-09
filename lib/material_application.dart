import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_management_app/provider/settings_provider.dart';

import 'core/utils/app_router.dart';
import 'core/utils/theme/theme_data_app.dart';

class MaterialApplication extends StatelessWidget {
  const MaterialApplication({super.key});

  @override
  Widget build(BuildContext context) {
    var settingsProvider = Provider.of<SettingsProvider>(context);
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter.appRouter,
      themeMode: settingsProvider.themeMode,
      theme: settingsProvider.themeMode == ThemeMode.dark?ThemeDataApp.darkTheme:ThemeDataApp.lightTheme,
    );
  }
}
