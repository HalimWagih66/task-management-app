import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_management_app/features/tasks_management/presentation/cubits/cubits/tasks_management_layout_cubit.dart';
import '../../../../../../../../core/utils/widgets/cases/custom_display_error.dart';
import '../../cubits/control_tasks_cubit/control_tasks_cubit.dart';
import 'custom_display_items_is_empty_for_tasks.dart';
import 'custom_loading_for_tasks.dart';
import 'display_tasks.dart';

class DisplayTasksBody extends StatelessWidget
{
  const DisplayTasksBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ControlTasksCubit,ControlTasksState>(
      builder: (context, state) {
        if(state is FetchTasksLoading){
          return const CustomLoadingForTasks();
        } else if(state is FetchTasksFailure){
          return CustomDisplayError(errorMessage: state.errorMessage);
        } else if(state is FetchTasksIsEmpty){
          return const CustomDisplayItemsIsEmptyForTasks();
        }else{
          return DisplayTasks(tasks: BlocProvider.of<ControlTasksCubit>(context).tasks,categoryId: BlocProvider.of<TasksManagementLayoutCubit>(context).categoryModel!.categoryId!);
        }
      },
    );
  }
}
