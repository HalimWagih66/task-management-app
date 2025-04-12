import 'package:flutter/material.dart';
import 'package:task_management_app/task_management_app.dart';

class PriorityItem extends StatelessWidget {
  const PriorityItem({super.key, required this.number, required this.color, required this.isSelected});
  final int number;
  final Color color;
  final bool isSelected ;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: CircleAvatar(
        backgroundColor: isSelected? color:Colors.transparent,
        radius: 24,
        child: CircleAvatar(
          backgroundColor:isSelected? textThemeApp.secondPrimaryColor:Colors.transparent,
          radius: 22,
          child: CircleAvatar(
            backgroundColor: color,
            child: Text("${number+1}",style: textThemeApp.font17PrimaryMedium.copyWith(color: textThemeApp.secondPrimaryColor)),
          ),
        ),
      ),
    );
  }
}
