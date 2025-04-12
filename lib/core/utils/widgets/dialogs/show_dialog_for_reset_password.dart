import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:task_management_app/core/services/service_locator.dart';
import 'package:task_management_app/core/utils/widgets/TextFormField/custom_form_field.dart';
import 'package:task_management_app/core/utils/widgets/buttons/custom_ink_will.dart';
import 'package:task_management_app/core/utils/widgets/dialogs/show_message_with_snack_bar.dart';
import 'package:task_management_app/core/utils/widgets/loading/custom_hexagon_Dots_loading.dart';
import 'package:task_management_app/features/auth/data/repos/auth_repo.dart';
import '../../../../features/auth/presentation/log_in/manager/reset_password_bloc/reset_password_bloc.dart';
import '../../../../task_management_app.dart';
import '../../functions/validate/validate_inputs_from_text_valid.dart';

Future<void> showDialogForResetPassword(BuildContext context) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return BlocProvider(
        create: (context) => ResetPasswordBloc(authRepo: getIt.get<AuthRepo>()),
        child: const FittedBox(child: CustomAlertDialogFoResetPassword()),
      );
    },
  );
}

class CustomAlertDialogFoResetPassword extends StatefulWidget {
  const CustomAlertDialogFoResetPassword({super.key});

  @override
  State<CustomAlertDialogFoResetPassword> createState() =>
      _CustomAlertDialogFoResetPasswordState();
}

class _CustomAlertDialogFoResetPasswordState
    extends State<CustomAlertDialogFoResetPassword> {
  String email = "";

  @override
  Widget build(BuildContext context) {
    var formKey = GlobalKey<FormState>();
    return AlertDialog(
      elevation: 0,
      backgroundColor: textThemeApp.secondPrimaryColor,
      title: Text(
        "Reset Password",
        style: textThemeApp.font18SecondPrimaryBold
            .copyWith(color: textThemeApp.primaryColor),
        textAlign: TextAlign.start,
      ),
      content: Form(
        key: formKey,
        child: CustomTextFormField(
          functionValidate: (input) {
            email = input!;
            return ValidateInputsFromTextValid.validateEmailValid(email);
          },
          hintText: "Email Address",
          prefixIcon: Icons.email_outlined,
        ),
      ),
      actions: [
        CustomInkWill(
          background: Colors.red,
          child: Text(
            "Cancel",
            style: textThemeApp.font15greyRegular
                .copyWith(color: textThemeApp.secondPrimaryColor),
          ),
        ),
        CustomInkWill(
          background: Colors.green,
          onTap: () {
            if (formKey.currentState!.validate()) {
              BlocProvider.of<ResetPasswordBloc>(context)
                  .add(ResetPassword(email));
            }
          },
          child: BlocConsumer<ResetPasswordBloc, ResetPasswordState>(
            listener: (context, state) {
              if (state is ResetPasswordFailure) {
                GoRouter.of(context).pop();
                showMessageWithSnackBar(
                    background: textThemeApp.primaryColor,
                    message: state.errorMessage,
                    context: context);
              } else if (state is ResetPasswordSuccess) {
                GoRouter.of(context).pop();
                showMessageWithSnackBar(
                    background: textThemeApp.primaryColor,
                    message:
                        "An email has been sent to your email to change your password.",
                    context: context);
              }
            },
            builder: (context, state) {
              if (state is ResetPasswordLoading) {
                return FittedBox(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 4),
                    child: CustomHexagonDotsLoading(
                        color: textThemeApp.secondPrimaryColor),
                  ),
                );
              }
              return Text(
                "Send",
                style: textThemeApp.font15greyRegular
                    .copyWith(color: textThemeApp.secondPrimaryColor),
              );
            },
          ),
        ),
      ],
    );
  }
}
