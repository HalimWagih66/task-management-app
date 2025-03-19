import 'package:flutter/material.dart';
import 'package:task_management_app/features/tasks_management/presentation/view/taps/display_tasks/view/widgets/priority_item.dart';

class DisplayPriority extends StatefulWidget {
  const DisplayPriority({super.key});


  @override
  State<DisplayPriority> createState() => _DisplayPriorityState();
}

class _DisplayPriorityState extends State<DisplayPriority> {
  int selectedItemPriority = -1;
  final List<Color> importance = const [
    Color(0xffff0000),
    Color(0xffff9900),
    Color(0xffffff00),
    Color(0xff7fff00),
    Color(0xff007fff),
    Color(0xffe5e5e5),
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemBuilder: (context, index) => InkWell(
              splashColor: Colors.transparent,
              hoverColor: Colors.transparent,
              onTap: () {
                selectedItemPriority = index;
                setState(() {});
              },
              child: PriorityItem(
                number: index,
                color: importance[index],
                isSelected: index == selectedItemPriority,
              )),
          itemCount: importance.length),
    );
  }
}
