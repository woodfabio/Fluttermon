
import 'dart:convert';
import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttermon/src/modules/choose_user/choose_user_state.dart';
import 'package:fluttermon/src/shared/models/pokemon.dart';
import 'package:fluttermon/src/shared/models/user_model.dart';
import 'package:fluttermon/src/shared/utils/sharedpreferences_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChooseUserCubit extends Cubit<ChooseUserState>  {

  ChooseUserCubit(super.initialState) {log('ChooseUserCubit created');}

  List<UserModel> myUsers = <UserModel>[];

  Future<void> getUsers() async {
    emit(ChooseUserStateLoading());
    final prefs = await SharedPreferences.getInstance();
    final users = prefs.getString(SharedPreferencesKeys.users);

    if (users != null && users.isNotEmpty) {
      final decoded = jsonDecode(users);
      final decodedUsers = (decoded as List).map((e) => UserModel.fromJson(e)).toList();
      myUsers = decodedUsers;
      emit(ChooseUserStateSuccess(users: myUsers));
    }
  }

  Future<void> setUser({required UserModel user}) async {
    emit(ChooseUserStateLoading());
    final prefs = await SharedPreferences.getInstance();
    final currentUserJson = user.toJson();
    prefs.setString(SharedPreferencesKeys.currentUser, jsonEncode(currentUserJson));

    final hasPoke = await hasPokemon(user: user);

    if (hasPoke) {
      setCurrentUserPoke(user: user);
      emit(ChooseUserStateHasPoke());
    } else {
      emit(ChooseUserStateNoPoke());
    }
  }

  Future<void> setCurrentUserPoke({required UserModel user}) async {
    final prefs = await SharedPreferences.getInstance();
    final pokes = await getUsersPokes();

    if (pokes != null && pokes.isNotEmpty) {
      for (int i=0; i < pokes.length; i++) {
        if (pokes[i].owner == user.name) {
          log('user has pokemon');
          final currentUserPoke = pokes[i].toJson();
          prefs.setString(SharedPreferencesKeys.currentUserPoke, jsonEncode(currentUserPoke));
        }
      }
    }
  }

  Future<bool> hasPokemon({required UserModel user}) async {
    final pokes = await getUsersPokes();
    bool hasPoke = false;

    if (pokes != null && pokes.isNotEmpty) {
      for (int i=0; i < pokes.length; i++) {
        if (pokes[i].owner == user.name) {
          log('user has pokemon');
          hasPoke = true;
        }
      }
    }
    return hasPoke;
  }

  Future<List<Pokemon>?> getUsersPokes() async {
    final prefs = await SharedPreferences.getInstance();
    final usersPokes = prefs.getString(SharedPreferencesKeys.usersPokes);

    if (usersPokes != null && usersPokes.isNotEmpty) {
      final decoded = jsonDecode(usersPokes);
      final decodedUsersPokes = (decoded as List).map((e) => Pokemon.fromJson(e)).toList();
      return decodedUsersPokes;
    } else {
      return null;
    }
  }

}