import 'package:flutter/material.dart';

class CustomElevatedButtonInAuth extends StatelessWidget {
  const CustomElevatedButtonInAuth({
    super.key,
    required this.child,
    this.onPressed,
    required this.background, this.onLongPress,
  });

  final Widget child;
  final void Function()? onPressed;
  final Color background;
  final void Function()? onLongPress;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onLongPress: onLongPress,
        style: ElevatedButton.styleFrom(
          backgroundColor: background,
          padding: const EdgeInsets.symmetric(vertical: 12),
        ),
        onPressed: onPressed,
        child: child);
  }
}
