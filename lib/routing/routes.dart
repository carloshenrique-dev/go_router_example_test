import 'package:go_router/go_router.dart';
import 'package:go_router_example_test/modules/not_found/not_found_page.dart';

import '../modules/home/home.dart';
import '../modules/register/register.dart';

enum AppRoutes { home, register }

final GoRouter routes = GoRouter(
  initialLocation: '/',
  debugLogDiagnostics: true,
  routes: [
    GoRoute(
      path: '/',
      name: AppRoutes.home.name,
      builder: (context, state) {
        return const HomePage();
      },
      routes: [
        GoRoute(
          path: 'register',
          name: AppRoutes.register.name,
          builder: (context, state) {
            return const RegisterPage();
          },
        ),
      ],
    ),
  ],
  errorBuilder: (context, state) {
    return const NotFoundPage();
  },
);
