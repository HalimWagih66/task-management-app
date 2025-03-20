import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:task_management_app/core/utils/widgets/dialogs/show_message_with_snack_bar.dart';

import '../../../../../../../../core/utils/widgets/loading/custom_hexagon_Dots_loading.dart';
import '../../../../../../../../task_management_app.dart';
import '../../manager/display_category_cubit/control_categories_cubit.dart';
import '../../manager/display_category_cubit/control_categories_state.dart';

class CustomDisplayAddCategory extends StatelessWidget {
  const CustomDisplayAddCategory({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ControlCategoriesCubit,ControlCategoriesState>(
      listener: (context, state) {
        if(state is AddCategorySuccess){
          GoRouter.of(context).pop();
        }
        if(state is AddCategoryFailure){
          GoRouter.of(context).pop();
          showMessageWithSnackBar(context: context,background: textThemeApp.secondPrimaryColor, message: state.errorMessage);
        }
      },
      builder: (context, state) {
        if(state is AddCategoryLoading){
          return CustomHexagonDotsLoading(color: textThemeApp.secondPrimaryColor);
        }else{
          return Text(AppLocalizations.of(context)!.add_category,style: textThemeApp.font18SecondPrimaryBold,textAlign: TextAlign.center,);
        }
      },
    );
  }
}

