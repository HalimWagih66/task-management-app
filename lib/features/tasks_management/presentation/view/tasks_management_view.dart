import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubits/tasks_management_cubit.dart';

class TasksManagementView extends StatelessWidget {
  const TasksManagementView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TasksManagementCubit(),
      child: Builder(
        builder: (context) {
          return PageView.builder(
            itemCount: BlocProvider.of<TasksManagementCubit>(context).taps.length,
            controller: BlocProvider.of<TasksManagementCubit>(context).pageController,
            itemBuilder: (context, index) => BlocProvider.of<TasksManagementCubit>(context).taps[index],
          );
        }
      ),
    );
  }
}
