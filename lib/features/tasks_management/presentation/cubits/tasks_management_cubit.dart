import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_management_app/core/utils/widgets/duration.dart';
import 'package:task_management_app/features/tasks_management/presentation/cubits/tasks_management_state.dart';

class TasksManagementCubit extends Cubit<TasksManagementState>{
  late PageController pageController;
  List<Widget> taps = [
    Container(color: Colors.white),
    Container(color: Colors.green),
  ];
  TasksManagementCubit():super(TaskManagementInitial()){
    pageController = PageController();
  }
  animateToPage({required int page}){
    pageController.animateToPage(page, duration: getDuration(), curve: Curves.easeInOut);
  }
}