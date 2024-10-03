import 'package:flutter/material.dart';
import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:date_picker_timeline/extra/style.dart';
import 'package:task_management_app/core/utils/style/theme/constant_colors.dart';
class CustomDatePicker extends StatelessWidget {
  const CustomDatePicker({super.key});

  @override
  Widget build(BuildContext context) {
    return DatePicker(
      DateTime.now().subtract(const Duration(days: 1)),
      initialSelectedDate: DateTime.now(),
      directionality: TextDirection.ltr,
      //locale: Provider.of<SettingsProvider>(context,listen: false).selectedLanguage?? Localizations.localeOf(context).languageCode,
      selectionColor: primaryColorApp,
      height: MediaQuery.of(context).size.height * .13,
      dateTextStyle: defaultDateTextStyle.copyWith(color: primaryColorApp),
      monthTextStyle: defaultMonthTextStyle.copyWith(color: primaryColorApp),
      dayTextStyle: defaultDayTextStyle.copyWith(color: primaryColorApp),
      selectedTextColor: Colors.white,
      onDateChange: (date) {
        //Provider.of<TasksViewModel>(context,listen: false).dateTime = DateUtils.dateOnly(date);

      },
    );
  }
}
