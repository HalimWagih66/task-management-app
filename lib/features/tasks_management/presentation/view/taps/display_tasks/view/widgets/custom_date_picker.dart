import 'package:flutter/material.dart';
import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:date_picker_timeline/extra/style.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_management_app/core/utils/style/theme/constant_colors.dart';
import 'package:task_management_app/features/home_layout/presentation/manager/user_model_cubit/user_model_cubit.dart';
import 'package:task_management_app/features/tasks_management/presentation/cubits/cubits/tasks_management_layout_cubit.dart';
import 'package:task_management_app/features/tasks_management/presentation/view/taps/display_tasks/cubits/control_tasks_cubit/control_tasks_cubit.dart';

import '../../../../../../../../task_management_app.dart';

class CustomDatePicker extends StatelessWidget {
  const CustomDatePicker({super.key});

  @override
  Widget build(BuildContext context) {
    var controlTasksCubit = BlocProvider.of<ControlTasksCubit>(context);
    return DatePicker(
      DateTime.now().subtract(const Duration(days: 1)),
      initialSelectedDate: controlTasksCubit.dateTime,
      directionality: TextDirection.ltr,
      selectionColor: primaryColorApp,
      height: MediaQuery.of(context).size.height * .13,
      dateTextStyle: defaultDateTextStyle.copyWith(color: primaryColorApp),
      monthTextStyle: defaultMonthTextStyle.copyWith(color: primaryColorApp),
      dayTextStyle: defaultDayTextStyle.copyWith(color: primaryColorApp),
      selectedTextColor: textThemeApp.secondPrimaryColor,
      onDateChange: (date) async{
        BlocProvider.of<ControlTasksCubit>(context).dateTime = date;
        if(controlTasksCubit.status == -1){
          await BlocProvider.of<ControlTasksCubit>(context).fetchTasksByDate(uid: BlocProvider.of<UserModelCubit>(context).userModel!.id!, categoryId: BlocProvider.of<TasksManagementLayoutCubit>(context).categoryModel!.categoryId!);
        }else{
           await BlocProvider.of<ControlTasksCubit>(context).fetchTasksByState(status: controlTasksCubit.status,uid: BlocProvider.of<UserModelCubit>(context).userModel!.id!, categoryId: BlocProvider.of<TasksManagementLayoutCubit>(context).categoryModel!.categoryId!);
        }
      },
    );
  }
}
