
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../../../../../core/utils/widgets/dialogs/show_message_with_snack_bar.dart';
import '../../../../../../../../core/utils/widgets/loading/custom_hexagon_Dots_loading.dart';
import '../../../../../../../../core/utils/widgets/toast/show_message_with_toast.dart';
import '../../../../../../../../material_application.dart';
import '../../manager/display_category_cubit/control_categories_cubit.dart';
import '../../manager/display_category_cubit/control_categories_state.dart';

class CustomDisplaySaveChanges extends StatelessWidget {
  const CustomDisplaySaveChanges({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ControlCategoriesCubit,ControlCategoriesState>(
      listener: (context, state) {
        if(state is EditCategorySuccess){
          if(state.editType == null){

          }else{
            showMessageWithToast(background: textThemeApp.primaryColor, message: "The ${state.editType} has been changed.", textColor: textThemeApp.secondPrimaryColor);
          }
        }if(state is EditCategoryFailure){
          showMessageWithSnackBar(background: textThemeApp.secondPrimaryColor, message: state.errorMessage, context: context);
        }
      },
      builder: (context, state) {
        if(state is EditCategoryLoading){
          return CustomHexagonDotsLoading(color: textThemeApp.secondPrimaryColor);
        }
        return Text(AppLocalizations.of(context)!.edit_Category,style: textThemeApp.font18SecondPrimaryBold,textAlign: TextAlign.center,);
      },
    );
  }
}
