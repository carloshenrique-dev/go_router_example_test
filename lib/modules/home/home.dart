import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_example_test/routing/routes.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: CircularProgressIndicator(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.goNamed(AppRoutes.register.name),
      ),
    );
  }
}
