import 'package:flutter/material.dart';
import 'package:task_management_app/features/tasks_management/presentation/view/taps/display_tasks/view/widgets/status_item.dart';

class DisplayListOfStatus extends StatefulWidget {
  const DisplayListOfStatus({super.key});

  @override
  State<DisplayListOfStatus> createState() => _DisplayListOfStatusState();
}

class _DisplayListOfStatusState extends State<DisplayListOfStatus> {
  final List<String>status = const [
    "All",
    "TODO",
    "In Progress",
    "Done"
  ];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 33,
      child: ListView.builder(scrollDirection: Axis.horizontal,itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            setState(() {
              selectedIndex = index;
            });
          },
          child: StatusItem(statusName: status[index],isSelected: selectedIndex == index),
        );
      },shrinkWrap: true,itemCount: status.length,),
    );
  }
}
