import 'package:flutter/material.dart';

import '../../../material_application.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key, required this.leadingIconData, required this.backgroundColor, required this.title, this.onPressed});
  final IconData leadingIconData;
  final Color backgroundColor;
  final String title;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      foregroundColor: Colors.transparent,
      elevation: 0,
      backgroundColor: Colors.transparent,
      leading: IconButton(icon: Icon(leadingIconData,color: textThemeApp.primaryColor,), onPressed: onPressed),
      title: Text(title,style: textThemeApp.font17PrimaryMedium),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size(double.infinity, 65);
}
