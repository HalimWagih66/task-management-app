import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:task_management_app/core/utils/theme/constant_colors.dart';
import 'package:task_management_app/core/utils/widgets/buttons/custom_ink_will.dart';
import 'package:task_management_app/core/utils/widgets/dialogs/show_dialog_upload_image.dart';
import 'package:task_management_app/core/utils/widgets/display_images/custom_cached_network_image.dart';
import 'package:task_management_app/core/utils/widgets/display_images/custom_circle_image.dart';
import 'package:task_management_app/core/utils/widgets/display_images/custom_circle_image_for_file_image.dart';
import 'package:task_management_app/features/tasks_management/presentation/view/display_categories/manager/display_categories_cubit.dart';
import 'package:task_management_app/material_application.dart';
import '../../../../../data/models/category_model.dart';
import 'custom_display_save_changes.dart';
import 'custom_form_for_sheet_edit_category.dart';
class ShowBottomSheetEditCategory extends StatefulWidget {
  const ShowBottomSheetEditCategory({super.key, required this.categoryModel, required this.uid});
  final CategoryModel categoryModel;
  final String uid;
  @override
  State<ShowBottomSheetEditCategory> createState() => _ShowBottomSheetAddCategoryState();
}

class _ShowBottomSheetAddCategoryState extends State<ShowBottomSheetEditCategory>{
  var formKey = GlobalKey<FormState>();

   @override
  Widget build(BuildContext context) {

    return  SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
               mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(AppLocalizations.of(context)!.edit_Category,style: textThemeApp.font18SecondPrimaryBold.copyWith(color: textThemeApp.primaryColor)),
                const SizedBox(
                  height: 30,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                    child: Text(AppLocalizations.of(context)!.category_image,style: textThemeApp.font17PrimaryMedium.copyWith(letterSpacing: 1.5,decorationThickness: 0),)),
                const SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: ()async{
                    showDialogUploadImage(context: context, onPressedCamera: BlocProvider.of<DisplayCategoriesCubit>(context).onPressedCamera, onPressedGallery: BlocProvider.of<DisplayCategoriesCubit>(context).onPressedGallery);
                  },
                  child: Column(
                    children: [
                      CustomCircleImage(
                          firstRadios: 80.w,
                          secondRadios: 77.w,
                          child: BlocConsumer<DisplayCategoriesCubit,DisplayCategoriesState>(
                              listener: (context, state) {
                                if(state is CategoryImageSuccess){
                                  GoRouter.of(context).pop();
                                }
                              },
                              builder: (BuildContext context, DisplayCategoriesState state) {
                                if(state is CategoryImageSuccess){
                                  return CustomCircleImageForFileImage(
                                    imageProvider: FileImage(state.file),
                                  );
                                }
                                return CustomCachedNetworkImage(height: 200.h,urlImage: widget.categoryModel.categoryImage!,);
                              },
                          )
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Form(key: formKey,child: CustomFormForSheetEditCategory(initialValue: widget.categoryModel.categoryName!, categoryId: widget.categoryModel.categoryId!, uid: widget.uid)),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: CustomInkWill(
                  background: primaryColorApp,
                onTap: () {
                    if(formKey.currentState!.validate());
                    if(BlocProvider.of<DisplayCategoriesCubit>(context).pickImage != null){
                      BlocProvider.of<DisplayCategoriesCubit>(context).uploadCategoryImageForEdit(uid:widget.uid, imageName: widget.categoryModel.categoryId!,categoryId: widget.categoryModel.categoryId!);
                    }
                },
                child: const CustomDisplaySaveChanges(),
            )
        ),
        ]
      ),
      ),
    );
  }
}
