import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:task_management_app/features/tasks_management/presentation/view/taps/display_categories/view/widgets/show_bottom_sheet_add_category.dart';
import '../../../../../../../../core/services/service_locator.dart';
import '../../../../../../../../task_management_app.dart';
import '../../../../../../data/repos/tasks_management_repo.dart';
import '../../manager/display_category_cubit/control_categories_cubit.dart';
import 'custom_floating_action_button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'list_of_category.dart';

class DisplayCategories extends StatelessWidget {
  const DisplayCategories(
      {super.key, required this.uid});

  final String uid;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(AppLocalizations.of(context)!.today,
                      style: textThemeApp.font18SecondPrimaryBold
                          .copyWith(color: textThemeApp.primaryColor)),
                  Text(DateFormat.yMMMd().format(DateTime.now()),
                      style: textThemeApp.font17PrimaryMedium),
                ],
              ),
            ),
           ListOfCategory(items: BlocProvider.of<ControlCategoriesCubit>(context).categories),
          ],
        ),
        CustomFloatingActionButton(
          onPressed: () {
            showBottomSheetForAddCategory(context,uid: uid);
          },
        )
      ],
    );
  }
}
void showBottomSheetForAddCategory(BuildContext context, {required String uid}) async{
  return showModalBottomSheet(context: context, builder: (context) => Padding(

    padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
    child: BlocProvider(
      create: (context) => ControlCategoriesCubit(
          tasksManagementRepo: getIt.get<TasksManagementRepo>()),
      child: ShowBottomSheetAddCategory(uid: uid),
    ),
  ),
      isScrollControlled: true
  );
}