import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_management_app/features/profile/presentation/home_layout_profile/view/taps/display_profile/view/display_profile_view.dart';
import 'package:task_management_app/features/profile/presentation/home_layout_profile/cubits/home_layout_profile_state.dart';
import '../../../../../core/utils/widgets/duration.dart';

class HomeLayoutProfileCubit extends Cubit<HomeLayoutProfileState>{
  HomeLayoutProfileCubit():super(HomeLayoutProfileInitial()){
    pageController = PageController();
  }
  List<Widget>taps = [
    const DisplayProfileView(),
    Container(
      color: Colors.red,
    )
  ];
  late PageController pageController;
  void animateToPage(int page){
    pageController.animateToPage(page, duration: getDuration(), curve: Curves.easeInOut);
  }
}