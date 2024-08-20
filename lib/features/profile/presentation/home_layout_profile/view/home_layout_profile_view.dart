import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_management_app/features/profile/presentation/home_layout_profile/cubits/home_layout_profile_cubit.dart';

class HomeLayoutProfileView extends StatelessWidget {
  const HomeLayoutProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeLayoutProfileCubit(),
      child: Builder(
        builder: (context) {
          return PageView.builder(
            controller: BlocProvider.of<HomeLayoutProfileCubit>(context).pageController,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) =>
                  BlocProvider.of<HomeLayoutProfileCubit>(context).taps[index],
              itemCount:
                  BlocProvider.of<HomeLayoutProfileCubit>(context).taps.length);
        },
      ),
    );
  }
}
