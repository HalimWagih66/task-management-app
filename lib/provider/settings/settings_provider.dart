import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_management_app/provider/settings/settings_state.dart';
import '../../core/utils/shared/cache/share_preferences/cache_settings_app.dart';

class SettingsProvider extends Cubit<SettingsState> {
  SettingsProvider():super(SettingsInitial());

  ThemeMode _themeMode = ThemeMode.light;
  String _languageCode = "ar";


  void initializeLanguageCode() {
    if(CacheSettingApp.getLanguageCode() == null){
      _languageCode = 'ar';
    }else{
      _languageCode = CacheSettingApp.getLanguageCode()!;
    }
  }

  // void initializeThemeMode() {
  //   if(CacheSettingApp.getStateThemeModeApp() == null){
  //     _themeMode = ThemeMode.system;
  //     textThemeApp = ThemeMode.system == ThemeMode.dark?TextThemeDarkApp():TextThemeLightApp();
  //   }else{
  //     _themeMode = CacheSettingApp.getStateThemeModeApp() == "dark"?ThemeMode.dark:ThemeMode.light;
  //     textThemeApp = CacheSettingApp.getStateThemeModeApp() == "dark"?TextThemeDarkApp():TextThemeLightApp();
  //   }
  // }
  ThemeMode get themeMode => _themeMode;

  set themeMode(ThemeMode value) {
    _themeMode = value;
  }
  bool isDarkEnabled(){
    return _themeMode == ThemeMode.dark;
  }
  bool isLanguageEnglish(){
    return _languageCode == "en";
  }

  String get languageCode => _languageCode;

  set languageCode(String value) {
    _languageCode = value;
  }
  Future<void> changeLanguageApp(String languageCode)async{
    this.languageCode = languageCode;
    await CacheSettingApp.saveLanguageCode(languageCode);
  }
  // Future<void> changeThemeMode(ThemeMode themeMode)async{
  //   this.themeMode = themeMode;
  //   textThemeApp = themeMode == ThemeMode.dark?TextThemeDarkApp():TextThemeLightApp();
  //   await CacheSettingApp.savedStateThemeModeApp(themeMode);
  //   notifyListeners();
  // }
}
