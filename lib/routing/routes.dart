import 'package:go_router/go_router.dart';
import 'package:go_router_example_test/modules/dashboard/register.dart';
import 'package:go_router_example_test/modules/not_found/not_found_page.dart';

enum AppRoutes { home, register }

final GoRouter routes = GoRouter(
  initialLocation: '/',
  debugLogDiagnostics: true,
  routes: [
    GoRoute(
      path: '/',
      name: AppRoutes.home.name,
      builder: (context, state) {
        return const DashboardPage();
      },
    ),
  ],
  errorBuilder: (context, state) {
    return const NotFoundPage();
  },
);
