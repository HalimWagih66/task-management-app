import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utils/widgets/duration.dart';
import '../view/taps/display_profile/view/display_profile_view.dart';
import '../view/taps/edit_profile/view/edit_profile_view.dart';
import 'home_layout_profile_state.dart';

class HomeLayoutProfileCubit extends Cubit<HomeLayoutProfileState>{
  HomeLayoutProfileCubit():super(HomeLayoutProfileInitial()){
    pageController = PageController();
  }
  List<Widget>taps = [
    const DisplayProfileView(),
    const EditProfileView()
  ];
  late PageController pageController;
  void animateToPage(int page){
    pageController.animateToPage(page, duration: getDuration(), curve: Curves.easeInOut);
  }

}