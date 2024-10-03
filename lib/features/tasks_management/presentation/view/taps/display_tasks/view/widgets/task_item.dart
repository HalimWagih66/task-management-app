import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:day_night_time_picker/lib/state/time.dart';
import 'package:task_management_app/core/utils/constant/url_temporary.dart';
import 'package:task_management_app/core/utils/widgets/dialogs/show_message_awesome_dialog.dart';
import 'package:task_management_app/core/utils/widgets/display_images/custom_circle_image.dart';
import 'package:task_management_app/features/tasks_management/presentation/cubits/cubits/tasks_management_layout_cubit.dart';
import 'package:task_management_app/features/tasks_management/presentation/view/taps/display_categories/view/widgets/custom_slidabel.dart';
import 'package:task_management_app/features/tasks_management/presentation/view/taps/display_tasks/cubits/control_tasks_cubit/control_tasks_cubit.dart';
import '../../../../../../../../core/utils/widgets/display_images/custom_cached_network_image.dart';
import '../../../../../../data/models/task_model.dart';
import 'display_status_task.dart';
class TaskItem extends StatelessWidget {
  const TaskItem({super.key,required this.taskModel});
  final TaskModel taskModel;

  @override
  Widget build(BuildContext context) {
    var controlTasksCubit = BlocProvider.of<ControlTasksCubit>(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CustomSlidable(
        onPressedEdit:  () {

        },
        onPressedDelete: () async{
          showMessageWithAwesomeDialog(context: context,title: "Warning", message: "Are you sure you want to delete this task?", dialogType: DialogType.warning,okActionName: "Ok",btnOkOnPress: () async{
            await controlTasksCubit.deleteTaskFromDatabase(uid: FirebaseAuth.instance.currentUser!.email!, categoryId: BlocProvider.of<TasksManagementLayoutCubit>(context).categoryModel!.categoryId!, taskID: taskModel.taskId!);
          },cancelActionName: "Cancel",btnCancelOnPress: () {

          },);
        },
        child: ClipRRect(
          borderRadius: const BorderRadius.only(topLeft: Radius.circular(10),bottomLeft: Radius.circular(10)),
          child: Card(
            shape: LinearBorder.end(side:  BorderSide(color: taskModel.priority!=null?controlTasksCubit.importance[taskModel.priority!]:Colors.transparent,style: BorderStyle.solid,width: 13)),
            elevation: 5,
            margin: EdgeInsets.zero,
            child:ListTile(
              leading: CustomCircleImage(firstRadios: 38,secondRadios: 35,
              child: CustomCachedNetworkImage(urlImage: taskModel.imageUrl??TemporaryUrls.displayImageCaseBaseImageIsNull,height: 50,)),
              title:  Text(taskModel.title??""),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   Text(taskModel.desc??""),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                        Row(
                        children: [
                          const Icon(Icons.alarm),
                          const SizedBox(width: 5),
                          Text(Time.fromTimeOfDay(TimeOfDay(hour: int.parse(taskModel.time!.substring(0,taskModel.time!.indexOf(":"))),minute: int.parse(taskModel.time!.substring(taskModel.time!.indexOf(":")+1,taskModel.time!.length))), null).format(context)),
                        ],
                      ),
                      InkWell(
                        onTap: () async{


                          },
                        child: DisplayStatusTask(status: taskModel.status!),
                      )
                    ],
                  )
                ],
              ),
            ) ,
          ),
        ),
      ),
    );
  }
}


