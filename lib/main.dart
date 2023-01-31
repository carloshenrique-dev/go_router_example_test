import 'package:flutter/material.dart';
import 'package:go_router_example_test/routing/routes.dart';
import 'package:go_router_example_test/services/dependency_injection.dart';

void main() {
  runApp(const MainApp());
  setUpProviders();
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  /* (double x, double y) geoLocation(String name) {
  if (name == 'Nairobi') {
    return (-1.2921, 36.8219);
  } else {
    return (1,5);
  }
  }*/

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: routes,
      debugShowCheckedModeBanner: false,
    );
  }
}
