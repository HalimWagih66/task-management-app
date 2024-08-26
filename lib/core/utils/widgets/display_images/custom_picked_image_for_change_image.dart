import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:task_management_app/core/utils/theme/constant_colors.dart';
import 'package:task_management_app/core/utils/widgets/display_images/custom_cached_network_image.dart';
import 'package:task_management_app/core/utils/widgets/loading/custom_hexagon_Dots_loading.dart';
import '../../../../../../../../../core/utils/cubits/image_picker_cubit/image_picker_cubit.dart';
import '../../../../../../../../../core/utils/widgets/display_images/custom_circle_image.dart';
import 'custom_circle_image_for_file_image.dart';

class CustomPickedImageForChangeImage extends StatelessWidget {
  const CustomPickedImageForChangeImage({
    super.key,
    required this.imageUrl,
    this.onTap, required this.caseImagePickerSuccess,
  });
  final Function caseImagePickerSuccess;
  final String imageUrl;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      child: CustomCircleImage(
        secondRadios: 80.w,
        firstRadios: 77.w,
        child: ClipOval(
          child: BlocConsumer<ImagePickerCubit, ImagePickerState>(
            listener: (context, state) {
              if (state is ImagePickerLoading) {
                GoRouter.of(context).pop();
              }else if(state is ImagePickerSuccess){
                caseImagePickerSuccess();
              }
            },
            builder: (context, state) {
              if (state is ImagePickerSuccess) {
                return CustomCircleImage(
                  firstRadios: 80,
                  secondRadios: 77,
                  child: CustomCircleImageForFileImage(
                    imageProvider: FileImage(state.file!),
                  ),
                );
              } else if (state is ImagePickerLoading) {
                return const CustomHexagonDotsLoading(color: primaryColorApp);
              }
              return CustomCircleImage(
                firstRadios: 80,
                secondRadios: 77,
                child: CustomCachedNetworkImage(
                  urlImage:imageUrl,
                  height: 222.h,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
