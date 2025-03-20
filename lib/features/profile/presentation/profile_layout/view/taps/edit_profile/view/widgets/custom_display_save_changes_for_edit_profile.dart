
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../../../../../../core/utils/widgets/dialogs/show_message_with_snack_bar.dart';
import '../../../../../../../../../core/utils/widgets/loading/custom_hexagon_Dots_loading.dart';
import '../../../../../../../../../task_management_app.dart';
import '../../manager/edit_profile_form/edit_profile_form_cubit.dart';

class CustomDisplaySaveChangesForEditProfile extends StatelessWidget {
  const CustomDisplaySaveChangesForEditProfile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EditProfileFormCubit, EditProfileFormState>(
      listener: (context, state) {
        if (state is EditProfileFormFailure) {
          showMessageWithSnackBar(
              background: textThemeApp.primaryColor,
              message: state.errorMessage,
              context: context);
        } else if (state is EditProfileFormSuccess) {
          showMessageWithSnackBar(
              background: textThemeApp.primaryColor,
              message: "The ${state.editType} has been changed.",
              context: context);
        }
      },
      builder: (context, state) {
        if (state is EditProfileFormLoading) {
          return CustomHexagonDotsLoading(
              color: textThemeApp.secondPrimaryColor);
        } else {
          return Text(AppLocalizations.of(context)!.save_changes,
              style: textThemeApp.font18SecondPrimaryBold);
        }
      },
    );
  }
}
