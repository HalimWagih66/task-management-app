import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_management_app/core/utils/theme/text_theme_app.dart';
import 'package:task_management_app/core/utils/theme/text_theme_light_app.dart';
import 'package:task_management_app/provider/settings_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'core/utils/app_router.dart';
import 'core/utils/theme/theme_data_app.dart';
late TextThemeApp textThemeApp;
class MaterialApplication extends StatelessWidget {
  const MaterialApplication({super.key});

  @override
  Widget build(BuildContext context) {
    var settingsProvider = Provider.of<SettingsProvider>(context);
    textThemeApp = settingsProvider.themeMode == ThemeMode.dark?TextThemeLightApp():TextThemeLightApp();
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter.appRouter,
      themeMode: settingsProvider.themeMode,
      theme: settingsProvider.themeMode == ThemeMode.dark?ThemeDataApp.darkTheme:ThemeDataApp.lightTheme,
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
