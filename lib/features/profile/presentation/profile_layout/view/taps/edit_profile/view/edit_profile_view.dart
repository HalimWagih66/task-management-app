import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_management_app/core/services/service_locator.dart';
import 'package:task_management_app/core/utils/cubits/image_picker_cubit/image_picker_cubit.dart';
import 'package:task_management_app/features/profile/data/repos/profile_repo.dart';
import 'package:task_management_app/features/profile/presentation/profile_layout/view/taps/edit_profile/manager/edit_profile_form/edit_profile_form_cubit.dart';
import 'package:task_management_app/features/profile/presentation/profile_layout/view/taps/edit_profile/view/widgets/edit_profile_body.dart';
import '../../../../../../../../core/utils/widgets/app_bar/custom_app_bar.dart';
import '../../../../cubits/profile_layout_cubit.dart';

class EditProfileView extends StatefulWidget {
  const EditProfileView({super.key});

  @override
  State<EditProfileView> createState() => _EditProfileViewState();
}

class _EditProfileViewState extends State<EditProfileView> {

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CustomAppBar(
                title: "Edit Profile",
                backgroundColor: Colors.transparent,
                leadingIconData: Icons.arrow_back_ios,
                onPressed: () {
                  BlocProvider.of<ProfileLayoutCubit>(context)
                      .animateToPage(0);
                },
              ),
              MultiBlocProvider(
                providers: [
                  BlocProvider(create: (context) => ImagePickerCubit(),),
                  BlocProvider(create: (context) => EditProfileFormCubit(profileRepo: getIt.get<ProfileRepo>()))
                ],
                child: const Expanded(child: EditProfileBody()),
              )
            ],
          ),
        )
      ],
    );
  }
}
