
import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:fluttermon/src/modules/sign_up/sign_up_state.dart';
import 'package:fluttermon/src/shared/models/user_model.dart';
import 'package:fluttermon/src/shared/utils/sharedpreferences_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUpCubit extends Cubit<SignUpState> {

  SignUpCubit(super.initialState);

  Future<void> addUser({required UserModel user}) async {
    
    final prefs = await SharedPreferences.getInstance();
    
    final userJson = user.toJson();
    prefs.setString(SharedPreferencesKeys.user, jsonEncode(user));

    emit(SignUpStateSuccess());

  }
  
}