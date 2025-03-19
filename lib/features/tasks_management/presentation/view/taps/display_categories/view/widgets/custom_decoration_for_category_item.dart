import 'package:flutter/material.dart';

import '../../../../../../../../core/utils/style/theme/constant_colors.dart';

BoxDecoration customDecorationForTasksManagement(){
  return const BoxDecoration(
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(16),
      bottomLeft: Radius.circular(16),
    ),
    color: primaryColorApp,
  );
}