import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_management_app/features/home_layout/presentation/view_model/home_layout_view_model.dart';
import 'package:task_management_app/material_application.dart';
class HomeView extends StatefulWidget {
   const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView>{
  List<Widget> homeFragments = [];
  @override
  void initState() {
    homeFragments = [
      Container(
        color: textThemeApp.primaryColor,
      ),
      Container(
        color: Colors.green,
      ),
      Container(
        color: Colors.grey,
      ),
      Container(
        color: Colors.blue,
      ),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var homeLayoutViewModel = Provider.of<HomeLayoutViewModel>(context);
    return Scaffold(
      body: PageView.builder(
        controller: homeLayoutViewModel.pageController,
        physics: NeverScrollableScrollPhysics(),
        onPageChanged: (value) {
          print("{page = $value}");
        },
        itemCount: homeFragments.length,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) => homeFragments[index],
      ),
    );
  }
}