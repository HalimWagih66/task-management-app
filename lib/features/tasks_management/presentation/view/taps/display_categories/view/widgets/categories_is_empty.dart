import 'package:flutter/material.dart';
import 'package:task_management_app/features/tasks_management/presentation/view/taps/display_categories/view/widgets/display_categories.dart';

import '../../../../../../../../core/utils/widgets/cases/custom_display_items_is_empty.dart';
import 'custom_floating_action_button.dart';

class CategoriesIsEmpty extends StatelessWidget {
  const CategoriesIsEmpty({super.key, required this.message, required this.uid});
  final String message;
  final String uid;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomDisplayItemsIsEmpty(title: message),
        CustomFloatingActionButton(
          onPressed: () {
            showBottomSheetForAddCategory(context, uid: uid);
          },
        )
      ],
    );
  }
}
