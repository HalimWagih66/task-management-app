import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_management_app/features/home_layout/presentation/manager/user_model_cubit/user_model_cubit.dart';
import 'package:task_management_app/features/tasks_management/presentation/cubits/cubits/tasks_management_layout_cubit.dart';
import '../../../../../../../../core/utils/widgets/cases/custom_display_error.dart';
import '../../cubits/control_tasks_cubit/control_tasks_cubit.dart';
import 'custom_display_items_is_empty_for_tasks.dart';
import 'custom_loading_for_tasks.dart';
import 'display_tasks.dart';

class DisplayTasksBody extends StatefulWidget
{
  const DisplayTasksBody({super.key});

  @override
  State<DisplayTasksBody> createState() => _DisplayTasksBodyState();
}

class _DisplayTasksBodyState extends State<DisplayTasksBody> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<ControlTasksCubit>(context).listenToTasksFromTheDatabase(categoryId: BlocProvider.of<TasksManagementLayoutCubit>(context).categoryModel!.categoryId!, uid: BlocProvider.of<UserModelCubit>(context).userModel!.id!, dateTime: DateTime.now());
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ControlTasksCubit,ControlTasksState>(
      builder: (context, state) {
        if(state is FetchTasksLoading){
          return const CustomLoadingForTasks();
        }
        else if(state is FetchTasksFailure){
          return CustomDisplayError(errorMessage: state.errorMessage);
        }
        else if(state is FetchTasksIsEmpty){
          return const CustomDisplayItemsIsEmptyForTasks();
        }else if(state is FetchTasksSuccess){
          return DisplayTasks(items:state.tasks);
        }else{
          return const SizedBox();
        }
      },
    );
  }
}
