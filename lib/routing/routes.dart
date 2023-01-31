import 'package:go_router/go_router.dart';

import '../modules/home/home.dart';
import '../modules/register/register.dart';

final GoRouter routes = GoRouter(
  initialLocation: '/',
  debugLogDiagnostics: true,
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) {
        return const HomePage();
      },
      routes: [
        GoRoute(
          path: 'register',
          builder: (context, state) {
            return const RegisterPage();
          },
        ),
      ],
    ),
  ],
);
