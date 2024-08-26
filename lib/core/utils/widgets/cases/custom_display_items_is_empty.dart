import 'package:flutter/material.dart';
import 'package:task_management_app/material_application.dart';

class CustomDisplayItemsIsEmpty extends StatelessWidget {
  const CustomDisplayItemsIsEmpty({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(Icons.menu,size: 50,color: Colors.grey,),
        const SizedBox(height: 10),
        Text("There are no $title yet. Add a $title.",style: textThemeApp.font18SecondPrimaryBold.copyWith(color: Colors.grey),textAlign: TextAlign.center,)
      ],
    );
  }
}
