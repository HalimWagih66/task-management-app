import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:task_management_app/features/tasks_management/data/models/task_model.dart';
import 'package:task_management_app/features/tasks_management/presentation/view/taps/display_tasks/view/widgets/custom_date_picker.dart';
import 'package:task_management_app/features/tasks_management/presentation/view/taps/display_tasks/view/widgets/display_list_of_status.dart';
import 'package:task_management_app/features/tasks_management/presentation/view/taps/display_tasks/view/widgets/task_item.dart';

class CustomLoadingForTasks extends StatelessWidget {
  const CustomLoadingForTasks({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const CustomDatePicker(),
          const DisplayListOfStatus(),
          Skeletonizer(
            enabled: true,
            child: Column(
              children: [
                TaskItem(taskModel: TaskModel(title: "title",time: "10:30",desc: "desc",priority: 1,taskId: "",status: 1,date: DateTime.now())),
                TaskItem(taskModel: TaskModel(title: "title",time: "10:30",desc: "desc",priority: 1,taskId: "",status: 1,date: DateTime.now())),
                TaskItem(taskModel: TaskModel(title: "title",time: "10:30",desc: "desc",priority: 1,taskId: "",status: 1,date: DateTime.now())),
                TaskItem(taskModel: TaskModel(title: "title",time: "10:30",desc: "desc",priority: 1,taskId: "",status: 1,date: DateTime.now())),
                TaskItem(taskModel: TaskModel(title: "title",time: "10:30",desc: "desc",priority: 1,taskId: "",status: 1,date: DateTime.now())),
                TaskItem(taskModel: TaskModel(title: "title",time: "10:30",desc: "desc",priority: 1,taskId: "",status: 1,date: DateTime.now())),
              ],
            ),
          )
        ],
      ),
    );
  }
}
