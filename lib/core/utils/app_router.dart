import 'package:firebase_auth/firebase_auth.dart';
import 'package:go_router/go_router.dart';
import 'package:task_management_app/features/auth/presentation/log_in/view/login_view.dart';
import 'package:task_management_app/features/home_layout/presentation/view/home_layout_view.dart';
import 'package:task_management_app/features/on_boarding/view/on_boarding_view.dart';
import '../../features/auth/presentation/sign_up/presentation/view/sign_up_view.dart';

class AppRouter{
  static GoRouter appRouter = GoRouter(
    initialLocation: FirebaseAuth.instance.currentUser == null?null:HomeLayoutView.routeName,
      routes: [
        GoRoute(
          path: OnBoardingView.routeName,
          builder: (context, state) => const OnBoardingView(),
        ),
        GoRoute(
          path: SignUpView.routeName,
          builder: (context, state) => const SignUpView(),
        ),
        GoRoute(
          path: LoginView.routeName,
          builder: (context, state) => const LoginView(),
        ),
        GoRoute(
          path: HomeLayoutView.routeName,
          builder: (context, state) => const HomeLayoutView(),
        ),
      ]
  );
}