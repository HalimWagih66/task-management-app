import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:task_management_app/core/services/service_locator.dart';
import 'package:task_management_app/features/tasks_management/data/models/category_model.dart';
import 'package:task_management_app/features/tasks_management/data/repos/tasks_management_repo.dart';
import 'package:task_management_app/features/tasks_management/presentation/view/taps/display_categories/view/widgets/show_bottom_sheet_edit_category.dart';
import '../../../../../../../../core/utils/widgets/dialogs/show_message_awesome_dialog.dart';
import '../../../../../../../home_layout/presentation/manager/user_model_cubit/user_model_cubit.dart';
import '../../../../../cubits/cubits/tasks_management_layout_cubit.dart';
import '../../manager/display_category_cubit/control_categories_cubit.dart';
import 'category_item_body.dart';
import 'custom_slidabel.dart';

class CategoryItem extends StatefulWidget {
  const CategoryItem({super.key, required this.categoryModel});
  final CategoryModel categoryModel;

  @override
  State<CategoryItem> createState() => _CategoryItemState();
}

class _CategoryItemState extends State<CategoryItem> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<ControlCategoriesCubit>(context).updateTaskFieldsInTheCategory(categoryId: widget.categoryModel.categoryId!, uid: BlocProvider.of<UserModelCubit>(context).userModel!.id!, dateTime: DateTime.now());
    tasksManagementLayoutCubit = BlocProvider.of<TasksManagementLayoutCubit>(context);
  }
  late TasksManagementLayoutCubit tasksManagementLayoutCubit;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: InkWell(
        onTap: () {
          tasksManagementLayoutCubit.categoryModel = widget.categoryModel;
          tasksManagementLayoutCubit.animateToPage(page: 1);
        },
        child: CustomSlidable(
          onPressedEdit: () {
            showBottomSheetForEditCategory(categoryModel: widget.categoryModel,context: context, uid: widget.categoryModel.categoryId!);
          },
          onPressedDelete: () {
            showMessageWithAwesomeDialog(title: "Warning", message: "Are you sure you want to delete the study category with the tasks inside it?", dialogType: DialogType.warning,
              okActionName: "Yes",
              btnOkOnPress: () async {
                await BlocProvider.of<ControlCategoriesCubit>(context).deleteCategory(categoryId: widget.categoryModel.categoryId!, uid: BlocProvider.of<UserModelCubit>(context).userModel!.id!, userEmail:BlocProvider.of<UserModelCubit>(context).userModel!.email!);
              },
              context: context,
              cancelActionName: "Cancel",
              btnCancelOnPress: () {

              },
            );
          },
          child: CategoryItemBody(categoryModel: widget.categoryModel)
        ),
      ),
    );
  }
  Future<void>showBottomSheetForEditCategory(
      {required BuildContext context, required CategoryModel categoryModel,required String uid}) async {
    String uid = BlocProvider.of<UserModelCubit>(context).userModel!.id!;
    await showModalBottomSheet(context: context,isScrollControlled: true, builder: (context) => Padding(
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: BlocProvider(
        create: (context) => ControlCategoriesCubit(tasksManagementRepo: getIt.get<TasksManagementRepo>()),
        child: ShowBottomSheetEditCategory(categoryModel: categoryModel,uid: uid,),
      ),
    ));
  }
}


