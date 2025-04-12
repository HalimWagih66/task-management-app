class SettingsState{}

class SettingsInitial extends SettingsState{}

class RebuildApp extends SettingsState{
  final String? text;
  RebuildApp({this.text});
}