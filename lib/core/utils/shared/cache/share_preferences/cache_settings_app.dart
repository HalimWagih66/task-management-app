import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../../../constant/cache/hive_keys.dart';

class CacheSettingApp{
  static Future<void>saveLanguageCode(String languageCode)async{
    var box = Hive.box(SETTINGS_KEY);
    await box.put(LANGUAGE_CODE_KEY,languageCode);
  }
  static Future<void>savedStateThemeModeApp(ThemeMode theme)async{
    var box = Hive.box(SETTINGS_KEY);
    box.put(THEME_APP_KEY, theme.name);
  }
  static String? getLanguageCode()  {
    var box = Hive.box(SETTINGS_KEY);
    return box.get(LANGUAGE_CODE_KEY);
  }
  static String? getStateThemeModeApp()  {
    var box = Hive.box(SETTINGS_KEY);
    return box.get(THEME_APP_KEY);
  }
}