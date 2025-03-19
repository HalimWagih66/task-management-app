import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_management_app/core/utils/widgets/cases/custom_display_items_is_empty.dart';
import 'package:task_management_app/features/home_layout/data/home_layout_repo.dart';
import 'package:task_management_app/features/home_layout/presentation/manager/user_model_cubit/user_model_cubit.dart';
import 'package:task_management_app/features/tasks_management/presentation/view/taps/display_categories/view/widgets/custom_floating_action_button.dart';
import 'package:task_management_app/features/tasks_management/presentation/view/taps/display_tasks/view/widgets/custom_date_picker.dart';
import 'package:task_management_app/features/tasks_management/presentation/view/taps/display_tasks/view/widgets/display_list_of_status.dart';
import 'package:task_management_app/features/tasks_management/presentation/view/taps/display_tasks/view/widgets/show_bottom_sheet_add_task.dart';
import '../../../../../../../../core/services/service_locator.dart';
import '../../../../../../../../core/utils/cubits/image_picker_cubit/image_picker_cubit.dart';
import '../../../../../../data/repos/tasks_management_repo.dart';
import '../../../../../cubits/cubits/tasks_management_layout_cubit.dart';
import '../../cubits/control_tasks_cubit/control_tasks_cubit.dart';

class CustomDisplayItemsIsEmptyForTasks extends StatelessWidget {
  const CustomDisplayItemsIsEmptyForTasks({super.key});

  @override
  Widget build(BuildContext context) {
      return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Column(
          children: [
            CustomDatePicker(),
            DisplayListOfStatus(),
          ],
        ),
        const CustomDisplayItemsIsEmpty(title: "Tasks"),

        CustomFloatingActionButton(onPressed: () async{
          await showModalBottomSheetForAddTask(context:context,categoryId: BlocProvider.of<TasksManagementLayoutCubit>(context).categoryModel!.categoryId!,userID: BlocProvider.of<UserModelCubit>(context).userModel!.id!);
          await BlocProvider.of<ControlTasksCubit>(context).fetchTasks(categoryId: BlocProvider.of<TasksManagementLayoutCubit>(context).categoryModel!.categoryId!,uid: BlocProvider.of<UserModelCubit>(context).userModel!.id!);
        },)
      ],
    );
  }
  Future<void> showModalBottomSheetForAddTask({required BuildContext context, required String categoryId, required String userID}) async {
    await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => Padding(
        padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => ImagePickerCubit()),
            BlocProvider(create: (context) => ControlTasksCubit(tasksManagementRepo: getIt.get<TasksManagementRepo>())),
            BlocProvider(create: (context) => UserModelCubit(homeLayoutRepo: getIt.get<HomeLayoutRepo>())),

          ],
          child: ShowBottomSheetAddTask(categoryId: categoryId,userID: userID),
        ),
      ),
    );
  }
}


