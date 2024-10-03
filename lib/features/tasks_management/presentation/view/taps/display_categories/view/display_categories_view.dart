import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_management_app/core/services/service_locator.dart';
import 'package:task_management_app/core/utils/widgets/app_bar/custom_app_bar.dart';
import 'package:task_management_app/features/home_layout/presentation/manager/user_model_cubit/user_model_cubit.dart';
import 'package:task_management_app/features/tasks_management/data/repos/tasks_management_repo.dart';
import 'package:task_management_app/features/tasks_management/presentation/view/taps/display_categories/view/widgets/display_categories_body.dart';
import 'package:task_management_app/features/tasks_management/presentation/view/taps/display_tasks/cubits/control_tasks_cubit/control_tasks_cubit.dart';
import '../manager/display_category_cubit/control_categories_cubit.dart';

class DisplayCategoriesView extends StatelessWidget {
  const DisplayCategoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 11.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomAppBar(title: "Display Categories"),
          Expanded(
            child: MultiBlocProvider(
              providers: [
                BlocProvider(create: (context) => ControlCategoriesCubit(tasksManagementRepo: getIt.get<TasksManagementRepo>())),
                BlocProvider(create: (context) => ControlTasksCubit(tasksManagementRepo: getIt.get<TasksManagementRepo>())),
              ],
                child: DisplayCategoriesBody(
                  uid: BlocProvider.of<UserModelCubit>(context).userModel!.id!,
                ),
            ),
          ),
        ],
      ),
    );
  }
}
