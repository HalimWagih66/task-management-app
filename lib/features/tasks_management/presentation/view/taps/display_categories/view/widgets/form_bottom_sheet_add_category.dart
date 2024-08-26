import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:task_management_app/core/utils/functions/validate/validate_inputs_from_text_valid.dart';
import '../../../../../../../../core/utils/widgets/TextFormField/custom_form_field.dart';
import '../../manager/display_category_cubit/control_categories_cubit.dart';

class FormBottomSheetAddCategory extends StatelessWidget {
  const FormBottomSheetAddCategory({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      hintText: AppLocalizations.of(context)!.ex_sport,
      textLabel: AppLocalizations.of(context)!.category_name,
      functionValidate: (name) {
        if(ValidateInputsFromTextValid.validateCategoryTitle(name) != null) {
          return ValidateInputsFromTextValid.validateCategoryTitle(name);
        }
        BlocProvider.of<ControlCategoriesCubit>(context).categoryName = name;
        return null;
      },
      borderField: const UnderlineInputBorder(
          borderSide: BorderSide(
              color: Colors.blue,
              style: BorderStyle.solid,
              width: 2
          ),
      ),
    );
  }
}

