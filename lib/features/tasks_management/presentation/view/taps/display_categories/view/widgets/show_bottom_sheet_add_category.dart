import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:task_management_app/core/utils/cubits/image_picker_cubit/image_picker_cubit.dart';
import 'package:task_management_app/features/tasks_management/presentation/view/taps/display_categories/view/widgets/show_bottom_sheet_add_category_body.dart';
import '../../../../../../../../task_management_app.dart';

class ShowBottomSheetAddCategory extends StatelessWidget {
  const ShowBottomSheetAddCategory({super.key, required this.uid});

  final String uid;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              AppLocalizations.of(context)!.add_category,
              style: textThemeApp.font18SecondPrimaryBold
                  .copyWith(color: textThemeApp.primaryColor),
            ),
            const SizedBox(
              height: 30,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                AppLocalizations.of(context)!.category_image,
                style: textThemeApp.font18SecondPrimaryBold.copyWith(color: textThemeApp.primaryColor).copyWith(letterSpacing: 1.5, decorationThickness: 0),
              ),
            ),
            const SizedBox(
              height: 13,
            ),
            BlocProvider(
                create: (context) => ImagePickerCubit(),
                child: ShowBottomSheetAddCategoryBody(uid: uid),
            )
          ],
        ),
      ),
    );
  }
}
