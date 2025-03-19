import 'package:flutter/material.dart';
import 'package:task_management_app/core/utils/widgets/dialogs/show_message_with_snack_bar.dart';
import 'package:task_management_app/material_application.dart';
import '../../../core/utils/widgets/app_bar/custom_app_bar.dart';
import '../view_model/support_view_model.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'widget/item_contact.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class SupportView extends StatefulWidget {
  const SupportView({super.key});

  @override
  State<SupportView> createState() => _SupportViewState();
}

class _SupportViewState extends State<SupportView> implements SupportNavigator{
  late SupportViewModel supportViewModel;
  @override
  void initState() {
    supportViewModel = SupportViewModel();
    supportViewModel.navigator = this;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        CustomAppBar(title: AppLocalizations.of(context)!.contact_us),
        ItemContact(title: AppLocalizations.of(context)!.call, icon: Icons.call, onTap: ()async{
          await supportViewModel.callPhoneNumber();
        },),
       ItemContact(title: AppLocalizations.of(context)!.email, icon: Icons.mail, onTap: () async{
         await supportViewModel.mail();
       }),
        ItemContact(title: AppLocalizations.of(context)!.sms, icon: Icons.sms, onTap: () async{
          await supportViewModel.sms();
        }),
        ItemContact(title: AppLocalizations.of(context)!.whatsapp, icon: FontAwesomeIcons.whatsapp,onTap: ()async{
          await supportViewModel.sms();
        },),
        ItemContact(title: AppLocalizations.of(context)!.messenger, icon: FontAwesomeIcons.facebookMessenger,onTap: ()async{
          await supportViewModel.messenger();
        },),
      ],
    );
  }

  @override
  void showMessageSnackPar({required String message}) {
    showMessageWithSnackBar(background: textThemeApp.primaryColor, message: message, context: context);
  }
}
