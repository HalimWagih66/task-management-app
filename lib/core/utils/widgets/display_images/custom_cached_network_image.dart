import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomCachedNetworkImage extends StatelessWidget {
  const CustomCachedNetworkImage({super.key, required this.urlImage,required this.borderRadiusCircular, required this.width, required this.height,});
  final String urlImage;
  final double borderRadiusCircular;
  final double width;
  final double height;
  @override
  Widget build(BuildContext context) {
    return  ClipRRect(
      borderRadius: BorderRadius.circular(borderRadiusCircular),
      child: CachedNetworkImage(
        imageUrl: urlImage,
        placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
        errorWidget: (context, url, error) => const Icon(Icons.error),
        height: height,
        width: width,
        fit: BoxFit.cover,
      ),
    );
  }
}
