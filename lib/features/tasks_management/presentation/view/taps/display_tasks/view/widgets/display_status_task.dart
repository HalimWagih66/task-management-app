import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../../core/utils/style/theme/constant_colors.dart';
import '../../cubits/control_tasks_cubit/control_tasks_cubit.dart';

class DisplayStatusTask extends StatelessWidget {
  const DisplayStatusTask({
    super.key,
    required this.status,
  });
  final int status;

  @override
  Widget build(BuildContext context) {
    var controlTasksCubit = BlocProvider.of<ControlTasksCubit>(context);
    return Container(
        decoration: BoxDecoration(
            color: primaryColorApp.withOpacity(0.3),
            borderRadius: BorderRadius.circular(10)
        ),
        padding: const EdgeInsets.all(5),
        child: Text(controlTasksCubit.statusTask[status])
    );
  }
}