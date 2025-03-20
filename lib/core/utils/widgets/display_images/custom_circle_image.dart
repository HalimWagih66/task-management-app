import 'package:flutter/material.dart';
class CustomCircleImage extends StatelessWidget {
   const CustomCircleImage( {super.key, required this.child, required this.firstRadios, required this.secondRadios,});
  final Widget child;
  final double firstRadios;
  final double secondRadios;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: secondRadios,
      backgroundColor: Colors.white,
      child: AspectRatio(
        aspectRatio: 1,
        child: child
      ),
    );
  }
}