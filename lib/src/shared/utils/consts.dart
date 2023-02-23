import 'package:flutter/material.dart';

class Consts {
  Consts._();

  // shared texts
  static const String backText = 'Back';

  // splash texts
  static const String fluttermonName = 'Fluttermon';

  // choose user texts -------------------------------------------------------------------------------------------  
  static const String textSalutation = 'Hello! Welcome to Fluttermon!';  
  static const String chooseUserText = 'Please, choose or create a user to start the game:';
  static const String createUserText = 'Create user';

  // signUp texts ------------------------------------------------------------------------------------------------
  static const String imageLoginPage = 'images/login_flow/oak.png';
  static const String signUpTextSalutation = textSalutation;
  static const String textInteraction = 'Please enter your name:';
  static const String textUsername = 'Name';
  static const String textPassword = 'Password';
  static const String signUpButton = 'Sign Up';

  // starters screen texts ---------------------------------------------------------------------------------------
  static const String startersScreenText1 = 'Hello, ';
  static const String startersScreenText2 = ', choose a pokémon:';


  // POKEMON NAMES -----------------------------------------------------------------------------------------------  
  // bulbasaur line
  static const String bulbasaurSpecies = 'Bulbasaur';
  static const String ivysaurSpecies = 'Ivysaur';
  static const String venusaurSpecies = 'Venusaur';

  // charmander line
  static const String charmanderSpecies = 'Charmander';
  static const String charmeleonSpecies = 'Charmeleon';
  static const String charizardSpecies = 'Charizard';

  // squirtle line
  static const String squirtleSpecies = 'Squirtle';
  static const String wartortleSpecies = 'Wartortle';
  static const String blastoiseSpecies = 'Blastoise';

  // POKEMON IMAGES -----------------------------------------------------------------------------------------------
  // starters images
  // bulbasaur
  static const String bulbasaurFrontImg = 'images/pokemons/bulbasaur_line/bulbapedia/bulbasaur.png';
  static const String bulbasaurBackImg = 'images/pokemons/bulbasaur_line/bulbapedia/bulbasaur_back.png';

  // charmander
  static const String charmanderFrontImg = 'images/pokemons/charmander_line/bulbapedia/charmander.webp';
  static const String charmanderBackImg = 'images/pokemons/charmander_line/bulbapedia/charmander_back.webp';

  // squirtle
  static const String squirtleFrontImg = 'images/pokemons/squirtle_line/bulbapedia/squirtle.webp';
  static const String squirtleBackImg = 'images/pokemons/squirtle_line/bulbapedia/squirtle_back.webp';

  // null images  
  static const String nullImg = '';

  // OTHER IMAGES -------------------------------------------------------------------------------------------------

  // fluttermon logo
  static const String fluttermonLogo = 'images/fluttermon_logo.jpg';

  // pokeball
  static const String pokeballImg = 'images/pokeball.png';

  // user
  static const String userImg = 'images/user.png';

  // widget settings ----------------------------------------------------------------------------------------------
  static final buttonStyleElevatedButton = ElevatedButton.styleFrom(
    textStyle: const TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
    ),
    padding: const EdgeInsets.all(18),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
    ),
    shadowColor: const Color(0xFF231F1F),
    elevation: 8,
  );


}