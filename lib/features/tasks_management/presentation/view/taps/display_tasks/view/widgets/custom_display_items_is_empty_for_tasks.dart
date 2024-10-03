import 'package:flutter/material.dart';
import 'package:task_management_app/core/utils/widgets/cases/custom_display_items_is_empty.dart';
import 'package:task_management_app/features/tasks_management/presentation/view/taps/display_categories/view/widgets/custom_floating_action_button.dart';
import 'package:task_management_app/features/tasks_management/presentation/view/taps/display_tasks/view/widgets/custom_date_picker.dart';
import 'package:task_management_app/features/tasks_management/presentation/view/taps/display_tasks/view/widgets/display_list_of_status.dart';

class CustomDisplayItemsIsEmptyForTasks extends StatelessWidget {
  const CustomDisplayItemsIsEmptyForTasks({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            CustomDatePicker(),
            DisplayListOfStatus(),
          ],
        ),
        CustomDisplayItemsIsEmpty(title: "Tasks"),
        CustomFloatingActionButton()
      ],
    );
  }
}
