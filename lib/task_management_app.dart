import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_management_app/provider/settings/settings_provider.dart';
import 'package:task_management_app/core/utils/app_router.dart';
import 'package:task_management_app/core/utils/style/theme/text_theme_app.dart';
import 'package:task_management_app/core/utils/style/theme/text_theme_dark_app.dart';
import 'package:task_management_app/core/utils/style/theme/text_theme_light_app.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'core/utils/style/theme/theme_data_app.dart';

late TextThemeApp textThemeApp;
class TaskManagementApp extends StatelessWidget {
  const TaskManagementApp({super.key});
  @override
  Widget build(BuildContext context) {
    print("TaskManagementApp BuildContext");
    var settingsProvider = BlocProvider.of<SettingsProvider>(context);
    textThemeApp = settingsProvider.themeMode == ThemeMode.dark?TextThemeDarkApp():TextThemeLightApp();
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      themeMode: settingsProvider.themeMode,
      routerConfig: AppRouter.appRouter,
      theme: settingsProvider.themeMode == ThemeMode.dark?ThemeDataApp.darkTheme:ThemeDataApp.lightTheme,
      locale: Locale(settingsProvider.languageCode),
      localizationsDelegates: const [
        AppLocalizations.delegate, // Add this line
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'), // English
        Locale('ar'), // Spanish
      ],
    );
  }
}