import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:task_management_app/core/utils/style/theme/constant_colors.dart';
import 'package:task_management_app/features/settings/presentation/manager/switch_toggle_cubit.dart';
import '../../../../../core/utils/widgets/app_bar/custom_app_bar.dart';
import '../../../../../provider/settings/settings_provider.dart';
import '../../../../../task_management_app.dart';
import '../../../../home_layout/presentation/view/home_layout_view.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'choose_theme_mode_section.dart';

class SettingsViewBody extends StatefulWidget {
  const SettingsViewBody({super.key});

  @override
  State<SettingsViewBody> createState() => _SettingsViewBodyState();
}

class _SettingsViewBodyState extends State<SettingsViewBody> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<SwitchToggleCubit>(context).isDark = BlocProvider.of<SettingsProvider>(context).isDarkEnabled();
  }

  List<String> dropDownItems = [
    'English',
    'العربيه',
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SwitchToggleCubit, SwitchToggleState>(
      builder: (context, state) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          color: textThemeApp.secondPrimaryColor,
          child: Column(
            children: [
              CustomAppBar(
                title: AppLocalizations.of(context)!.settings,
                leadingIconData: Icons.arrow_back_ios,
                onPressed: () {
                  GoRouter.of(context)
                      .pushReplacementNamed(HomeLayoutView.routeName);
                },
              ),
              const SizedBox(height: 30),
               ChooseThemeModeSection(),
              const SizedBox(height: 40),
              Row(
                children: [
                  Expanded(child: Text(AppLocalizations.of(context)!.language,style: textThemeApp.font17PrimaryMedium,)),
                  Expanded(
                    child: DropdownButtonFormField2<String>(
                      isExpanded: true,
                      dropdownStyleData: const DropdownStyleData(decoration: BoxDecoration(color: primaryColorApp)),
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(vertical: 16),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        // Add more decoration..
                      ),
                      items: dropDownItems.map((item) => DropdownMenuItem<String>(enabled: true,value: item, child: Text(item,style:textThemeApp.font17PrimaryMedium,),)).toList(),
                      onChanged: (value) async {
                        if(value == "English"){
                          await BlocProvider.of<SettingsProvider>(context).changeLanguageApp("en");
                        }else{
                         await BlocProvider.of<SettingsProvider>(context).changeLanguageApp("ar");
                        }

                        print("DropdownMenuItem $value}");
                      },
                      hint: Text(BlocProvider.of<SettingsProvider>(context).languageCode=="ar"?"العربيه":"English",style: textThemeApp.font15greyRegular,),
                    ),
                  ),
                ],
              )
              //ChooseLanguageSection()
            ],
          ),
        );
      },
    );
  }
}