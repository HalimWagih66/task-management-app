import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_management_app/features/tasks_management/presentation/view/widget/tasks_management_layout_body.dart';
import '../cubits/cubits/tasks_management_layout_cubit.dart';

class TasksManagementLayoutView extends StatelessWidget {
  const TasksManagementLayoutView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TasksManagementLayoutCubit(),
      child: const TasksManagementLayoutBody(),
    );
  }
}

