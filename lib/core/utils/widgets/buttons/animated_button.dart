import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

class CustomAnimatedButton extends StatelessWidget {
  const CustomAnimatedButton({super.key, required this.pressEven, required this.text, required this.backgroundColor, required this.textStyle});
  final String text;
  final Color backgroundColor;
  final TextStyle textStyle;
  final void Function() pressEven;
  @override
  Widget build(BuildContext context) {
    return AnimatedButton(pressEvent: pressEven,text: text,color:backgroundColor,buttonTextStyle: textStyle);
  }
}
