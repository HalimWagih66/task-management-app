import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_management_app/core/utils/widgets/dialogs/show_message_with_snack_bar.dart';
import 'package:task_management_app/features/tasks_management/presentation/view/taps/display_categories/manager/display_category_cubit/control_categories_state.dart';
import 'package:task_management_app/features/tasks_management/presentation/view/taps/display_categories/view/widgets/category_item_body.dart';
import 'package:task_management_app/material_application.dart';
import '../../../../../../data/models/category_model.dart';
import '../../manager/display_category_cubit/control_categories_cubit.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key, required this.categoryModel});

  final CategoryModel categoryModel;

  @override
  Widget build(BuildContext context) {
    return BlocListener<ControlCategoriesCubit,ControlCategoriesState>(
      listener: (context, state) {
        if(state is DeleteCategoryFailure){
          showMessageWithSnackBar(background: textThemeApp.primaryColor, message: state.errorMessage, context: context);
        }
      },
      child: CategoryItemBody(categoryModel: categoryModel,numberOfTasks: 3),
    );
  }
}
