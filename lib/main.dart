import 'package:flutter/material.dart';
import 'package:fluttermon/src/shared/utils/consts_routes.dart';
import 'package:fluttermon/src/modules/splash/splash_screen.dart';
import 'package:fluttermon/src/modules/starters/starters_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fluttermon',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      initialRoute: '/',
      routes: {
        ConstsRoutes.rootRoute: (context) => const SplashScreen(),
        ConstsRoutes.startersRoute: (context) => const StartersScreen(),
        // '/map': (context) => MapScreen(),
      },
    );
  }
}


