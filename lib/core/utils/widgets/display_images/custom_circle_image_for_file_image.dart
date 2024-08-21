import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_management_app/material_application.dart';

class CustomCircleImageForFileImage extends StatelessWidget {
  const CustomCircleImageForFileImage({super.key, this.imageProvider});

  final ImageProvider<Object>? imageProvider;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: textThemeApp.secondPrimaryColor,
      backgroundImage: imageProvider,
      child: imageProvider != null
          ? null
          : Icon(
              Icons.person,
              size: 60.w,
              color: Colors.grey,
            ),
    );
  }
}
