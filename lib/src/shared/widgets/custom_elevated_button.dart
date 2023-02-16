
import 'package:flutter/material.dart';
import 'package:fluttermon/src/shared/utils/consts.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    Key? key,
    this.savedFocusNode,
    required this.onPressed,
    required this.label,
  }) : super(key: key);

  final FocusNode? savedFocusNode;
  final Function()? onPressed;
  final String? label;

  

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: ElevatedButton(
          style: Consts.buttonStyleElevatedButton,
          focusNode: savedFocusNode,
          onPressed: onPressed,
          child: Text(label!),
        ),
      ),
    );
  }
}