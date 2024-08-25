import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_management_app/core/utils/widgets/duration.dart';
import 'package:task_management_app/features/tasks_management/presentation/cubits/tasks_management_layout_state.dart';
import 'package:task_management_app/features/tasks_management/presentation/view/display_categories/view/display_categories_view.dart';


class TasksManagementLayoutCubit extends Cubit<TasksManagementState>{
  late PageController pageController;
  List<Widget> taps = [
    const DisplayCategoriesView(),
    Container(color: Colors.green),
  ];
  TasksManagementLayoutCubit():super(TaskManagementInitial()){
    pageController = PageController();
  }
  animateToPage({required int page}){
    pageController.animateToPage(page, duration: getDuration(), curve: Curves.easeInOut);
  }
}