import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:task_management_app/core/utils/theme/constant_colors.dart';
import 'package:task_management_app/core/utils/widgets/dialogs/show_message_with_snack_bar.dart';
import 'package:task_management_app/core/utils/widgets/display_images/custom_cached_network_image.dart';
import 'package:task_management_app/core/utils/widgets/loading/custom_hexagon_Dots_loading.dart';
import 'package:task_management_app/features/auth/presentation/sign_up/presentation/manager/image_picker_cubit/image_picker_cubit.dart';
import 'package:task_management_app/features/profile/presentation/home_layout_profile/view/taps/edit_profile/manager/change_image_cubit/change_image_cubit.dart';
import 'package:task_management_app/material_application.dart';
import '../../../../../../../../../core/utils/widgets/display_images/custom_circle_image.dart';

class CustomPickedImageForChange extends StatelessWidget {
  const CustomPickedImageForChange({
    super.key,
    required this.imageUrl,
    this.onTap,
  });

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
          child: BlocConsumer<ChangeImageCubit, ImagePickerState>(
            listener: (context, state) {
              if (state is ImagePickerLoading) {
                GoRouter.of(context).pop();
              }else if(state is ImagePickerFailure){
                showMessageWithSnackBar(background: textThemeApp.primaryColor, message: state.errorMessage, context: context);
              }
            },
            builder: (context, state) {
              if (state is ImagePickerSuccess) {
                return CustomCircleImage(
                  firstRadios: 77,
                  secondRadios: 80,
                  child: ClipOval(
                    child: Image.network(
                      state.imageUrl!,
                      fit: BoxFit.fill,
                      width: 222.w,
                    ),
                  ),
                );
              } else if (state is ImagePickerLoading) {
                return const CustomHexagonDotsLoading(color: primaryColorApp);
              }
              return CustomCircleImage(
                firstRadios: 77,
                secondRadios: 80,
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
