import 'package:flutter/material.dart';
import 'package:task_management_app/features/sign_up/presentation/view/widgets/password_form.dart';
import '../../../../../core/utils/functions/validate/validate_inputs_from_text_valid.dart';
import '../../../../../core/utils/widgets/TextFormField/custom_form_field.dart';

class FormSignUp extends StatelessWidget {
  const FormSignUp({super.key});

  @override
  Widget build(BuildContext context){
    return Column(
      children: [
        CustomTextFormField(
           hintText: "Enter Name",
            prefixIcon: Icons.person,
            functionValidate: (input) {
              return ValidateInputsFromTextValid.validateNameValid(input);
            },
        ),
        const SizedBox(height: 8),
        CustomTextFormField(
          hintText: "Enter Address",
          prefixIcon: Icons.email_outlined,
          functionValidate: (input) {
            return ValidateInputsFromTextValid.validateEmailValid(input);
          },
        ),
        const SizedBox(height: 8),
        const PasswordForm(),
      ],
    );
  }
}
