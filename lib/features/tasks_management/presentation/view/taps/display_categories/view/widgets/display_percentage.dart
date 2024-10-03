import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:task_management_app/core/utils/widgets/loading/custom_hexagon_Dots_loading.dart';
import 'package:task_management_app/material_application.dart';

import '../../../../../../../home_layout/presentation/manager/user_model_cubit/user_model_cubit.dart';
import '../../../display_tasks/cubits/control_tasks_cubit/control_tasks_cubit.dart';

class DisplayPercentage extends StatefulWidget {
  const DisplayPercentage({super.key, required this.categoryId, required this.numberOfTasks});
  final String categoryId;
  final int numberOfTasks;

  @override
  State<DisplayPercentage> createState() => _DisplayPercentageState();
}

class _DisplayPercentageState extends State<DisplayPercentage> {
  @override
  void initState() {
    BlocProvider.of<ControlTasksCubit>(context).listenToTasksFromTheDatabaseUsingFilter(status: 2,categoryId: widget.categoryId, uid: BlocProvider.of<UserModelCubit>(context).userModel!.id!, dateTime: DateUtils.dateOnly(DateTime.now()));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ControlTasksCubit, ControlTasksState>(
  builder: (context, state) {
    if(state is FetchTasksLoading){
      return CustomHexagonDotsLoading(color: textThemeApp.secondPrimaryColor);
    }else if(state is FetchTasksSuccess){
      return CircularPercentIndicator(
        radius: 28,
        progressColor: Colors.blue,
        backgroundColor: const Color(0x5a617afd),
        center: Text("${(displayPercent(context,numberTasks: widget.numberOfTasks,completedTasks: state.tasks.length)*100).toInt()}%",style: textThemeApp.font15greyRegular.copyWith(color: textThemeApp.secondPrimaryColor),),
        curve: Curves.easeIn,
        percent: displayPercent(context,completedTasks: state.tasks.length,numberTasks: widget.numberOfTasks),
      );
    }else{
      return const SizedBox();
    }
  },
);
  }

  double displayPercent(BuildContext context,{required int numberTasks , required int completedTasks}){

    if(numberTasks == 0){
      return 0;
    }
    return completedTasks/numberTasks*100.floor();
  }
}
