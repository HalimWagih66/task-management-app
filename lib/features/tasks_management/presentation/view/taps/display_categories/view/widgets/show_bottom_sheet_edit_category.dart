import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:task_management_app/core/utils/cubits/image_picker_cubit/image_picker_cubit.dart';
import 'package:task_management_app/features/tasks_management/presentation/view/taps/display_categories/view/widgets/show_bottom_sheet_edit_category_body.dart';
import 'package:task_management_app/material_application.dart';
import '../../../../../../data/models/category_model.dart';

class ShowBottomSheetEditCategory extends StatelessWidget {
  const ShowBottomSheetEditCategory(
      {super.key, required this.categoryModel, required this.uid});

  final CategoryModel categoryModel;
  final String uid;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(AppLocalizations.of(context)!.edit_Category, style: textThemeApp.font18SecondPrimaryBold.copyWith(color: textThemeApp.primaryColor)),
            const SizedBox(
              height: 30,
            ),
            BlocProvider(
              create: (context) => ImagePickerCubit(),
              child: ShowBottomSheetEditCategoryBody(
                uid: uid,
                categoryModel: categoryModel,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
