import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_management_app/core/utils/constant/url_temporary.dart';
import 'package:task_management_app/features/tasks_management/data/models/category_model.dart';
import '../../../../../../../../core/utils/style/custom_decoration_for_tasks_management.dart';
import '../../../../../../../../core/utils/widgets/display_images/custom_cached_network_image.dart';
import '../../../../../../../../core/utils/widgets/display_images/custom_circle_image.dart';
import 'display_category_name_and_number_of_tasks.dart';
import 'display_percentage.dart';

class CategoryItemBody extends StatelessWidget {
  const CategoryItemBody({super.key, required this.categoryModel});
  final CategoryModel categoryModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: customDecorationForTasksManagement(),
      child: Row(
        children: [
          CustomCircleImage(

            firstRadios: 0,
            secondRadios: 22,
            child: CustomCachedNetworkImage(
                urlImage: categoryModel.categoryImage??TemporaryUrls.displayImageCaseBaseImageIsNull, height: 70.h
            ),
          ),
          Expanded(
            child: Row(
              children: [
                DisplayCategoryNameAndNumberOfTasks(categoryName: categoryModel.categoryName??"",numberOfTasks: categoryModel.allTasksToday??0),
                DisplayPercentage(
                  categoryModel: categoryModel,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
