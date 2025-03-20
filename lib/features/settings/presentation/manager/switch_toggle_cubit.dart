import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../provider/settings/settings_provider.dart';

part 'switch_toggle_state.dart';

class SwitchToggleCubit extends Cubit<SwitchToggleState> {
  SwitchToggleCubit() : super(SwitchToggleInitial());

  late bool isDark;
  Future<void> switchToggle(BuildContext context)async{
    if(!isDark){
      await BlocProvider.of<SettingsProvider>(context).changeThemeMode(ThemeMode.dark);
      isDark = !isDark;
    }else{
      await BlocProvider.of<SettingsProvider>(context).changeThemeMode(ThemeMode.light);
      isDark = !isDark;
    }
    emit(SwitchToggle());
  }
}
