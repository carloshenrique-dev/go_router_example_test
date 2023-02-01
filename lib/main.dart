import 'package:flutter/material.dart';
import 'package:go_router_example_test/routing/routes.dart';
import 'package:go_router_example_test/services/dependency_injection.dart';
import 'package:permission_handler/permission_handler.dart';

Future<void> main() async {
  runApp(const MainApp());
  setUpProviders();
  await Permission.activityRecognition.request();
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: routes,
      debugShowCheckedModeBanner: false,
    );
  }
}
