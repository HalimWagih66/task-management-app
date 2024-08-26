
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../../../core/utils/cubits/image_picker_cubit/image_picker_cubit.dart';
import '../../../../../../../../core/utils/theme/constant_colors.dart';
import '../../../../../../../../core/utils/widgets/buttons/custom_ink_will.dart';
import '../../../../../../../../core/utils/widgets/display_images/custom_picked_image_for_add_image.dart';
import '../../manager/display_category_cubit/control_categories_cubit.dart';
import 'custom_display_add_category.dart';
import 'form_bottom_sheet_add_category.dart';

class ShowBottomSheetAddCategoryBody extends StatefulWidget {
  const ShowBottomSheetAddCategoryBody({
    super.key, required this.uid,
  });
  final String uid;
  @override
  State<ShowBottomSheetAddCategoryBody> createState() => _ShowBottomSheetAddCategoryBodyState();
}

class _ShowBottomSheetAddCategoryBodyState extends State<ShowBottomSheetAddCategoryBody> {
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          CustomPickedImageForAddImage(caseImagePickerSuccess: (){
            BlocProvider.of<ControlCategoriesCubit>(context).pickImage = BlocProvider.of<ImagePickerCubit>(context).pickedImage;
          },
          ),
          const SizedBox(
            height: 5,
          ),
          const FormBottomSheetAddCategory(),
          const SizedBox(
            height: 30,
          ),
          CustomInkWill(
            background: primaryColorApp,
            onTap: () async {
              if(formKey.currentState!.validate() && BlocProvider.of<ImagePickerCubit>(context).checkPickImageNullOrNotWithoutEmitSuccess()){
                await BlocProvider.of<ControlCategoriesCubit>(context).addCategory(uid:widget.uid);
              }
            },
            child:  SizedBox(width: MediaQuery.sizeOf(context).width,child:  const CustomDisplayAddCategory()),
          ),
        ],
      ),
    );
  }
}

