
import 'package:flutter/material.dart';
import 'package:fluttermon/src/shared/models/user_model.dart';
import 'package:fluttermon/src/shared/utils/consts.dart';
import 'package:fluttermon/src/shared/widgets/password_custom_text_form_field.dart';

class PasswordDialog extends StatefulWidget {

  final UserModel user;

  const PasswordDialog({
    required this.user,
    super.key,
    });

  @override
  State<PasswordDialog> createState() => _PasswordDialogState();
}

class _PasswordDialogState extends State<PasswordDialog> {
    
  final formValidVN = ValueNotifier<bool>(false);
  final formkey = GlobalKey<FormState>();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: const Text(Consts.passwordDialogText),
      shape: RoundedRectangleBorder(
			  borderRadius: BorderRadius.circular(16.0),
		  ),
      children: [
        Column(
          children: [
            Form(
              key: formkey,
              child: PasswordCustomTextFormField(
                password: passwordController,
                textInputAction: TextInputAction.go,
                label: Text(
                  Consts.textPassword,
                  style: Theme.of(context).textTheme.labelSmall,
                ),
              ),
            ),
            IconButton(
              onPressed: () {
                if (passwordController.text == widget.user.password) {
                  Navigator.pop(context, true);
                } else {
                  Navigator.pop(context, false);
                }                
              }, 
              icon: const Text('Enter password'),
            ),
          ],
        ),
      ],


    );
  }
}