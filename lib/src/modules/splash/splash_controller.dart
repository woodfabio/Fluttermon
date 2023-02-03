
import 'package:fluttermon/src/Splash/splash_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashController {

  SplashController();

  Future<SplashState> isAuthenticated() async {
    final prefs = await SharedPreferences.getInstance();
    final isAuthenticated = prefs.getBool('hasUser');
    if (isAuthenticated != null && isAuthenticated) {
      return SplashStateAuthenticated();
    } else {
      return SplashStateUnauthenticated();
    }
  }

}