import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubits/cubits/tasks_management_layout_cubit.dart';

class TasksManagementLayoutBody extends StatefulWidget {
  const TasksManagementLayoutBody({
    super.key,
  });

  @override
  State<TasksManagementLayoutBody> createState() => _TasksManagementLayoutBodyState();
}

class _TasksManagementLayoutBodyState extends State<TasksManagementLayoutBody> {
  @override
  void dispose() {
    super.dispose();
    BlocProvider.of<TasksManagementLayoutCubit>(context).pageController.dispose();
  }
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
