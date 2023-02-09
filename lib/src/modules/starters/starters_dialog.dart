
import 'package:flutter/material.dart';
import 'package:fluttermon/src/modules/starters/starters_controller.dart';
import 'package:fluttermon/src/shared/models/pokemon.dart';

class StartersDialog extends StatelessWidget {

  final controller = StartersController();
  final Pokemon pokemon;

  StartersDialog({
    super.key,
    required this.pokemon,
    });

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: Text('You choosed ${pokemon.species!}, are you sure?'),
      shape: RoundedRectangleBorder(
			  borderRadius: BorderRadius.circular(16.0),
		  ),
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Ink(
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(pokemon.frontImgSrc!),
                    fit: BoxFit.cover,
                    ),
                  ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Text('Yes'),
                  onPressed: () async {
                    await controller.setPokemon(choosenPokeNum: pokemon.spsnum.toString());
                    Navigator.pop(context);
                  }
                ),
                IconButton(
                  icon: const Text('No'),
                  onPressed: () async {
                    await controller.setPokemon(choosenPokeNum: '')
                    .then((_) {
                        Navigator.pop(context);
                      },
                    );
                    },
                )
              ],
            )
          ],
        ),
      ] 
    );
  }
}