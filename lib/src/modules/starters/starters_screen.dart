
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:fluttermon/src/modules/starters/starters_controller.dart';
import 'package:fluttermon/src/modules/starters/starters_dialog.dart';
import 'package:fluttermon/src/shared/models/pokemon.dart';
import 'package:fluttermon/src/shared/utils/consts.dart';

class StartersScreen extends StatefulWidget {
  const StartersScreen({super.key});

  @override
  State<StartersScreen> createState() => _StartersScreenState();
}

class _StartersScreenState extends State<StartersScreen> {

  final controller = StartersController();
  List<Pokemon> pokemons = [Pokemon(spsnum: 1), Pokemon(spsnum: 2), Pokemon(spsnum: 3)];

  Future<String> getUserName() async {
    final userName = await controller.getUserName();
    return userName!;
  }

  @override
  void dispose() {
    pokemons.clear();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FutureBuilder(
            future: getUserName(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                log('snapshot with data');
                return Text(Consts.startersScreenText1 + snapshot.data! + Consts.startersScreenText2);
              } else {
                log('snapshot without data');
                return Container();
              }
            }
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                iconSize: 120,
                onPressed: () {
                  showDialog(
                    context: context, 
                    builder: (context) => StartersDialog(pokemon: pokemons[0]),
                  );
                },
                icon: Ink(
                  height: 90,
                  width: 90,
                  decoration:  const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(Consts.pokeballImg),
                    fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              IconButton(
                iconSize: 120,
                onPressed: () {
                  showDialog(
                    context: context, 
                    builder: (context) => StartersDialog(pokemon: pokemons[1]),
                  );
                },
                icon: Ink(
                  height: 90,
                  width: 90,
                  decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(Consts.pokeballImg),
                    fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              IconButton(
                iconSize: 120,
                onPressed: () {
                  showDialog(
                    context: context, 
                    builder: (context) => StartersDialog(pokemon: pokemons[2]),
                  );
                },
                icon: Ink(
                  height: 90,
                  width: 90,
                  decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(Consts.pokeballImg),
                    fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      )
    );
  }
}