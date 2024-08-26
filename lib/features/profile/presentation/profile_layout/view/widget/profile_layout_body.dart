import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../cubits/profile_layout_cubit.dart';

class ProfileLayoutBody extends StatelessWidget {
  const ProfileLayoutBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
        controller: BlocProvider.of<ProfileLayoutCubit>(context).pageController,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) => BlocProvider.of<ProfileLayoutCubit>(context).taps[index],
        itemCount: BlocProvider.of<ProfileLayoutCubit>(context).taps.length
    );
  }
}