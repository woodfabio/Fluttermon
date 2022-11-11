import 'package:flutter/material.dart';
import 'package:fluttermon/controller_classes.dart/controller.dart';
import 'package:fluttermon/src/splash/splash_screen.dart';
import 'package:fluttermon/src/starters/starters_screen.dart';

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
        '/': (context) => const SplashScreen(),
        '/starters': (context) => const StartersScreen(),
        // '/map': (context) => MapScreen(),
      },
    );
  }
}


