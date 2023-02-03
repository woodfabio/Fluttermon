
import 'package:flutter/material.dart';
import 'package:fluttermon/src/shared/models/pokemon.dart';
import 'package:fluttermon/src/shared/utils/consts.dart';
import 'package:fluttermon/src/shared/utils/sharedpreferences_keys.dart';
import 'package:fluttermon/src/modules/starters/starters_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StartersController extends ChangeNotifier {

  StartersState state = StartersStateEmpty();

  late ValueNotifier<Pokemon?> optionPoke$; 

  late ValueNotifier<Pokemon?> playerPoke$;

  String bulbasaurImg = Consts.bulbasaurFrontImg;
  String charmanderImg = Consts.charmanderFrontImg;
  String squirtleImg = Consts.squirtleFrontImg;
  String nullImg = Consts.nullImg;

  Future<void> setPokemon ({
    required String choosenPokeNum,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    if (choosenPokeNum == '1') {
      //Pokemon poke = Pokemon(spsnum: 1);
      prefs.setString(SharedPreferencesKeys.playerPoke, Pokemon(spsnum: 1).toJson());
    } else if (choosenPokeNum == '2') {    
    } else if (choosenPokeNum == '3') {  
    } else if (choosenPokeNum == '') {
      //prefs.setString(SharedPreferencesKeys.playerPokeImgSrc, nullImg);    
      //prefs.setString(SharedPreferencesKeys.playerPokeSps, '');
    }
  }

  Future<String?> getPokeName() async {
    final prefs = await SharedPreferences.getInstance();
    final pokeJson = Pokemon.fromJson(prefs.getString('playerPoke')!);
    return pokeJson.species;
  }

  Future<String?> getPokeImg () async {
    final prefs = await SharedPreferences.getInstance();
    final pokeJson = Pokemon.fromJson(prefs.getString('playerPoke')!);
    return pokeJson.frontImgSrc;
  }
}