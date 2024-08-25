
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_management_app/core/utils/functions/validate/validate_inputs_from_text_valid.dart';
import 'package:task_management_app/features/tasks_management/presentation/view/display_categories/manager/display_categories_cubit.dart';
import 'package:task_management_app/material_application.dart';

import '../../../../../../../core/utils/widgets/TextFormField/custom_form_field.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../../../../core/utils/widgets/TextFormField/text_form_field_border.dart';

class CustomFormForSheetEditCategory extends StatelessWidget {
  const CustomFormForSheetEditCategory({
    super.key,required this.initialValue, required this.categoryId, required this.uid
  });
  final String categoryId;
  final String initialValue;
  final String uid;
  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      initialValue: initialValue,
      hintText: AppLocalizations.of(context)!.ex_sport,
      textLabel: AppLocalizations.of(context)!.category_name,
      functionValidate: (input) {
        if(ValidateInputsFromTextValid.validateCategoryTitle(input) != null){
          return ValidateInputsFromTextValid.validateCategoryTitle(input);
        }
        if(initialValue != input){
          BlocProvider.of<DisplayCategoriesCubit>(context).editCategory(categoryId: categoryId, uid: uid, newData: {"categoryName":input});
        }
        return null;
      },
      borderField: fieldBorderDefault(color: textThemeApp.primaryColor),
    );
  }
}
