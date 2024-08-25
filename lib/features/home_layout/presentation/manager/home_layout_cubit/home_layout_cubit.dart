import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_management_app/features/tasks_management/presentation/view/tasks_management_layout_view.dart';
import '../../../../../core/utils/widgets/duration.dart';
import '../../../../profile/presentation/home_layout_profile/view/home_layout_profile_view.dart';
import '../../../../support/view/support_view.dart';
import 'home_layout_state.dart';

class HomeLayoutCubit extends Cubit<HomeLayoutState>{
  late PageController pageController;
  List<Widget> taps = [
    const HomeLayoutProfileView(),
    const TasksManagementLayoutView(),
    Container(
      color: Colors.grey,
    ),
    const SupportView()
  ];
  HomeLayoutCubit():super(HomeLayoutInitial()){
    pageController = PageController();
  }

  void animateToPage(int page){
    pageController.animateToPage(page, duration: getDuration(), curve: Curves.easeInOut);
  }


}