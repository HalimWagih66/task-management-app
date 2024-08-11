import 'package:flutter/material.dart';
class CustomCircleImage extends StatelessWidget {
  const CustomCircleImage( {super.key, required this.colorBorderCircle,  this.radiusCircleImage = 66, required this.imageProvider,});
  final Color colorBorderCircle;
  final double radiusCircleImage;
  final ImageProvider<Object>? imageProvider;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radiusCircleImage+6,
      backgroundColor: colorBorderCircle,
      child: CircleAvatar(
        backgroundColor: Colors.white,
        radius: radiusCircleImage+2,
        child: CircleAvatar(
          radius: radiusCircleImage,
          backgroundColor: const Color(0xfff7f6fa),
          backgroundImage: imageProvider,
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: imageProvider != null
                ? null
                : Icon(
              Icons.person,
              size: radiusCircleImage+14,
              color: Colors.grey,
            ) ,),
        ),
      ),
    );
  }
}