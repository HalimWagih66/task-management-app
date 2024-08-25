import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import '../../../../../../../core/utils/widgets/display_images/custom_circle_image.dart';
import '../../../../../../../core/utils/widgets/display_images/custom_circle_image_for_file_image.dart';
import '../../manager/display_categories_cubit.dart';

class DisplayImageInBottomSheetAddCategory extends StatelessWidget {
  const DisplayImageInBottomSheetAddCategory({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomCircleImage(
          firstRadios: 70.w,
          secondRadios: 67.w,
          child: BlocConsumer<DisplayCategoriesCubit, DisplayCategoriesState>(
            listener: (context, state) {
              if (state is CategoryImageSuccess){
                GoRouter.of(context).pop();
              }
            },
            builder: (context, state) {
              if (state is CategoryImageSuccess) {
                return CustomCircleImageForFileImage(
                  imageProvider: FileImage(state.file),
                );
              }
              return const CustomCircleImageForFileImage(
                imageProvider: null,
              );
            },
          ),
        ),
        const SizedBox(height: 10),
        BlocBuilder<DisplayCategoriesCubit,DisplayCategoriesState>(builder: (context, state) {
          if(state is CategoryImageIsNotValid){
            return Text(
              AppLocalizations.of(context)!.please_enter_category_image,
              style: const TextStyle(color: Colors.red, fontSize: 13),
            );
          }
          return const SizedBox();
        },),
      ],
    );
  }
}
