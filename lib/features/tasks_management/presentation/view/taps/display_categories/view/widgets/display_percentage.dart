import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:task_management_app/features/tasks_management/data/models/category_model.dart';
import 'package:task_management_app/material_application.dart';

class DisplayPercentage extends StatelessWidget {
  const DisplayPercentage({super.key, required this.categoryModel});
  final CategoryModel categoryModel;
  @override
  Widget build(BuildContext context) {
    return CircularPercentIndicator(
      radius: 28,
      progressColor: Colors.blue,
      backgroundColor: const Color(0x5a617afd),
      center: Text("${((displayPercent(context,numberTasks: categoryModel.allTasksToday??0,completedTasks: categoryModel.completeTasksInToday??0)/100)*100).toInt()}%",style: textThemeApp.font15greyRegular.copyWith(color: textThemeApp.secondPrimaryColor),),
      curve: Curves.easeIn,
      percent: (displayPercent(context,numberTasks: categoryModel.allTasksToday??0,completedTasks: categoryModel.completeTasksInToday??0)/100),
    );
  }

  double displayPercent(BuildContext context,{required int numberTasks , required int completedTasks}){

    if(numberTasks == 0){
      return 0;
    }
    return ((completedTasks/numberTasks)*100.floor());
  }
}
