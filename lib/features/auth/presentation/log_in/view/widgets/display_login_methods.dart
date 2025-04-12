import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:task_management_app/core/utils/style/theme/constant_colors.dart';
import 'package:task_management_app/core/utils/widgets/loading/custom_hexagon_Dots_loading.dart';
import 'package:task_management_app/features/auth/presentation/log_in/manager/log_in_bloc/log_in_bloc.dart';
import 'package:task_management_app/core/utils/widgets/buttons/custom_elevated_button.dart';
import 'package:task_management_app/features/home_layout/presentation/view/home_layout_view.dart';
import '../../../../../../core/utils/widgets/dialogs/show_message_with_snack_bar.dart';
import '../../../../../../task_management_app.dart';
import '../../../sign_up/presentation/view/widgets/display_sign_up_with_method.dart';

class DisplayLoginMethods extends StatelessWidget {
  const DisplayLoginMethods({super.key, required this.onPressedLoginByEmail});
  final void Function() onPressedLoginByEmail;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        CustomElevatedButton(
          background: Colors.yellow,
            onPressed: onPressedLoginByEmail,
            child: BlocConsumer<LogInBloc,LogInState>(
              listener: (context, state) {
                if(state is LogInByEmailAndPasswordFailure){
                   showMessageWithSnackBar(message: state.errorMessage, context: context, background: textThemeApp.primaryColor);
                }else if(state is LogInByEmailAndPasswordSuccess){
                  GoRouter.of(context).replace(HomeLayoutView.routeName);
                  showMessageWithSnackBar(message: "You have successfully logged in, dear.", context: context, background: primaryColorApp);
                }
              },
              builder: (context, state) {
                if(state is LogInByEmailAndPasswordLoading){
                  return CustomHexagonDotsLoading(color: textThemeApp.primaryColor);
                }else{
                  return Text("Login with email",style: textThemeApp.font17PrimaryMedium);
                }
              },
            )
        ),
        const SizedBox(height: 15),
        CustomElevatedButton(
          background: const Color(0xfff0f5f2),
          onPressed: () {
            BlocProvider.of<LogInBloc>(context).add(LogInByGoogle());
          },
          child: BlocConsumer<LogInBloc,LogInState>(
            listener: (context, state) {
              if(state is LogInByGoogleFailure){
                showMessageWithSnackBar(message: state.errorMessage, context: context, background: textThemeApp.primaryColor);
              }else if(state is LogInByGoogleSuccess){
                GoRouter.of(context).replace(HomeLayoutView.routeName);
                showMessageWithSnackBar(message: "You have successfully logged in, dear.", context: context, background: primaryColorApp);
              }
            } ,
            builder: (context, state) {
              if(state is LogInByGoogleLoading){
                return CustomHexagonDotsLoading(color: textThemeApp.primaryColor);
              }else{
                return DisplayRegistrationBySocial(text: "Login with google",image: "assets/images/auth/google-logo.png",colorText: textThemeApp.primaryColor);
              }
            } ,
          )
        ),
      ],
    );
  }
}
