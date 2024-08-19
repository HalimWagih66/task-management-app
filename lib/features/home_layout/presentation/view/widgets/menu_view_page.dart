import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:task_management_app/features/home_layout/presentation/view_model/home_layout_view_model.dart';
import '../../../../../core/utils/widgets/dialogs/custom_rating.dart';
import '../../../../../material_application.dart';
import 'item_drawer.dart';
class MenuViewPage extends StatefulWidget {
  const MenuViewPage({super.key});

  @override
  State<MenuViewPage> createState() => _MenuViewPageState();
}

class _MenuViewPageState extends State<MenuViewPage>{
  @override
  Widget build(BuildContext context) {
    var homeLayoutViewModel = Provider.of<HomeLayoutViewModel>(context);
    return Scaffold(
      backgroundColor: const Color(0xff617afd),
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
            ItemDrawer(iconData: Icons.exit_to_app,text: AppLocalizations.of(context)!.sign_out,onTap: () async {
              homeLayoutViewModel.animateToPage(4);
            }),
          ],
        ),
      ),
    );
  }


}