import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_management_app/features/auth/data/repos/auth_repo.dart';
import 'package:task_management_app/features/auth/presentation/log_in/manager/log_in_bloc/log_in_bloc.dart';
import '../../../../../core/services/service_locator.dart';
import '../../../../../core/utils/widgets/custom_app_bar.dart';
import 'widgets/login_view_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  static const routeName = "/LoginView";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(
          backgroundColor: Colors.transparent,
          title: 'Log In',
        ),
        body: BlocProvider(
          create: (context) => LogInBloc(authRepo: getIt.get<AuthRepo>()),
            child: const LoginViewBody(),),);
  }
}
