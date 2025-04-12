import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../../../../task_management_app.dart';
import '../../../../../cubits/profile_layout_cubit.dart';


class CustomViewField extends StatelessWidget {
  const CustomViewField({super.key, required this.text, required this.label});
  final String text;
  final String label;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 18.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label,overflow:TextOverflow.clip ,style: textThemeApp.font18SecondPrimaryBold.copyWith(color: textThemeApp.primaryColor),),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(text,style: textThemeApp.font15greyRegular,overflow: TextOverflow.clip,),
              IconButton(onPressed: (){
                BlocProvider.of<ProfileLayoutCubit>(context).animateToPage(1);
              }, icon: const Icon(Icons.edit,color: Colors.grey,)),
            ],
          ),
          const SizedBox(height: 7),
          const Divider(height: 1,color: Colors.grey,),
          const SizedBox(height: 25),
        ],
      ),
    );
  }
}
