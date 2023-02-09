
import 'dart:convert';
import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:fluttermon/src/modules/sign_up/sign_up_state.dart';
import 'package:fluttermon/src/shared/models/user_model.dart';
import 'package:fluttermon/src/shared/utils/sharedpreferences_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUpCubit extends Cubit<SignUpState> {

  SignUpCubit(super.initialState) {log('SignUpCubit created');}

  List<UserModel> myUsers = <UserModel>[];

  Future<void> getUsers() async {
    final prefs = await SharedPreferences.getInstance();
    final users = prefs.getString(SharedPreferencesKeys.users);

    if (users != null && users.isNotEmpty) {
      final decoded = jsonDecode(users);
      final decodedUsers = (decoded as List).map((e) => UserModel.fromJson(e)).toList();
      myUsers = decodedUsers;
    }
  }

  Future<void> addUser({required UserModel user}) async {
    emit(SignUpStateLoading());

    final prefs = await SharedPreferences.getInstance();    
    myUsers.add(user);
    final myUsersJson = myUsers.map((e) => e.toJson()).toList();
    prefs.setString(SharedPreferencesKeys.users, jsonEncode(myUsersJson));

    emit(SignUpStateSuccess());
  }
  
}