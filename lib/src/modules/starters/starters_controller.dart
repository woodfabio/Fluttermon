
import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:fluttermon/src/shared/models/pokemon.dart';
import 'package:fluttermon/src/shared/models/user_model.dart';
import 'package:fluttermon/src/shared/utils/consts.dart';
import 'package:fluttermon/src/shared/utils/sharedpreferences_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StartersController extends ChangeNotifier {

  String? userName;

  String bulbasaurImg = Consts.bulbasaurFrontImg;
  String charmanderImg = Consts.charmanderFrontImg;
  String squirtleImg = Consts.squirtleFrontImg;
  String nullImg = Consts.nullImg;

  Future<void> init() async {
    userName = await getUserName();    
  }

  Future<void> setPokemon ({
    required String choosenPokeNum,
  }) async {
    final prefs = await SharedPreferences.getInstance();

    final user = prefs.getString(SharedPreferencesKeys.currentUser);

    if (user != null && user.isNotEmpty) {
      if (choosenPokeNum == '1') {
        //Pokemon poke = Pokemon(spsnum: 1);
        prefs.setString(SharedPreferencesKeys.currentUserPoke, Pokemon(spsnum: 1, owner: user).toJson());
      } else if (choosenPokeNum == '2') {    
      } else if (choosenPokeNum == '3') {  
      } else if (choosenPokeNum == '') {
        //prefs.setString(SharedPreferencesKeys.playerPokeImgSrc, nullImg);    
        //prefs.setString(SharedPreferencesKeys.playerPokeSps, '');
      }
    } else {
      log('starters controller setPokemon() user null');
    }
  }

  Future<String?> getPokeSpecies() async {
    final prefs = await SharedPreferences.getInstance();
    final pokeJson = Pokemon.fromJson(prefs.getString('playerPoke')!);
    return pokeJson.species;
  }

  Future<String?> getPokeImg() async {
    final prefs = await SharedPreferences.getInstance();
    final pokeJson = Pokemon.fromJson(prefs.getString('playerPoke')!);
    return pokeJson.frontImgSrc;
  }

  Future<String?> getUserName() async {
    final prefs = await SharedPreferences.getInstance();
    final currentUser = prefs.getString(SharedPreferencesKeys.currentUser);
    final currentUserModel = UserModel.fromJson(jsonDecode(currentUser!));
    final currentUserName = currentUserModel.name;
    log(currentUserName);
    return currentUserName;
  }
}