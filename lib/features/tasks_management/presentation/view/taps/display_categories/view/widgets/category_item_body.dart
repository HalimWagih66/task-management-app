import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:task_management_app/features/tasks_management/data/models/category_model.dart';
import 'package:task_management_app/features/tasks_management/presentation/view/taps/display_categories/view/widgets/show_bottom_sheet_edit_category.dart';
import 'package:task_management_app/features/tasks_management/presentation/view/taps/display_tasks/cubits/control_tasks_cubit/control_tasks_cubit.dart';
import '../../../../../../../../core/services/service_locator.dart';
import '../../../../../../../../core/utils/constant/url_temporary.dart';
import '../../../../../../../../core/utils/style/custom_decoration_for_tasks_management.dart';
import '../../../../../../../../core/utils/widgets/dialogs/show_message_awesome_dialog.dart';
import '../../../../../../../../core/utils/widgets/display_images/custom_cached_network_image.dart';
import '../../../../../../../../core/utils/widgets/display_images/custom_circle_image.dart';
import '../../../../../../../home_layout/presentation/manager/user_model_cubit/user_model_cubit.dart';
import '../../../../../../data/repos/tasks_management_repo.dart';
import '../../../../../cubits/cubits/tasks_management_layout_cubit.dart';
import '../../manager/display_category_cubit/control_categories_cubit.dart';
import 'custom_slidabel.dart';
import 'display_category_name_and_number_of_tasks.dart';
import 'display_percentage.dart';

class CategoryItemBody extends StatefulWidget {
  const CategoryItemBody({super.key, required this.categoryModel, required this.numberOfTasks});
  final CategoryModel categoryModel;
  final int numberOfTasks;

  @override
  State<CategoryItemBody> createState() => _CategoryItemBodyState();
}

class _CategoryItemBodyState extends State<CategoryItemBody> {
  @override
  void initState() {
    BlocProvider.of<ControlTasksCubit>(context).listenToTasksFromTheDatabase(categoryId: widget.categoryModel.categoryId!, uid: BlocProvider.of<UserModelCubit>(context).userModel!.id!, dateTime: DateUtils.dateOnly(DateTime.now()));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: InkWell(
        onTap: () {
          BlocProvider.of<TasksManagementLayoutCubit>(context).categoryModel = widget.categoryModel;
          BlocProvider.of<TasksManagementLayoutCubit>(context).animateToPage(page: 1);
        },
        child: CustomSlidable(
          onPressedEdit: () {
            showBottomSheetEditCategory(context);
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
          child: Container(
            padding: const EdgeInsets.all(8.0),
            decoration: customDecorationForTasksManagement(),
            child: Row(
              children: [
                CustomCircleImage(
                  firstRadios: 33.w,
                  secondRadios: 33.w,
                  child: CustomCachedNetworkImage(
                      urlImage: widget.categoryModel.categoryImage??TemporaryUrls.displayImageCaseBaseImageIsNull, height: 70.h),
                ),
                Flexible(
                  child: BlocBuilder<ControlTasksCubit,ControlTasksState>(
                    builder: (context, state) {
                      if(state is FetchTasksSuccess){
                        return Row(
                          children: [
                            DisplayCategoryNameAndNumberOfTasks(categoryName: widget.categoryModel.categoryName!,numberOfTasks: state.tasks.length),
                            DisplayPercentage(
                              categoryId: widget.categoryModel.categoryId!,
                              numberOfTasks: widget.numberOfTasks,
                            )
                          ],
                        );
                      }
                      else if(state is FetchTasksLoading){
                        return Skeletonizer(
                          enabled: true,
                          child: Row(
                            children: [
                              DisplayCategoryNameAndNumberOfTasks(categoryName: widget.categoryModel.categoryName!,numberOfTasks: 4),
                              DisplayPercentage(
                                categoryId: widget.categoryModel.categoryId!,
                                numberOfTasks: widget.numberOfTasks,
                              )
                            ],
                          ),
                        );
                      }else{
                        return const SizedBox();
                      }
                    },
                  ),
                ),
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
          create: (context) => ControlCategoriesCubit(tasksManagementRepo: getIt.get<TasksManagementRepo>()),
          child: ShowBottomSheetEditCategory(
            uid:  uid,
            categoryModel: widget.categoryModel,
          ),
        ),
      ),
    );
  }
}