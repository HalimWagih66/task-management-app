import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../manager/home_layout_cubit/home_layout_cubit.dart';
import '../../manager/user_model_cubit/user_model_cubit.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<UserModelCubit>(context).listenIngUserModel();
  }

  @override
  Widget build(BuildContext context) {
    var homeLayoutViewModel = BlocProvider.of<HomeLayoutCubit>(context);
    return Scaffold(
      body: PageView.builder(
        controller: homeLayoutViewModel.pageController,
        physics: const NeverScrollableScrollPhysics(),
        onPageChanged: (value) {
          print("{page = $value}");
        },
        itemCount: homeLayoutViewModel.taps.length,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) =>
            homeLayoutViewModel.taps[index],
      ),
    );
  }
}
