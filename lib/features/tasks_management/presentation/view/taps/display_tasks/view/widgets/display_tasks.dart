import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_management_app/features/home_layout/presentation/manager/user_model_cubit/user_model_cubit.dart';
import 'package:task_management_app/features/tasks_management/presentation/view/taps/display_tasks/cubits/control_tasks_cubit/control_tasks_cubit.dart';
import 'package:task_management_app/features/tasks_management/presentation/view/taps/display_tasks/view/widgets/show_bottom_sheet_add_task.dart';
import '../../../../../../data/models/task_model.dart';
import '../../../display_categories/view/widgets/custom_floating_action_button.dart';
import 'custom_date_picker.dart';
import 'display_list_of_status.dart';
import 'display_list_of_tasks.dart';

class DisplayTasks extends StatelessWidget {
  const DisplayTasks({super.key, required this.tasks,required this.categoryId});
  final List<TaskModel> tasks;
  final String categoryId;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
         CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(
              child: CustomDatePicker(),
            ),
            const SliverToBoxAdapter(
              child: DisplayListOfStatus(),
            ),
            const SliverToBoxAdapter(child:  SizedBox(height: 20)),
            DisplayListOfTasks(items: tasks)
          ],
        ),
        CustomFloatingActionButton(
          onPressed: () async{
            await showModalBottomSheetForAddTask(context, categoryId);
            await BlocProvider.of<ControlTasksCubit>(context).fetchTasks(uid: BlocProvider.of<UserModelCubit>(context).userModel!.id!, categoryId: categoryId);
          },
        )
      ],
    );
  }

  Future<void> showModalBottomSheetForAddTask(BuildContext context, String categoryId,)async {
    String userId = BlocProvider.of<UserModelCubit>(context).userModel!.id!;
     await showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (context) =>  Padding(
          padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: ShowBottomSheetAddTask(categoryId: categoryId,userID: userId),
        )
    );
  }
}
