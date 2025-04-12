import 'package:flutter/material.dart';
import '../../../../task_management_app.dart';

class ItemContact extends StatelessWidget {
  const ItemContact({super.key, required this.title, required this.icon, required this.onTap});
  final String title;
  final IconData icon;
  final Function onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      onTap: () {
        onTap();
      },
      child:  Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: ListTile(
              leading: Icon(icon,color: textThemeApp.primaryColor,),
              title: Text(title,style: textThemeApp.font17PrimaryMedium),
            ),
          ),
          const Divider(
            color: Colors.black,
          )
        ],
      ),
    );
  }
}
