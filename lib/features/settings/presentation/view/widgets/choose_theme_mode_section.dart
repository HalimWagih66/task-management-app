import 'package:flutter/material.dart';
import '../../../../../core/utils/widgets/toggle/custom_flutter_switch.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../../task_management_app.dart';

class ChooseThemeModeSection extends StatelessWidget {
  const ChooseThemeModeSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(AppLocalizations.of(context)!.dark_mode,style: textThemeApp.font17PrimaryMedium,),
        CustomFlutterSwitch()
      ],
    );
  }
}