import 'package:flutter/material.dart';
import 'package:task_management_app/core/utils/widgets/duration.dart';

class HomeLayoutViewModel{
  late PageController pageController;
  HomeLayoutViewModel(){
    pageController = PageController();
  }
  void animateToPage(int page){
    pageController.animateToPage(page, duration: getDuration(), curve: Curves.easeInOut);
  }
}