import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:task_management_app/core/utils/style/theme/constant_colors.dart';
import 'package:task_management_app/core/utils/widgets/loading/custom_hexagon_Dots_loading.dart';
import 'package:task_management_app/features/home_layout/presentation/view/widgets/home_view.dart';
import 'package:task_management_app/features/home_layout/presentation/view/widgets/menu_view_page.dart';

import '../../../../task_management_app.dart';
import '../manager/user_model_cubit/user_model_cubit.dart';
import '../manager/user_model_cubit/user_model_state.dart';

class HomeLayoutView extends StatefulWidget {
  const HomeLayoutView({super.key});

  static const routeName = "/HomeLayoutView";

  @override
  State<HomeLayoutView> createState() => _HomeLayoutViewState();
}

class _HomeLayoutViewState extends State<HomeLayoutView> {
  @override
  void initState() {
    super.initState();
    String uid = FirebaseAuth.instance.currentUser!.email!;
    fetchUserModel(uid);
  }

  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(
      angle: 0,
      mainScreenScale: 0.1,
      borderRadius: 40,
      menuBackgroundColor: primaryColorApp,
      menuScreen: const MenuViewPage(),
      mainScreen: BlocBuilder<UserModelCubit, UserModelState>(
        builder: (context, state) {
          if(state is UserModelLoading){
            return Container(color: textThemeApp.secondPrimaryColor,child: const CustomHexagonDotsLoading(color: primaryColorApp,size: 50),);
          }else if(state is UserModelFailure){
            return Container(color: textThemeApp.secondPrimaryColor,child: Center(child: Text(state.errorMessage),));
          }else if(state is UserModelSuccess){
            return const HomeView();
          }return const SizedBox();
        },
      ),
    );
  }
  Future<void> fetchUserModel(String uid)async {
    await BlocProvider.of<UserModelCubit>(context).fetchUserModel(uid);
  }
}
