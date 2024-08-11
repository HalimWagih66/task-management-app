import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_management_app/features/auth/presentation/log_in/manager/log_in_bloc.dart';
import '../../../../../../core/utils/functions/validate/validate_inputs_from_text_valid.dart';
import '../../../../../../core/utils/widgets/TextFormField/custom_form_field.dart';

class LogInFrom extends StatefulWidget {
  const LogInFrom({super.key});

  @override
  State<LogInFrom> createState() => _LogInFromState();
}

class _LogInFromState extends State<LogInFrom> {
  bool passwordIsHidden = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextFormField(
          functionValidate: (email) {
            BlocProvider.of<LogInBloc>(context).emailAddress = email;
            return ValidateInputsFromTextValid.validateEmailValid(email);
          },
          hintText: "Email Address",
          prefixIcon: Icons.email_outlined,
        ),
        CustomTextFormField(
          functionValidate: (password) {
            BlocProvider.of<LogInBloc>(context).password = password;
            return ValidateInputsFromTextValid.validatePasswordValid(password);
          },
          hintText: "Password",
          obscureText: passwordIsHidden,
          suffixIcon: passwordIsHidden?Icons.remove_red_eye_outlined:Icons.remove_red_eye_rounded,
          prefixIcon: Icons.lock,
          onPressedSuffixIcon:(){
            setState(() {
              passwordIsHidden = !passwordIsHidden;
            });
          },
        ),
      ],
    );
  }
}