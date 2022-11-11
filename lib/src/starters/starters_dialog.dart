
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fluttermon/src/starters/starters_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StartersDialog extends StatelessWidget {

  final controller = StartersController();
  late String pokeSps;
  late String pokeImgSrc;

  StartersDialog({
    super.key,
    required this.pokeSps,
    required this.pokeImgSrc,
    });

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: Text('You choosed $pokeSps, are you sure?'),
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
                    image: AssetImage(pokeImgSrc),
                    fit: BoxFit.cover,
                    ),
                  ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Text('Yes'),
                  onPressed: () {
                    Navigator.pop(context);
                  }
                ),
                IconButton(
                  icon: const Text('No'),
                  onPressed: () async {
                    await controller.setPokemon(choosenPokeNum: '',
                    ).then((_) {
                        Navigator.pop(context);
                        });
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