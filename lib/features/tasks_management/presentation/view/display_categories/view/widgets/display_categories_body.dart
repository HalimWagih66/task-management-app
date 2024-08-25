import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_management_app/core/services/service_locator.dart';
import 'package:task_management_app/features/tasks_management/data/repos/tasks_management_repo.dart';
import 'package:task_management_app/features/tasks_management/presentation/view/display_categories/view/widgets/list_of_category.dart';
import 'package:task_management_app/features/tasks_management/presentation/view/display_categories/view/widgets/show_bottom_sheet_add_category.dart';
import '../../../../../../../core/utils/theme/constant_colors.dart';
import '../../../../../../../core/utils/widgets/custom_display_error.dart';
import '../../../../../../../core/utils/widgets/custom_display_items_is_empty.dart';
import '../../../../../../../core/utils/widgets/loading/custom_hexagon_Dots_loading.dart';
import '../../manager/display_categories_cubit.dart';
import 'custom_floating_action_button.dart';

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
    BlocProvider.of<DisplayCategoriesCubit>(context).listenIngCollectionCategories(widget.uid);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DisplayCategoriesCubit, DisplayCategoriesState>(
      builder: (context, state) {
        if (state is DisplayCategoriesLoading) {
          return const Expanded(
            child: CustomHexagonDotsLoading(color: primaryColorApp, size: 60),
          );
        } else if (state is DisplayCategoriesFailure) {
          return Expanded(
            child: CustomDisplayError(errorMessage: state.errorMessage),
          );
        } else if (state is DisplayCategoriesSuccess) {
          return Expanded(
            child: Stack(
            children: [
              ListOfCategory(items: BlocProvider.of<DisplayCategoriesCubit>(context).categories),
               CustomFloatingActionButton(
                onPressed: showBottomSheetForAddCategory,
              )
            ],
          ),
          );
        } else if (state is DisplayCategoriesIsEmpty) {
          return Expanded(
            child: Stack(
              children: [
                CustomDisplayItemsIsEmpty(title: state.title),
                 CustomFloatingActionButton(
                  onPressed: showBottomSheetForAddCategory,
                )
              ],
            ),
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
         create: (context) => DisplayCategoriesCubit(tasksManagementRepo: getIt.get<TasksManagementRepo>()),
           child: ShowBottomSheetAddCategory(uid: widget.uid)),
     ),isScrollControlled: true
     );
  }
}