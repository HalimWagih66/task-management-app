import 'package:flutter/material.dart';

import '../../../../../../../material_application.dart';

class DisplayRegistrationBySocial extends StatelessWidget {
  const DisplayRegistrationBySocial({
    super.key, required this.image, required this.text, this.colorText,
  });
  final String image;
  final String text;
  final Color? colorText;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(image,height: 22),
        const SizedBox(width: 5),
        Text(text,style: textThemeApp.font17PrimaryMedium.copyWith(color: colorText)),
      ],
    );
  }
}
