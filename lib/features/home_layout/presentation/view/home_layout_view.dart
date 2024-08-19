import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:provider/provider.dart';
import 'package:task_management_app/core/utils/theme/constant_colors.dart';
import 'package:task_management_app/features/home_layout/presentation/view/widgets/home_view.dart';
import 'package:task_management_app/features/home_layout/presentation/view/widgets/menu_view_page.dart';
import 'package:task_management_app/features/home_layout/presentation/view_model/home_layout_view_model.dart';

class HomeLayoutView extends StatelessWidget {
  const HomeLayoutView({super.key});
  static const routeName = "/HomeLayoutView";
  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) => HomeLayoutViewModel(),
      child: const ZoomDrawer(
        angle: 0,
        mainScreenScale: 0.1,
        borderRadius: 40,
        menuBackgroundColor: primaryColorApp,
        menuScreen: MenuViewPage(),
        mainScreen: HomeView(),
      ),
    );
  }
}
