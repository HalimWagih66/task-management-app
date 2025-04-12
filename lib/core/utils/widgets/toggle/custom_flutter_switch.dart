import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:task_management_app/features/settings/presentation/manager/switch_toggle_cubit.dart';

class CustomFlutterSwitch extends StatelessWidget{
  const CustomFlutterSwitch({super.key});
  @override
  Widget build(BuildContext context) {
    return FlutterSwitch(
      width: 125.0,
      height: 47.0,
      valueFontSize: 25.0,
      toggleSize: 40.0,
      value: BlocProvider.of<SwitchToggleCubit>(context).isDark,
      borderRadius: 30.0,
      padding: 8.0,
      showOnOff: true,
      onToggle: (val)async {
        await BlocProvider.of<SwitchToggleCubit>(context).switchToggle(context);
      },
    );
  }
}
