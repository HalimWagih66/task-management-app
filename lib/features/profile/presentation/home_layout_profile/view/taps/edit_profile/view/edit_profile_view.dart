import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_management_app/core/services/firebase/services/database_services.dart';
import 'package:task_management_app/core/services/service_locator.dart';
import 'package:task_management_app/features/profile/presentation/home_layout_profile/cubits/home_layout_profile_cubit.dart';
import 'package:task_management_app/features/profile/presentation/home_layout_profile/view/taps/edit_profile/manager/change_image_cubit/change_image_cubit.dart';
import 'package:task_management_app/features/profile/presentation/home_layout_profile/view/taps/edit_profile/view/widgets/custom_picked_image_for_change_body.dart';
import '../../../../../../../../core/utils/constant/sentence/firebase_storage_constant.dart';
import '../../../../../../../../core/utils/widgets/custom_app_bar.dart';
import '../../../../../../../home_layout/presentation/manager/user_model_cubit/user_model_cubit.dart';

class EditProfileView extends StatelessWidget {
  const EditProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    var userModel = BlocProvider.of<UserModelCubit>(context).userModel;
    return Column(
      children: [
        CustomAppBar(
          title: "Edit Profile",
          backgroundColor: Colors.transparent,
          leadingIconData: Icons.arrow_back_ios,
          onPressed: () {
            BlocProvider.of<HomeLayoutProfileCubit>(context).animateToPage(0);
          },
        ),
        BlocProvider(
          create: (context) => ChangeImageCubit(databaseServices: getIt.get<DatabaseServices>()),
          child: CustomPickedImageForChangeBody(imageUrl: userModel!.imageUrl!, pathTheFile: FirebaseStorageConstant.getPathTheImage(email: userModel.email!, folderName: FirebaseStorageConstant.person),fileName: FirebaseStorageConstant.userImageFileName,uid: userModel.email!,),
        ),
        const Spacer(
          flex: 2,
        ),
      ],
    );
  }
}

