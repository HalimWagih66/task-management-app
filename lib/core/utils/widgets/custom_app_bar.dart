import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_management_app/provider/settings_provider.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key, required this.leadingIconData, required this.backgroundColor, required this.title, this.onPressed});
  final IconData leadingIconData;
  final Color backgroundColor;
  final String title;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    var textThemeApp = Provider.of<SettingsProvider>(context).textThemeApp;
    return AppBar(
      leading: IconButton(icon: Icon(leadingIconData,color: textThemeApp.primaryColor,), onPressed: onPressed),
      backgroundColor: backgroundColor,
      title: Text(title),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size(double.infinity, 65);
}
