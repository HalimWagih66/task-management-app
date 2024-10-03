import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:task_management_app/core/services/service_locator.dart';
import 'package:task_management_app/core/utils/widgets/dialogs/show_message_with_snack_bar.dart';
import 'package:task_management_app/features/auth/presentation/log_in/view/login_view.dart';
import 'package:task_management_app/features/home_layout/data/home_layout_repo.dart';
import '../../../../../core/utils/style/theme/constant_colors.dart';
import '../../../../../core/utils/widgets/dialogs/custom_rating.dart';
import '../../../../../material_application.dart';
import '../../manager/home_layout_cubit/home_layout_cubit.dart';
import '../../manager/sign_out_cubit/sign_out_cubit.dart';
import '../../manager/sign_out_cubit/sign_out_state.dart';
import 'item_drawer.dart';
class MenuViewPage extends StatefulWidget {
  const MenuViewPage({super.key});

  @override
  State<MenuViewPage> createState() => _MenuViewPageState();
}

class _MenuViewPageState extends State<MenuViewPage>{
  @override
  Widget build(BuildContext context) {
    var homeLayoutViewModel = Provider.of<HomeLayoutCubit>(context);
    return Scaffold(
      backgroundColor: primaryColorApp,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset("assets/images/logo_app.png",height: 260,color: textThemeApp.secondPrimaryColor),
            const SizedBox(height: 35),
            ItemDrawer(iconData: Icons.person,text: AppLocalizations.of(context)!.profile,onTap: ()async{
              homeLayoutViewModel.animateToPage(0);
              ZoomDrawer.of(context)?.close();
            }),
             ItemDrawer(iconData: Icons.task_alt, text: AppLocalizations.of(context)!.all_categories,onTap:()async{
               homeLayoutViewModel.animateToPage(1);
               ZoomDrawer.of(context)?.close();
             }),
             ItemDrawer(iconData: Icons.settings,text: AppLocalizations.of(context)!.settings,onTap: ()async{
               homeLayoutViewModel.animateToPage(2);

               ZoomDrawer.of(context)?.close();
             },),
            ItemDrawer(iconData: Icons.contact_support,text: AppLocalizations.of(context)!.support,onTap: () async {
              homeLayoutViewModel.animateToPage(3);
              ZoomDrawer.of(context)?.close();
            }),
            ItemDrawer(iconData: Icons.star_border,text: AppLocalizations.of(context)!.rate_us,onTap: (){
               showDialog(
                 context: context,
                 barrierDismissible: true, // set to false if you want to force a rating
                 builder: (context) => const CustomRating()
               );
            }),
            const Spacer(),
            BlocProvider(
              create: (BuildContext context) => SignOutCubit(homeLayoutRepo: getIt.get<HomeLayoutRepo>()),
              child: Builder(
                builder: (context) {
                  return BlocListener<SignOutCubit,SignOutState>(
                    listener: (context, state) {
                      if(state is SignOutSuccess){
                        GoRouter.of(context).replace(LoginView.routeName);
                        showMessageWithSnackBar(background: textThemeApp.primaryColor, message: "You are logged out dear", context: context);
                      }else if(state is SignOutFailure){
                        showMessageWithSnackBar(background: textThemeApp.primaryColor, message: state.errorMessage, context: context);
                      }
                    },
                    child: ItemDrawer(iconData: Icons.exit_to_app,text: AppLocalizations.of(context)!.sign_out,onTap: () async {
                      await BlocProvider.of<SignOutCubit>(context,listen: false).signOut();
                    }),
                  );
                }
              ),
            ),
          ],
        ),
      ),
    );
  }


}