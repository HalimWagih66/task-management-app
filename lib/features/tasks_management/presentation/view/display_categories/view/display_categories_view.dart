import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:task_management_app/core/services/service_locator.dart';
import 'package:task_management_app/core/utils/widgets/custom_app_bar.dart';
import 'package:task_management_app/features/home_layout/presentation/manager/user_model_cubit/user_model_cubit.dart';
import 'package:task_management_app/features/tasks_management/data/repos/tasks_management_repo.dart';
import 'package:task_management_app/features/tasks_management/presentation/view/display_categories/view/widgets/display_categories_body.dart';
import 'package:task_management_app/material_application.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../manager/display_categories_cubit.dart';

class DisplayCategoriesView extends StatelessWidget {
  const DisplayCategoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 11.0),
      child: BlocProvider(
        create: (context) => DisplayCategoriesCubit(tasksManagementRepo: getIt.get<TasksManagementRepo>()),
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomAppBar(title: "Display Categories"),
                  Text(DateFormat.yMMMd().format(DateTime.now()), style: textThemeApp.font17PrimaryMedium),
                  Text(AppLocalizations.of(context)!.today, style: textThemeApp.font18SecondPrimaryBold.copyWith(color: textThemeApp.primaryColor)),
                  const SizedBox(height: 16),
                  DisplayCategoriesBody(uid: BlocProvider.of<UserModelCubit>(context).userModel!.id!)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}



