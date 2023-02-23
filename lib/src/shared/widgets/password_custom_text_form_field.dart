
import 'package:flutter/material.dart';
import 'package:fluttermon/src/shared/utils/mixins/validation_mixin.dart';
import 'package:fluttermon/src/shared/widgets/custom_text_form_field.dart';

class PasswordCustomTextFormField extends StatefulWidget {
  const PasswordCustomTextFormField({
    Key? key,
    required this.password,
    required this.textInputAction,
    required this.label,
    this.hintText,    
    this.onFieldSubmitted,
    this.focusNode,
    this.suffix,
  }) : super(key: key);

  final TextEditingController password;
  final TextInputAction textInputAction;
  final Function(String?)? onFieldSubmitted;
  final FocusNode? focusNode;
  final Widget? suffix;
  final Text? label;
  final String? hintText;

  @override
  State<PasswordCustomTextFormField> createState() =>
      _PasswordCustomTextFormFieldState();
}

class _PasswordCustomTextFormFieldState
    extends State<PasswordCustomTextFormField> with ValidationMixin {
  bool obscureText = true;

  Widget? get obscureIcon =>
      Icon(obscureText ? Icons.visibility_off : Icons.visibility,
          color: Theme.of(context).primaryColorDark);

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      prefixIcon: const Icon(Icons.vpn_key, color: Colors.grey,),
      obscureText: obscureText,
      label: widget.label!,
      controller: widget.password,
      hintText: widget.hintText,
      validator: (value) => validatePassword(value),
      onFieldSubmitted: widget.onFieldSubmitted,
      focusNode: widget.focusNode,
      textInputAction: widget.textInputAction,
      suffix: widget.suffix,
      suffixIcon: InkWell(
        onTap: () {
          setState(() {
            obscureText = !obscureText;
          });
        },
        child: obscureIcon,
      ),
    );
  }
}