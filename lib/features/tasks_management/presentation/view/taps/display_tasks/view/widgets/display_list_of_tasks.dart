import 'package:flutter/material.dart';
import 'package:task_management_app/features/tasks_management/presentation/view/taps/display_tasks/view/widgets/task_item.dart';

import '../../../../../../data/models/task_model.dart';

class DisplayListOfTasks extends StatelessWidget {
  const DisplayListOfTasks({super.key, required this.items});
  final List<TaskModel> items;
  @override
  Widget build(BuildContext context) {
    return SliverList.builder(itemBuilder: (context, index) => TaskItem(taskModel: items[index]),itemCount: items.length);
  }
}
