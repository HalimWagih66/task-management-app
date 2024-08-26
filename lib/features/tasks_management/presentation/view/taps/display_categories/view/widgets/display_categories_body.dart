import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:task_management_app/core/services/service_locator.dart';
import 'package:task_management_app/features/tasks_management/data/repos/tasks_management_repo.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:task_management_app/features/tasks_management/presentation/view/taps/display_categories/view/widgets/show_bottom_sheet_add_category.dart';
import '../../../../../../../../core/utils/theme/constant_colors.dart';
import '../../../../../../../../core/utils/widgets/cases/custom_display_error.dart';
import '../../../../../../../../core/utils/widgets/cases/custom_display_items_is_empty.dart';
import '../../../../../../../../core/utils/widgets/loading/custom_hexagon_Dots_loading.dart';
import '../../../../../../../../material_application.dart';
import '../../manager/display_category_cubit/control_categories_cubit.dart';
import '../../manager/display_category_cubit/control_categories_state.dart';
import 'custom_floating_action_button.dart';
import 'list_of_category.dart';

class DisplayCategoriesBody extends StatefulWidget {
  const DisplayCategoriesBody({super.key, required this.uid});

  final String uid;

  @override
  State<DisplayCategoriesBody> createState() => _DisplayCategoriesBodyState();
}

class _DisplayCategoriesBodyState extends State<DisplayCategoriesBody> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<ControlCategoriesCubit>(context).listenIngCollectionCategories(widget.uid);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ControlCategoriesCubit, ControlCategoriesState>(
      builder: (context, state) {
        if (state is DisplayCategoriesLoading) {
          return const CustomHexagonDotsLoading(color: primaryColorApp, size: 60);
        } else if (state is DisplayCategoriesFailure) {
          return CustomDisplayError(errorMessage: state.errorMessage);
        } else if (state is DisplayCategoriesSuccess) {
          return Stack(
            children: [
              CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(AppLocalizations.of(context)!.today, style: textThemeApp.font18SecondPrimaryBold.copyWith(color: textThemeApp.primaryColor)),
                        Text(DateFormat.yMMMd().format(DateTime.now()), style: textThemeApp.font17PrimaryMedium),
                      ],
                    ),
                  ),
                  ListOfCategory(items: BlocProvider.of<ControlCategoriesCubit>(context).categories),
                ],
              ),
              CustomFloatingActionButton(onPressed: () {
                showBottomSheetForAddCategory();
              },
              )
            ],
          );
        } else if (state is DisplayCategoriesIsEmpty) {
          return Stack(
            children: [
              CustomDisplayItemsIsEmpty(title: state.title),
               CustomFloatingActionButton(
                onPressed: showBottomSheetForAddCategory,
              )
            ],
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
  void showBottomSheetForAddCategory(){
     showModalBottomSheet(context: context, builder: (context) => Padding(
       padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
       child: BlocProvider(
         create: (context) => ControlCategoriesCubit(tasksManagementRepo: getIt.get<TasksManagementRepo>()),
           child: ShowBottomSheetAddCategory(uid: widget.uid),),),isScrollControlled: true);
  }
}