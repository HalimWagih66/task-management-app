import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class CustomHexagonDotsLoading extends StatelessWidget {
  const CustomHexagonDotsLoading({super.key, required this.color});
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: LoadingAnimationWidget.hexagonDots(
        size: 25,
        color: color,
      ),
    );
  }
}
