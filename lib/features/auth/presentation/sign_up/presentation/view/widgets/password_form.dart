import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../../../core/utils/functions/validate/validate_inputs_from_text_valid.dart';
import '../../../../../../../core/utils/widgets/TextFormField/custom_form_field.dart';
import '../../manager/sign_up_bloc/sign_up_bloc.dart';


class PasswordForm extends StatefulWidget {
  const PasswordForm({super.key});

  @override
  State<PasswordForm> createState() => _PasswordFormState();
}

class _PasswordFormState extends State<PasswordForm> {
  String firstPassword = "";
  bool thePasswordIsHidden = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextFormField(
          hintText: "Password",
          textInputAction: TextInputAction.next,
          prefixIcon: Icons.lock,
          suffixIcon:thePasswordIsHidden?Icons.remove_red_eye_outlined:Icons.remove_red_eye,
          obscureText: thePasswordIsHidden?true:false,
          functionValidate: (input) {
            firstPassword = input!;
            BlocProvider.of<SignUpBloc>(context).password = input;
            return ValidateInputsFromTextValid.validatePasswordValid(input);
          },
          onPressedSuffixIcon:(){
            setState(() {
              thePasswordIsHidden = !thePasswordIsHidden;
            });
          },
        ),
        const SizedBox(height: 8),

        CustomTextFormField(
          hintText: "Confirm Password",
          textInputAction: TextInputAction.send,
          prefixIcon: Icons.lock,
          obscureText: thePasswordIsHidden?true:false,
          suffixIcon: thePasswordIsHidden?Icons.remove_red_eye_outlined:Icons.remove_red_eye,
          onPressedSuffixIcon:(){
            setState(() {
              thePasswordIsHidden = !thePasswordIsHidden;
            });
          },
          functionValidate: (secondPassword) {
            return ValidateInputsFromTextValid.validateConfirmPasswordValid(firstPassword: firstPassword,secondPassword: secondPassword??"_");
          },
        ),
      ],
    );
  }
}

