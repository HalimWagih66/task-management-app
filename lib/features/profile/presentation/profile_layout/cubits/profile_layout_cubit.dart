import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_management_app/features/profile/presentation/profile_layout/cubits/profile_layout_state.dart';
import '../../../../../core/utils/widgets/animation/duration.dart';
import '../view/taps/display_profile/view/display_profile_view.dart';
import '../view/taps/edit_profile/view/edit_profile_view.dart';

class ProfileLayoutCubit extends Cubit<ProfileLayoutState>{
  ProfileLayoutCubit():super(ProfileLayoutInitial()){
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