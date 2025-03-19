import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_management_app/features/home_layout/presentation/manager/user_model_cubit/user_model_cubit.dart';
import 'package:task_management_app/features/tasks_management/presentation/cubits/cubits/tasks_management_layout_cubit.dart';
import 'package:task_management_app/features/tasks_management/presentation/view/taps/display_tasks/cubits/control_tasks_cubit/control_tasks_cubit.dart';
import 'package:task_management_app/features/tasks_management/presentation/view/taps/display_tasks/view/widgets/status_item.dart';

class DisplayListOfStatus extends StatefulWidget {
  const DisplayListOfStatus({super.key});

  @override
  State<DisplayListOfStatus> createState() => _DisplayListOfStatusState();
}

class _DisplayListOfStatusState extends State<DisplayListOfStatus> {
  final List<String>status = const [
    "TODO",
    "In Progress",
    "Done"
  ];



  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 33,
      child: Row(
        children: [
          InkWell(onTap: () async{
            BlocProvider.of<ControlTasksCubit>(context).status = -1;
            await BlocProvider.of<ControlTasksCubit>(context).fetchTasksByDate(categoryId: BlocProvider.of<TasksManagementLayoutCubit>(context).categoryModel!.categoryId!,uid: BlocProvider.of<UserModelCubit>(context).userModel!.id!);

          },child: StatusItem(statusName: "All",isSelected: BlocProvider.of<ControlTasksCubit>(context).status == -1),
          ),
          ListView.builder(scrollDirection: Axis.horizontal,itemBuilder: (context, index) {
            return InkWell(
              onTap: () async {
                BlocProvider.of<ControlTasksCubit>(context).status = index;
                await BlocProvider.of<ControlTasksCubit>(context).fetchTasksByState(status: index,categoryId: BlocProvider.of<TasksManagementLayoutCubit>(context).categoryModel!.categoryId!,uid: BlocProvider.of<UserModelCubit>(context).userModel!.id!);
              },
              child: StatusItem(statusName: status[index], isSelected: BlocProvider.of<ControlTasksCubit>(context).status == index),
            );
          },shrinkWrap: true,itemCount: status.length,),
        ],
      ),
    );
  }
}
