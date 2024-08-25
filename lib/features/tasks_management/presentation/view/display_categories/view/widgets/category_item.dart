import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_management_app/core/services/service_locator.dart';
import 'package:task_management_app/core/utils/theme/constant_colors.dart';
import 'package:task_management_app/core/utils/widgets/display_images/custom_cached_network_image.dart';
import 'package:task_management_app/core/utils/widgets/display_images/custom_circle_image.dart';
import 'package:task_management_app/features/tasks_management/data/repos/tasks_management_repo.dart';
import 'package:task_management_app/features/tasks_management/presentation/view/display_categories/view/widgets/custom_circular_precent_indcator.dart';
import 'package:task_management_app/features/tasks_management/presentation/view/display_categories/view/widgets/custom_slidabel.dart';
import 'package:task_management_app/features/tasks_management/presentation/view/display_categories/view/widgets/show_bottom_sheet_edit_category.dart';
import 'package:task_management_app/material_application.dart';
import '../../../../../../../core/utils/widgets/dialogs/show_message_awesome_dialog.dart';
import '../../../../../../home_layout/presentation/manager/user_model_cubit/user_model_cubit.dart';
import '../../../../../data/models/category_model.dart';
import '../../manager/display_categories_cubit.dart';

class CategoryItem extends StatefulWidget {
  const CategoryItem({super.key, required this.categoryModel});

  final CategoryModel categoryModel;

  @override
  State<CategoryItem> createState() => _CategoryItemState();
}

class _CategoryItemState extends State<CategoryItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: InkWell(
        onTap: () {},
        child: CustomSlidable(
          onPressedEdit: () {
            showBottomSheetEditCategory(context);
          },
          categoryId: widget.categoryModel.categoryId!,
          onPressedDelete: () {
            showMessageWithAwesomeDialog(title: "Warning", message: "Are you sure you want to delete the study category with the tasks inside it?", dialogType: DialogType.warning,
              okActionName: "Yes",
              btnOkOnPress: () async {
                await BlocProvider.of<DisplayCategoriesCubit>(context).deleteCategory(categoryId: widget.categoryModel.categoryId!, uid: BlocProvider.of<UserModelCubit>(context).userModel!.id!);
              },
              context: context,
              cancelActionName: "Cancel",
              btnCancelOnPress: () {

              },
            );
          },
          child: Container(
            padding: const EdgeInsets.all(8.0),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  bottomLeft: Radius.circular(16)),
              color: primaryColorApp,
            ),
            child: Row(
              children: [
                CustomCircleImage(
                  firstRadios: 33.w,
                  secondRadios: 33.w,
                  child: CustomCachedNetworkImage(
                      urlImage: widget.categoryModel.categoryImage??"L",
                      height: 70.h),
                ),
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(widget.categoryModel.categoryName!, style: textThemeApp.font18SecondPrimaryBold),
                        Text("${widget.categoryModel.numberTasks}", style: textThemeApp.font15greyRegular.copyWith(color: textThemeApp.secondPrimaryColor),
                        )
                      ],
                    ),
                  ),
                ),
                CustomCircularPercentIndicator(
                    categoryId: widget.categoryModel.categoryId!)
              ],
            ),
          ),
        ),
      ),
    );
  }

  void showBottomSheetEditCategory(BuildContext context) {
    String uid = BlocProvider.of<UserModelCubit>(context).userModel!.id!;
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) => Padding(
        padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: BlocProvider(
      create: (context) => DisplayCategoriesCubit(tasksManagementRepo: getIt.get<TasksManagementRepo>()),
          child: ShowBottomSheetEditCategory(
          uid:  uid,
          categoryModel: widget.categoryModel,
        ),
        ),
      ),
    );
  }


// num displayPercent(BuildContext context){
//
//   print("completedTasks ${Provider.of<CategoryItemProvider>(context,listen: false).completedTasks}");
//   print("numberOfTask ${Provider.of<CategoryItemProvider>(context,listen: false).numberOfTasks}");
//
//   var categoryItemProvider = Provider.of<CategoryItemProvider>(context,listen: false);
//   if(categoryItemProvider.numberOfTasks == 0){
//     return 0;
//   }
//   return categoryItemProvider.completedTasks/categoryItemProvider.numberOfTasks*100.floor();
// }
}
