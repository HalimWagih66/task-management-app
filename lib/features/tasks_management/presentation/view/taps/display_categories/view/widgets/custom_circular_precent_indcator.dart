import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:task_management_app/material_application.dart';
class CustomCircularPercentIndicator extends StatelessWidget {
  const CustomCircularPercentIndicator({super.key, required this.categoryId});
  final String categoryId;

  @override
  Widget build(BuildContext context) {
    return CircularPercentIndicator(
      radius: 28,
      progressColor: Colors.blue,
      backgroundColor: const Color(0x5a617afd),
      center: Text("${(displayPercent(context)*100).toInt()}%",style: textThemeApp.font15greyRegular.copyWith(color: textThemeApp.secondPrimaryColor),),
      curve: Curves.easeIn,
      percent: displayPercent(context),
    );
  }

  double displayPercent(BuildContext context){
    return (10/10);
  }
}
