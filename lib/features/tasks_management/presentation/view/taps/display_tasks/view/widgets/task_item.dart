import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_management_app/features/tasks_management/presentation/view/taps/display_tasks/cubits/control_tasks_cubit/control_tasks_cubit.dart';
import 'package:task_management_app/features/tasks_management/presentation/view/taps/display_tasks/view/widgets/show_bottom_sheet_edit_task.dart';
import 'package:task_management_app/features/tasks_management/presentation/view/taps/display_tasks/view/widgets/task_item_body.dart';
import '../../../../../../../../core/utils/widgets/dialogs/show_message_awesome_dialog.dart';
import '../../../../../../../home_layout/presentation/manager/user_model_cubit/user_model_cubit.dart';
import '../../../../../../data/models/task_model.dart';
import '../../../../../cubits/cubits/tasks_management_layout_cubit.dart';
import '../../../display_categories/view/widgets/custom_slidabel.dart';

class TaskItem extends StatelessWidget {
  const TaskItem({
    super.key,
    required this.taskModel,
  });

  final TaskModel taskModel;

  @override
  Widget build(BuildContext context) {
    var controlTasksCubit = BlocProvider.of<ControlTasksCubit>(context);
    String? categoryId = BlocProvider.of<TasksManagementLayoutCubit>(context).categoryModel!.categoryId;
    String uid = BlocProvider.of<UserModelCubit>(context).userModel!.id!;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CustomSlidable(
        onPressedEdit: ()async {
          await showBottomSheetForEditTask(context,BlocProvider.of<TasksManagementLayoutCubit>(context).categoryModel!.categoryId!);
          await controlTasksCubit.fetchTasks(uid: uid, categoryId: categoryId!);
        },
        onPressedDelete: () async {
          showMessageWithAwesomeDialog(context: context,
            title: "Warning",
            message: "Are you sure you want to delete this task?",
            dialogType: DialogType.warning,
            okActionName: "Ok",
            btnOkOnPress: () async {
              await controlTasksCubit.deleteTaskFromDatabase(
                  uid: FirebaseAuth.instance.currentUser!.email!,
                  categoryId: BlocProvider.of<TasksManagementLayoutCubit>(context).categoryModel!.categoryId!, taskID: taskModel.taskId!);
            },
            cancelActionName: "Cancel",
            btnCancelOnPress: () {

            },);
        },
        child: TaskItemBody(taskModel: taskModel, controlTasksCubit: controlTasksCubit)
      )
    );
  }

  Future<void>showBottomSheetForEditTask(BuildContext context,String categoryId) async {
    String uid = BlocProvider.of<UserModelCubit>(context).userModel!.id!;
    await showModalBottomSheet(context: context,isScrollControlled: true, builder: (context) => Padding(
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: ShowBottomSheetEditTask(categoryId: categoryId, userID: uid, taskModel: taskModel),
    ));
  }
}

