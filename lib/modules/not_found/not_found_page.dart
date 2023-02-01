import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_example_test/routing/routes.dart';

class NotFoundPage extends StatelessWidget {
  const NotFoundPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(
        child: Text('Not found page'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.goNamed(AppRoutes.home.name),
      ),
    );
  }
}
