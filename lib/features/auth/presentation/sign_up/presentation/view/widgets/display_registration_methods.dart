import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_management_app/core/utils/widgets/dialogs/show_message_awesome_dialog.dart';
import 'package:task_management_app/core/utils/widgets/dialogs/show_message_with_snack_bar.dart';
import 'package:task_management_app/core/utils/widgets/loading/custom_hexagon_Dots_loading.dart';
import 'package:task_management_app/features/auth/presentation/sign_up/presentation/manager/sign_up_bloc/sign_up_bloc.dart';
import 'package:task_management_app/features/auth/presentation/sign_up/presentation/view/widgets/display_sign_up_with_method.dart';
import '../../../../../../../core/utils/widgets/buttons/custom_elevated_button.dart';
import '../../../../../../../material_application.dart';

class DisplayRegistrationMethods extends StatelessWidget {
  const DisplayRegistrationMethods({
    super.key, required this.titleButtonGoogle, required this.titleButtonWithEmail,required this.onPressedSigInWithEmail, this.onPressedSigInWithGoogle});
  final String titleButtonGoogle;
  final String titleButtonWithEmail;
  final void Function()? onPressedSigInWithGoogle;
  final void Function()? onPressedSigInWithEmail;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        CustomElevatedButton(
            onPressed: onPressedSigInWithEmail,
            background:  Colors.yellow,
            child:  BlocConsumer<SignUpBloc,SignUpState>(
              listener: (BuildContext context, SignUpState state) {
                if(state is SignUpWithEmailAndPasswordFailure){
                  showMessageWithSnackBar(message: state.errorMessage, context: context,background: textThemeApp.primaryColor);
                }else if(state is SignUpWithEmailAndPasswordSuccess){
                  showMessageWithAwesomeDialog(message: "An email has been sent to your personal email. Go to your email immediately and activate your account.",title: "Success", dialogType: DialogType.success,context: context,okActionName: "Ok",btnOkOnPress: () {},);
                }
              },
              builder: (BuildContext context, SignUpState state) {
                  if(state is SignUpWithEmailAndPasswordLoading){
                    return CustomHexagonDotsLoading(color: textThemeApp.primaryColor);
                  }else{
                    return Text(titleButtonWithEmail,style: textThemeApp.font17PrimaryMedium);
                  }
                },
          ),
        ),
        const SizedBox(height: 15),
        CustomElevatedButton(
            onPressed: () {
              BlocProvider.of<SignUpBloc>(context).add(SignUpWithGoogle());
            }, background: const Color(0xfff0f5f2),
            child: BlocConsumer<SignUpBloc,SignUpState>(
              listener: (context, state) {
                if(state is SignUpWithGoogleFailure){
                  showMessageWithSnackBar(message: state.errorMessage, context: context,background: textThemeApp.primaryColor);
                }
                else if(state is SignUpWithGoogleSuccess){
                  showMessageWithSnackBar(message: "You have successfully registered using Google.", context: context,background: textThemeApp.primaryColor);
                }
              },
                builder: (context, state) {
                  if(state is SignUpWithGoogleLoading){
                    return CustomHexagonDotsLoading(color: textThemeApp.primaryColor);
                  }else{
                    return DisplayRegistrationBySocial(text: titleButtonGoogle, image: 'assets/images/auth/google-logo.png',colorText: textThemeApp.primaryColor,);
                  }
                },
            )
        ),
      ],
    );
  }
}


