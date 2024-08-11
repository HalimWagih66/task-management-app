import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:task_management_app/core/utils/theme/constant_colors.dart';
import 'package:task_management_app/core/utils/widgets/loading/custom_hexagon_Dots_loading.dart';
import 'package:task_management_app/features/auth/presentation/log_in/manager/log_in_bloc.dart';
import 'package:task_management_app/features/auth/presentation/sign_up/presentation/view/widgets/custom_elevated_button_in_auth.dart';
import '../../../../../../core/utils/widgets/dialogs/show_message_with_snack_bar.dart';
import '../../../../../../provider/settings_provider.dart';
import '../../../sign_up/presentation/view/widgets/display_sign_up_with_method.dart';

class DisplayLoginMethods extends StatelessWidget {
  const DisplayLoginMethods({super.key, required this.onPressedLoginByEmail});
  final void Function() onPressedLoginByEmail;
  @override
  Widget build(BuildContext context) {
    var textStyleApp = Provider.of<SettingsProvider>(context).textThemeApp;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        CustomElevatedButtonInAuth(
          onLongPress: () async{
           await FirebaseAuth.instance.signOut();
           print("sign out");
          },
          background: Colors.yellow,
            onPressed: onPressedLoginByEmail,
            child: BlocConsumer<LogInBloc,LogInState>(
              listener: (context, state) {
                if(state is LogInByEmailAndPasswordFailure){
                   showMessageWithSnackBar(message: state.errorMessage, context: context, background: textStyleApp.primaryColor);
                }else if(state is LogInByEmailAndPasswordSuccess){
                  showMessageWithSnackBar(message: "You have successfully logged in, dear.", context: context, background: primaryColorApp);
                }
              },
              builder: (context, state) {
                if(state is LogInByEmailAndPasswordLoading){
                  return CustomHexagonDotsLoading(color: textStyleApp.primaryColor);
                }else{
                  return Text("Login with email",style: textStyleApp.font17PrimaryMedium);
                }
              },
            )
        ),
        const SizedBox(height: 15),
        CustomElevatedButtonInAuth(
          background: Colors.white,
          child: BlocConsumer<LogInBloc,LogInState>(
            listener: (context, state) {
              if(state is LogInByGoogleFailure){
                showMessageWithSnackBar(message: state.errorMessage, context: context, background: textStyleApp.primaryColor);
              }else if(state is LogInByGoogleSuccess){
                showMessageWithSnackBar(message: "You have successfully logged in, dear.", context: context, background: primaryColorApp);
              }
            } ,
            builder: (context, state) {
              if(state is LogInByGoogleLoading){
                return CustomHexagonDotsLoading(color: textStyleApp.primaryColor);
              }else{
                return DisplayRegistrationBySocial(text: "Login with google",image: "assets/images/auth/google-logo.png",colorText: textStyleApp.primaryColor);
              }
            } ,
          )
        ),
      ],
    );
  }
}
