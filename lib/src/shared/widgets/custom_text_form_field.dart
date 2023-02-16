
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    Key? key,
    required this.label,
    required this.validator,
    required this.controller,    
    required this.textInputAction,
    required this.prefixIcon,
    this.hintText,
    this.suffixIcon,
    this.enabled = true,
    this.maxLines = 1,
    this.autofocus = false,
    this.textCapitalization = TextCapitalization.none,
    this.textInputFormatter,
    this.obscureText = false,
    this.focusNode,
    this.suffix,
    this.onFieldSubmitted,
  }) : super(key: key);

  final int maxLines;
  final Text label;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final bool autofocus;
  final TextInputAction textInputAction;
  final TextCapitalization textCapitalization;
  final List<TextInputFormatter>? textInputFormatter;
  final String? hintText;
  final bool obscureText;
  final Widget? suffix;
  final Widget? suffixIcon;
  final bool enabled;
  final Widget? prefixIcon;
  final Function(String?)? onFieldSubmitted;
  final FocusNode? focusNode;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: enabled,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      maxLines: maxLines,
      autofocus: autofocus,
      textInputAction: TextInputAction.next,
      controller: controller,
      textCapitalization: textCapitalization,
      validator: validator,
      inputFormatters: textInputFormatter,
      obscureText: obscureText,
      onFieldSubmitted: onFieldSubmitted,
      focusNode: focusNode,
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        suffix: suffix,
        suffixIcon: suffixIcon,
        hintText: hintText,
        label: label,
        border: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
      ),
    );
  }
}