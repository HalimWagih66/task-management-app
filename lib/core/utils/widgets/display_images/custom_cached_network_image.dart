import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCachedNetworkImage extends StatelessWidget {
  const CustomCachedNetworkImage({super.key, required this.urlImage, required this.height});
  final String urlImage;
  final double height;
  @override
  Widget build(BuildContext context) {
    return  ClipOval(
      child: CachedNetworkImage(
        imageUrl: urlImage,
        placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
        errorWidget: (context, url, error) => const Icon(Icons.error),
        fit: BoxFit.cover,
        height: height,
        width: 200.w,
      ),
    );
  }
}
