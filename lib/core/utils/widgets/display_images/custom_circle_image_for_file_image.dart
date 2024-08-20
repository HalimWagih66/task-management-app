import 'package:flutter/material.dart';
import 'package:task_management_app/material_application.dart';

class CustomCircleImageForFileImage extends StatelessWidget {
  const CustomCircleImageForFileImage({super.key, this.imageProvider});

  final ImageProvider<Object>? imageProvider;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: textThemeApp.secondPrimaryColor,
      backgroundImage: imageProvider,
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: imageProvider != null
            ? null
            : const Icon(
                Icons.person,
                size: 20,
                color: Colors.grey,
              ),
      ),
    );
  }
}
