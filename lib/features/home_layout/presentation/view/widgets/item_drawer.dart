import 'package:flutter/material.dart';

import '../../../../../material_application.dart';

class ItemDrawer extends StatelessWidget {
  const ItemDrawer({super.key, required this.iconData, required this.text, this.onTap});
  final IconData iconData;
  final String text;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: onTap,
          child: Row(
            children: [
              Icon(iconData,color: textThemeApp.secondPrimaryColor),
              const SizedBox(width: 12,),
              Text(text,style: textThemeApp.font18SecondPrimaryBold,),
            ],
          ),
        ),
        const SizedBox(height: 13)
      ],
    );
  }
}
