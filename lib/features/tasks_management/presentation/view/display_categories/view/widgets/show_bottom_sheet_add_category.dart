import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:task_management_app/core/utils/theme/constant_colors.dart';
import 'package:task_management_app/core/utils/widgets/buttons/custom_ink_will.dart';
import 'package:task_management_app/core/utils/widgets/dialogs/show_dialog_upload_image.dart';
import 'package:task_management_app/features/tasks_management/presentation/view/display_categories/manager/display_categories_cubit.dart';
import 'package:task_management_app/material_application.dart';
import 'custom_display_add_category.dart';
import 'display_image_in_bottom_sheet_add_category.dart';
import 'form_bottom_sheet_add_category.dart';

class ShowBottomSheetAddCategory extends StatefulWidget {
   const ShowBottomSheetAddCategory({super.key, required this.uid});
  final String uid;
  @override
  State<ShowBottomSheetAddCategory> createState() => _ShowBottomSheetAddCategoryState();
}

class _ShowBottomSheetAddCategoryState extends State<ShowBottomSheetAddCategory> {
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  AppLocalizations.of(context)!.add_category,
                  style: textThemeApp.font18SecondPrimaryBold.copyWith(color: textThemeApp.primaryColor),
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
                  height: 10,
                ),
                InkWell(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    showDialogUploadImage(context: context, onPressedCamera: BlocProvider.of<DisplayCategoriesCubit>(context).onPressedCamera, onPressedGallery: BlocProvider.of<DisplayCategoriesCubit>(context).onPressedGallery);
                  },
                  child: const DisplayImageInBottomSheetAddCategory(),
                ),
                const SizedBox(
                  height: 5,
                ),
                Form(
                  key: formKey,
                  child: const FormBottomSheetAddCategory(),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            CustomInkWill(
              background: primaryColorApp,
              onTap: () async {
                if(formKey.currentState!.validate() && BlocProvider.of<DisplayCategoriesCubit>(context).checkPickImageIsValid()){
                    await BlocProvider.of<DisplayCategoriesCubit>(context).addCategory(uid:widget.uid);
                }
              },
              child:  SizedBox(width: MediaQuery.sizeOf(context).width,child:  const CustomDisplayAddCategory()),
            )
          ],
        ),
      ),
    );
  }
}

