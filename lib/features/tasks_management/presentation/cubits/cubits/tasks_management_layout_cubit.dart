import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_management_app/core/utils/widgets/animation/duration.dart';
import 'package:task_management_app/features/tasks_management/data/models/category_model.dart';
import 'package:task_management_app/features/tasks_management/presentation/cubits/cubits/tasks_management_layout_state.dart';
import 'package:task_management_app/features/tasks_management/presentation/view/taps/display_categories/view/display_categories_view.dart';
import 'package:task_management_app/features/tasks_management/presentation/view/taps/display_tasks/view/display_tasks_view.dart';


class TasksManagementLayoutCubit extends Cubit<TasksManagementState>{
  late PageController pageController;
  CategoryModel? categoryModel;
  List<Widget> taps = const [
     DisplayCategoriesView(),
     DisplayTasksView(),
  ];
  TasksManagementLayoutCubit():super(TaskManagementInitial()){
    pageController = PageController();
  }
  animateToPage({required int page}){
    pageController.animateToPage(page, duration: getDuration(), curve: Curves.easeInOut);
  }
}