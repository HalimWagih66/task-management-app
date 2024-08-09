
import 'package:flutter/material.dart';

class CustomElevatedButtonInAuth extends StatelessWidget {
  const CustomElevatedButtonInAuth({
    super.key, required this.child, this.onPressed, required this.background,
  });
  final Widget child;
  final void Function()? onPressed;
  final Color background;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: background,padding: const EdgeInsets.symmetric(vertical: 12)),
        onPressed: onPressed, child:child);
  }
}
