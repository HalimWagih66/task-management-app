import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_management_app/core/utils/widgets/app_bar/custom_app_bar.dart';
import 'package:task_management_app/core/utils/widgets/display_images/custom_cached_network_image.dart';
import 'package:task_management_app/core/utils/widgets/display_images/custom_circle_image.dart';
import 'package:task_management_app/features/home_layout/presentation/manager/user_model_cubit/user_model_cubit.dart';
import 'package:task_management_app/features/profile/presentation/profile_layout/view/taps/display_profile/view/widgets/custom_view_field.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../cubits/profile_layout_cubit.dart';

class DisplayProfileView extends StatelessWidget {
  const DisplayProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    var userModel = BlocProvider.of<UserModelCubit>(context).userModel;
    return Column(
      children: [
        CustomAppBar(title: AppLocalizations.of(context)!.profile,backgroundColor: Colors.transparent,),
        InkWell(
          onTap: () {
            BlocProvider.of<ProfileLayoutCubit>(context).animateToPage(1);
          },
          child: CustomCircleImage(
            firstRadios: 80.w,
            secondRadios: 77.h,
            child: CustomCachedNetworkImage(
              urlImage: userModel!.imageUrl!,
              height: 200.w,
            ),
          ),
        ),
        const Spacer(
          flex: 2,
        ),
        Column(
          children: [
            CustomViewField(label: AppLocalizations.of(context)!.name, text: userModel.name ??""),
            CustomViewField(label: AppLocalizations.of(context)!.email, text: userModel.email ??""),
            CustomViewField(label: AppLocalizations.of(context)!.password, text: "*******"),
          ],
        ),
        const Spacer(),
      ],
    );
  }
}
