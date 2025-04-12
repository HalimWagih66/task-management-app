import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_management_app/core/utils/cubits/image_picker_cubit/image_picker_cubit.dart';
import 'package:task_management_app/core/utils/widgets/dialogs/show_dialog_upload_image.dart';
import 'package:task_management_app/features/tasks_management/data/models/category_model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../../../../../core/utils/style/theme/constant_colors.dart';
import '../../../../../../../../core/utils/widgets/buttons/custom_ink_will.dart';
import '../../../../../../../../core/utils/widgets/display_images/custom_picked_image_for_change_image.dart';
import '../../../../../../../../task_management_app.dart';
import '../../manager/display_category_cubit/control_categories_cubit.dart';
import 'custom_display_save_changes.dart';
import 'custom_form_for_sheet_edit_category.dart';

class ShowBottomSheetEditCategoryBody extends StatefulWidget {
  const ShowBottomSheetEditCategoryBody({
    super.key,
    required this.uid,
    required this.categoryModel,
  });

  final CategoryModel categoryModel;
  final String uid;

  @override
  State<ShowBottomSheetEditCategoryBody> createState() => _ShowBottomSheetEditCategoryBodyState();
}

class _ShowBottomSheetEditCategoryBodyState extends State<ShowBottomSheetEditCategoryBody> {
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          Align(
              alignment: Alignment.centerLeft,
              child: Text(AppLocalizations.of(context)!.category_image,style: textThemeApp.font17PrimaryMedium.copyWith(letterSpacing: 1.5,decorationThickness: 0),)),
          const SizedBox(
            height: 10,
          ),
          CustomPickedImageForChangeImage(
            onTap: () {
              showDialogUploadImage(context: context, onPressedCamera: BlocProvider.of<ImagePickerCubit>(context).onPressedCamera, onPressedGallery: BlocProvider.of<ImagePickerCubit>(context).onPressedGallery);
            },
            imageUrl: widget.categoryModel.categoryImage!, caseImagePickerSuccess: (){
             BlocProvider.of<ControlCategoriesCubit>(context).pickImage = BlocProvider.of<ImagePickerCubit>(context).pickedImage;
          },
          ),
          const SizedBox(
            height: 15,
          ),
          CustomFormForSheetEditCategory(initialValue: widget.categoryModel.categoryName!, categoryId: widget.categoryModel.categoryId!, uid: widget.uid),
          const SizedBox(
            height: 30,
          ),
          SizedBox(
              width: MediaQuery.of(context).size.width,
              child: CustomInkWill(
                background: primaryColorApp,
                onTap: () {
                  if(formKey.currentState!.validate());
                  if(BlocProvider.of<ControlCategoriesCubit>(context).pickImage != null && BlocProvider.of<ImagePickerCubit>(context).checkPickImageNullOrNotWithoutEmitSuccess()){
                    BlocProvider.of<ControlCategoriesCubit>(context).uploadCategoryImageForEdit(uid:widget.uid, imageName: widget.categoryModel.categoryId!,categoryId: widget.categoryModel.categoryId!);
                  }
                },
                child: const CustomDisplaySaveChanges(),
              )
          ),
        ],
      ),
    );
  }
}
