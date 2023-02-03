
import 'package:flutter/material.dart';
import 'package:fluttermon/controller_classes.dart/pokemon.dart';
import 'package:fluttermon/src/sharedpreferences_keys.dart';
import 'package:fluttermon/src/starters/starters_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StartersController extends ChangeNotifier {

  StartersState state = StartersStateEmpty();

  late ValueNotifier<Pokemon?> optionPoke$; 

  late ValueNotifier<Pokemon?> playerPoke$;

  String bulbasaurImg = 'images/pokemons/bulbasaur_line/bulbapedia/bulbasaur.png';
  String charmanderImg = 'images/pokemons/charmander_line/bulbapedia/charmander.webp';
  String squirtleImg = 'images/pokemons/squirtle_line/bulbapedia/squirtle.webp';
  String nullImg = '';

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