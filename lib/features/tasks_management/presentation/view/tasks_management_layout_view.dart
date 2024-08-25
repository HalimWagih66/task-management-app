import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubits/tasks_management_layout_cubit.dart';

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

class TasksManagementLayoutBody extends StatelessWidget {
  const TasksManagementLayoutBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      physics: const NeverScrollableScrollPhysics(),
      itemCount: BlocProvider.of<TasksManagementLayoutCubit>(context).taps.length,
      controller: BlocProvider.of<TasksManagementLayoutCubit>(context).pageController,
      itemBuilder: (context, index) => BlocProvider.of<TasksManagementLayoutCubit>(context).taps[index],
    );
  }
}
