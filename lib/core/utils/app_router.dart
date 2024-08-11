import 'package:go_router/go_router.dart';
import 'package:task_management_app/features/on_boarding/view/on_boarding_view.dart';
import '../../features/auth/presentation/sign_up/presentation/view/sign_up_view.dart';

class AppRouter{
  static GoRouter appRouter = GoRouter(
      routes: [
        GoRoute(
          path: OnBoardingView.routeName,
          builder: (context, state) => const OnBoardingView(),
        ),
        GoRoute(
          path: SignUpView.routeName,
          builder: (context, state) => const SignUpView(),
        ),
      ]
  );
}