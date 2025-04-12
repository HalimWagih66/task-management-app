import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_management_app/features/tasks_management/presentation/view/taps/display_categories/view/widgets/display_categories.dart';
import '../../../../../../../../core/utils/style/theme/constant_colors.dart';
import '../../../../../../../../core/utils/widgets/cases/custom_display_error.dart';
import '../../../../../../../../core/utils/widgets/loading/custom_hexagon_Dots_loading.dart';
import '../../manager/display_category_cubit/control_categories_cubit.dart';
import '../../manager/display_category_cubit/control_categories_state.dart';
import 'categories_is_empty.dart';

class DisplayCategoriesBody extends StatelessWidget {
  const DisplayCategoriesBody({super.key, required this.uid});

  final String uid;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ControlCategoriesCubit, ControlCategoriesState>(
      builder: (context, state) {
        if (state is CategoriesLoadingState) {
          return const CustomHexagonDotsLoading(color: primaryColorApp, size: 60);
        } else if (state is CategoriesFailureState) {
          return CustomDisplayError(errorMessage: state.errorMessage);
        } else if (state is CategoriesSuccessState) {
          return DisplayCategories(uid: uid);
        } else if (state is CategoriesIsEmptyState) {
          return CategoriesIsEmpty(message: state.title,uid: uid,);
        } else {
          return DisplayCategories(uid: uid);
        }
      },
    );
  }
}