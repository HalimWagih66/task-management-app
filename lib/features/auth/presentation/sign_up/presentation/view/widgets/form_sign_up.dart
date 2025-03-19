import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_management_app/features/auth/presentation/sign_up/presentation/manager/sign_up_bloc/sign_up_bloc.dart';
import 'package:task_management_app/features/auth/presentation/sign_up/presentation/view/widgets/password_form.dart';
import '../../../../../../../core/utils/functions/validate/validate_inputs_from_text_valid.dart';
import '../../../../../../../core/utils/widgets/TextFormField/custom_form_field.dart';

class FormSignUp extends StatelessWidget {
  const FormSignUp({super.key});

  @override
  Widget build(BuildContext context){
    BlocProvider.of<SignUpBloc>(context);
    return Column(
      children: [
        CustomTextFormField(
           hintText: "Enter Name",
            prefixIcon: Icons.person,
            textInputType: TextInputType.name,
            textInputAction: TextInputAction.next,
            functionValidate: (name) {
              BlocProvider.of<SignUpBloc>(context).userModel.name = name;
              return ValidateInputsFromTextValid.validateNameValid(input: name,outPut: "your first name");
            },
        ),
        const SizedBox(height: 8),
        CustomTextFormField(
          hintText: "Enter Address",
          prefixIcon: Icons.email_outlined,
          textInputType: TextInputType.emailAddress,
          textInputAction: TextInputAction.next,
          functionValidate: (email) {
            BlocProvider.of<SignUpBloc>(context).userModel.email = email;
            return ValidateInputsFromTextValid.validateEmailValid(email);
          },
        ),
        const SizedBox(height: 8),
        const PasswordForm(),
      ],
    );
  }
}
