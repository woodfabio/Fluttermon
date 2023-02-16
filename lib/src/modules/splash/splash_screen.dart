
import 'package:flutter/material.dart';
import 'package:fluttermon/src/modules/splash/splash_controller.dart';
import 'package:fluttermon/src/modules/splash/splash_state.dart';
import 'package:fluttermon/src/shared/utils/consts.dart';
import 'package:fluttermon/src/shared/utils/consts_routes.dart';

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
        controller.hasUsers().then((value) {
          if (value.runtimeType == SplashStateHasUsers) {
            Navigator.popAndPushNamed(context, ConstsRoutes.chooseUserRoute);
          } else if (value.runtimeType == SplashStateNoUsers) {
            Navigator.pushReplacementNamed(context, ConstsRoutes.signUpRoute);
          }
        }
        );
      }
    );
    super.initState();    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 200,
          width: 350,
          decoration: BoxDecoration(
            border: Border.all(
              width: 10,
              color: Colors.blue,
              ),
            borderRadius: const BorderRadius.all(Radius.circular(10)),
          ),
          child: const SizedBox(
          height: 200,
          width: 3500,
            child: Image(
              image: AssetImage(Consts.fluttermonLogo),
            ),
          ),
        ),
      ),
    );
  }
}