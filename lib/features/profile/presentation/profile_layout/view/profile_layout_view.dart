import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_management_app/features/profile/presentation/profile_layout/view/widget/profile_layout_body.dart';
import '../cubits/profile_layout_cubit.dart';

class ProfileLayoutView extends StatelessWidget {
  const ProfileLayoutView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileLayoutCubit(),
      child: const ProfileLayoutBody(),
    );
  }
}
