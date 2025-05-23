import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:task_management_app/core/utils/style/theme/constant_colors.dart';
import 'package:task_management_app/core/utils/widgets/loading/custom_hexagon_Dots_loading.dart';
class CustomCachedNetworkImage extends StatelessWidget {
  const CustomCachedNetworkImage({super.key, required this.urlImage, required this.height});
  final String urlImage;
  final double height;
  @override
  Widget build(BuildContext context) {
    return  ClipOval(
      child: CachedNetworkImage(
        imageUrl: urlImage,
        placeholder: (context, url) => const CustomHexagonDotsLoading(color: primaryColorApp),
        errorWidget: (context, url, error) => const Icon(Icons.error),
        fit: BoxFit.cover,
      ),
    );
  }
}