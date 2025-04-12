import 'package:flutter/material.dart';

class CustomInkWill extends StatelessWidget {
  const CustomInkWill({super.key, this.onTap, required this.background, required this.child});
  final void Function()? onTap;
  final Color background;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: background,
          borderRadius: BorderRadius.circular(10)
        ),
        padding: const EdgeInsets.all(13),
        child: child
      ),
    );
  }
}
