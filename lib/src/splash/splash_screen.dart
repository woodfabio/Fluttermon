
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fluttermon/src/Splash/splash_controller.dart';
import 'package:fluttermon/src/Splash/splash_state.dart';
import 'package:fluttermon/src/starters/starters_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  final SplashController controller = SplashController();

  @override
  void initState () {
    Future.delayed(const Duration(seconds: 2)).then(
      (value) async {
        controller.isAuthenticated().then((value) {
          if (value.runtimeType == SplashStateAuthenticated) {
            // TODO: go to map
          } else if (value.runtimeType == SplashStateUnauthenticated) {
            Navigator.pushReplacementNamed(context, '/starters');

          }
        }
        );
      }
    );
    super.initState();    
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Fluttermon'),
      )
    );
  }
}