import 'package:flutter/material.dart';
import 'package:task_management_app/core/utils/style/theme/constant_colors.dart';
import '../../../../../../../../task_management_app.dart';


class StatusItem extends StatelessWidget {
  const StatusItem({super.key,required this.statusName, required this.isSelected});
  final String statusName;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin:const EdgeInsets.symmetric(horizontal: 5),
      padding:  const EdgeInsets.symmetric(vertical: 7,horizontal: 20),
      decoration: BoxDecoration(color: isSelected?textThemeApp.secondPrimaryColor:primaryColorApp,borderRadius: BorderRadius.circular(10),border: Border.all(width: 1,color: isSelected?primaryColorApp:textThemeApp.secondPrimaryColor)),
      child:  Text(statusName,style: TextStyle(color:  isSelected?primaryColorApp:textThemeApp.secondPrimaryColor),
      ),
    );

  }
}
