
import 'dart:developer';
import 'package:fluttermon/src/modules/splash/splash_state.dart';
import 'package:fluttermon/src/shared/utils/sharedpreferences_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashController {

  SplashController() {log('SplashController created');}

  Future<SplashState> isAuthenticated() async {
    final prefs = await SharedPreferences.getInstance();
    final user = prefs.getString(SharedPreferencesKeys.user);
    if (user != null && user.isNotEmpty) {
      log('Authenticated');
      return SplashStateAuthenticated();      
    } else {
      log('Unauthenticated');
      return SplashStateUnauthenticated();
    }
  }

}