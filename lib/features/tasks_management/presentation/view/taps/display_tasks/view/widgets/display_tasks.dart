import 'package:flutter/material.dart';

import '../../../../../../data/models/task_model.dart';
import '../../../display_categories/view/widgets/custom_floating_action_button.dart';
import 'custom_date_picker.dart';
import 'display_list_of_status.dart';
import 'display_list_of_tasks.dart';

class DisplayTasks extends StatelessWidget {
  const DisplayTasks({
    super.key, required this.items,
  });
  final List<TaskModel> items;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(
              child: CustomDatePicker(),
            ),
            const SliverToBoxAdapter(
              child: DisplayListOfStatus(),
            ),
            DisplayListOfTasks(items: items)
          ],
        ),
        CustomFloatingActionButton(onPressed: () {},)
      ],
    );
  }
}
