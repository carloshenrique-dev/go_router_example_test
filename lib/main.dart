import 'package:flutter/material.dart';
import 'package:go_router_example_test/routing/routes.dart';
import 'package:go_router_example_test/services/dependency_injection.dart';
import 'package:workmanager/workmanager.dart';

void callbackDispatcher() {
  Workmanager().executeTask((taskName, inputData) {
    print("Background task executed: $taskName");
    return Future.value(true);
  });
}

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Workmanager().initialize(
    callbackDispatcher,
    isInDebugMode: true,
  );
  Workmanager().registerPeriodicTask(
    "background_task",
    "background_task",
    initialDelay: const Duration(seconds: 10),
    frequency: const Duration(minutes: 1),
  );
  runApp(const MainApp());
  setUpProviders();
  //await Permission.activityRecognition.request();
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
