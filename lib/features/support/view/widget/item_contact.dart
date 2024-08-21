import 'package:flutter/material.dart';
import 'package:task_management_app/material_application.dart';

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
              title: Text(title,style: Theme.of(context).textTheme.bodySmall,),
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
