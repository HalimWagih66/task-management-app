import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_management_app/core/services/service_locator.dart';
import 'package:task_management_app/features/tasks_management/presentation/cubits/cubits/tasks_management_layout_cubit.dart';
import 'package:task_management_app/features/tasks_management/presentation/view/taps/display_tasks/cubits/control_tasks_cubit/control_tasks_cubit.dart';
import 'package:task_management_app/features/tasks_management/presentation/view/taps/display_tasks/view/widgets/display_tasks_body.dart';
import '../../../../../../../core/utils/widgets/app_bar/custom_app_bar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../../data/repos/tasks_management_repo.dart';

class DisplayTasksView extends StatelessWidget {
  const DisplayTasksView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomAppBar(
            title: AppLocalizations.of(context)!.all_tasks,
            leadingIconData: Icons.arrow_back_ios,
            onPressed: () async {
              await BlocProvider.of<TasksManagementLayoutCubit>(context,
                      listen: false)
                  .animateToPage(page: 0);
            }),
        BlocProvider(create: (context) => ControlTasksCubit(tasksManagementRepo: getIt.get<TasksManagementRepo>()),child: const Expanded(child: DisplayTasksBody()))
      ],
    );
  }
}
