import 'package:flutter/material.dart';
import 'package:task_management_app/material_application.dart';

class DisplayCategoryNameAndNumberOfTasks extends StatelessWidget {
  const DisplayCategoryNameAndNumberOfTasks({super.key, required this.categoryName, required this.numberOfTasks});
  final String categoryName;
  final int numberOfTasks;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(categoryName, style: textThemeApp.font18SecondPrimaryBold),
            Text("$numberOfTasks", style: textThemeApp.font15greyRegular.copyWith(color: textThemeApp.secondPrimaryColor),
            )
          ],
        ),
      ),
    );
  }
}
