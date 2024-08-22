import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_management_app/core/utils/widgets/dialogs/show_message_awesome_dialog.dart';
import 'package:task_management_app/features/profile/presentation/home_layout_profile/view/taps/edit_profile/manager/edit_profile_form/edit_profile_form_cubit.dart';
import '../../../../../../../../../core/models/user_model.dart';
import '../../../../../../../../../core/utils/functions/validate/validate_inputs_from_text_valid.dart';
import '../../../../../../../../../core/utils/widgets/TextFormField/custom_form_field.dart';

class FormEditProfile extends StatelessWidget {
  const FormEditProfile({
    super.key,
    required this.userModel,
  });

  final UserModel? userModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          CustomTextFormField(
            contentPadding: 10,
            textLabel: "Name",
            initialValue: userModel?.name,
            functionValidate: (name) {
               if(ValidateInputsFromTextValid.validateNameValid(name) == null){
                 if(name != userModel?.name){
                   BlocProvider.of<EditProfileFormCubit>(context).editFieldInUserInDatabase(newData: {"name":name}, uid: userModel!.id);
                 }
                 return null;
               }else{
                 return ValidateInputsFromTextValid.validateNameValid(name);
               }
            },
          ),
          const SizedBox(height: 25),
          CustomTextFormField(
            contentPadding: 10,
            textLabel: "Email",
            enabled: false,
            initialValue: userModel?.email,
            functionValidate: (email) {
              return ValidateInputsFromTextValid.validateEmailValid(email);
            },
          ),
          const SizedBox(height: 25),
          CustomTextFormField(
            contentPadding: 10,
            textLabel: "Password",
            initialValue: "******",
            obscureText: true,
            functionValidate: (password) {
              if(ValidateInputsFromTextValid.validatePasswordValid(password) == null){
                if(password != "******"){
                  showMessageWithAwesomeDialog(context: context, message: "Do you really want to change your password?", dialogType: DialogType.warning,title: "Warning",okActionName: "Yes",cancelActionName: "Cancel",btnCancelOnPress: (){},btnOkOnPress: ()async{
                    await BlocProvider.of<EditProfileFormCubit>(context).changePassword(newPassword: password!);
                  });
                }
                return null;
              }else{
                return ValidateInputsFromTextValid.validatePasswordValid(password);
              }
            },
          ),
        ],
      ),
    );
  }
}
