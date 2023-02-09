import 'package:flutter/material.dart';
import 'package:fluttermon/src/modules/sign_up/sign_up_screen.dart';
import 'package:fluttermon/src/shared/utils/consts.dart';
import 'package:fluttermon/src/shared/utils/consts_routes.dart';
import 'package:fluttermon/src/modules/splash/splash_screen.dart';
import 'package:fluttermon/src/modules/starters/starters_screen.dart';
import 'package:fluttermon/src/shared/utils/custom_theme_data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Consts.fluttermonName,
      theme: CustomThemeData.themeData,
      initialRoute: ConstsRoutes.rootRoute,
      routes: {
        ConstsRoutes.rootRoute: (context) => const SplashScreen(),
        ConstsRoutes.signUpRoute: (context) => const SignUpScreen(),
        ConstsRoutes.startersRoute: (context) => const StartersScreen(),
        // '/map': (context) => MapScreen(),
      },
    );
  }
}


