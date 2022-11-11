
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fluttermon/controller_classes.dart/pokemon.dart';
import 'package:fluttermon/src/starters/starters_controller.dart';
import 'package:fluttermon/src/starters/starters_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StartersScreen extends StatefulWidget {
  const StartersScreen({super.key});

  @override
  State<StartersScreen> createState() => _StartersScreenState();
}

class _StartersScreenState extends State<StartersScreen> {

  final controller = StartersController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Choose a pokémon:'),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                iconSize: 120,
                onPressed: () async {
                  await controller.setPokemon(choosenPokeNum: '1');
                  String? name = await controller.getPokeName();
                  String? imgSrc = await controller.getPokeImg();
                  showDialog(
                    context: context, 
                    builder: (context) => StartersDialog(
                      pokeSps: name!,
                      pokeImgSrc: imgSrc!,
                      ),
                  );
                },
                icon: Ink(
                  height: 120,
                  width: 120,
                  decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(controller.bulbasaurImg),
                    fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              IconButton(
                iconSize: 120,
                onPressed: () async {
                  await controller.setPokemon(choosenPokeNum: '2');
                  String? name = await controller.getPokeName();
                  String? imgSrc = await controller.getPokeImg();
                  showDialog(
                    context: context, 
                    builder: (context) => StartersDialog(
                      pokeSps: name!,
                      pokeImgSrc: imgSrc!,
                      ),
                  );
                },
                icon: Ink(
                  height: 120,
                  width: 120,
                  decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(controller.charmanderImg),
                    fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              IconButton(
                iconSize: 120,
                onPressed: () async {
                  await controller.setPokemon(choosenPokeNum: '3');
                  String? name = await controller.getPokeName();
                  String? imgSrc = await controller.getPokeImg();
                  showDialog(
                    context: context, 
                    builder: (context) => StartersDialog(
                      pokeSps: name!,
                      pokeImgSrc: imgSrc!,
                      ),
                  );
                },
                icon: Ink(
                  height: 120,
                  width: 120,
                  decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(controller.squirtleImg),
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