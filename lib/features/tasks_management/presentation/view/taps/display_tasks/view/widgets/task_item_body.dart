import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_management_app/features/tasks_management/presentation/view/taps/display_tasks/cubits/control_tasks_cubit/control_tasks_cubit.dart';
import '../../../../../../../home_layout/presentation/manager/user_model_cubit/user_model_cubit.dart';
import '../../../../../../data/models/task_model.dart';
import '../../../../../cubits/cubits/tasks_management_layout_cubit.dart';
import 'display_status_task.dart';

class TaskItemBody extends StatelessWidget {
  const TaskItemBody({
    super.key,
    required this.taskModel,
    required this.controlTasksCubit,
  });

  final TaskModel taskModel;
  final ControlTasksCubit controlTasksCubit;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(10), bottomLeft: Radius.circular(10)),
      child: Card(
        shape: LinearBorder.end(side: BorderSide(
            color: taskModel.priority != null ? controlTasksCubit.importance[taskModel.priority!] : Colors.transparent,
            style: BorderStyle.solid, width: 13)),
        elevation: 5,
        margin: EdgeInsets.zero,
        child: ListTile(
          title: Text(taskModel.title ?? ""),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(taskModel.desc ?? ""),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.alarm),
                      const SizedBox(width: 5),
                      Text(taskModel.time!)
                    ],
                  ),
                  InkWell(
                    onTap: () async {
                      if (taskModel.status! <= 1) {
                        taskModel.status = taskModel.status!+1;
                        controlTasksCubit.editFieldsInTaskInDatabase(taskId: taskModel.taskId!, categoryId: BlocProvider.of<TasksManagementLayoutCubit>(context).categoryModel!.categoryId!,uid: BlocProvider.of<UserModelCubit>(context).userModel!.id!, newData: {"status": (taskModel.status!)});
                      }
                    },
                    child: DisplayStatusTask(status: taskModel.status!),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
