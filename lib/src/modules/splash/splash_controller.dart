
import 'dart:developer';
import 'package:fluttermon/src/modules/splash/splash_state.dart';
import 'package:fluttermon/src/shared/utils/sharedpreferences_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashController {

  SplashController() {log('SplashController created');}

  Future<SplashState> hasUsers() async {
    final prefs = await SharedPreferences.getInstance();
    final user = prefs.getString(SharedPreferencesKeys.users);
    if (user != null && user.isNotEmpty) {
      log('Has users');
      return SplashStateHasUsers();
    } else {
      return SplashStateNoUsers();      
    }
  }

  Future<bool> hasPokemon({required String user}) async {
    final prefs = await SharedPreferences.getInstance();
    final playerPoke = prefs.getString(SharedPreferencesKeys.currentUserPoke);
    if (playerPoke != null && playerPoke.isNotEmpty) {
      log('has player poke');
      return true;
    } else {
      return false;
    }
  }

}