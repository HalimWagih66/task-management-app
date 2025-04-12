// import 'package:flutter/material.dart';
// import 'package:percent_indicator/circular_percent_indicator.dart';
//
// import '../../../../../../../../material_application.dart';
//
// class CustomCircularPercentIndicator extends StatelessWidget {
//   const CustomCircularPercentIndicator({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return CircularPercentIndicator(
//       radius: 28,
//       progressColor: Colors.blue,
//       backgroundColor: const Color(0x5a617afd),
//       center: Text("${(displayPercent(context)*100).toInt()}%",style: textThemeApp.font15greyRegular.copyWith(color: textThemeApp.secondPrimaryColor),),
//       curve: Curves.easeIn,
//       percent: displayPercent(context),
//     );
//   }
//
//   double displayPercent({required int numberOfTasks,required int completedTasks}){
//
//     if(categoryModel.numberTasks == 0){
//       return 0;
//     }
//     return categoryModel.completedTasks!/categoryModel.numberTasks!*100.floor();
//   }
// }
