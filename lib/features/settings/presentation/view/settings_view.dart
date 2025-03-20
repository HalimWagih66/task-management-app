import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_management_app/features/settings/presentation/manager/switch_toggle_cubit.dart';
import 'package:task_management_app/features/settings/presentation/view/widgets/settings_view_body.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});
  static const routeName = "/SettingsView";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => SwitchToggleCubit(),
        child: const SettingsViewBody(),
),
    );
  }
}


