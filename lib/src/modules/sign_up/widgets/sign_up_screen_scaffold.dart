
import 'package:flutter/material.dart';
import 'package:fluttermon/src/modules/sign_up/sign_up_cubit.dart';
import 'package:fluttermon/src/shared/models/user_model.dart';
import 'package:fluttermon/src/shared/utils/consts.dart';
import 'package:fluttermon/src/shared/utils/consts_routes.dart';
import 'package:fluttermon/src/shared/utils/mixins/validation_mixin.dart';
import 'package:fluttermon/src/shared/widgets/custom_text_form_field.dart';
import 'package:fluttermon/src/shared/widgets/password_custom_text_form_field.dart';

class SignUpScreenScaffold extends StatefulWidget {

  final ValueNotifier formValidVN;
  final GlobalKey<FormState> formkey;
  final TextEditingController usernameController;  
  final TextEditingController passwordController;
  final ThemeData theme;
  final SignUpCubit signUpCubit;
  final Function inputClear;
  final Widget? backButton;

  const SignUpScreenScaffold({
    required this.formValidVN, 
    required this.formkey, 
    required this.usernameController, 
    required this.passwordController,
    required this.theme,
    required this.signUpCubit,
    required this.inputClear,
    this.backButton,
    super.key,
  });

  @override
  State<SignUpScreenScaffold> createState() => _SignUpScreenScaffoldState();
}

class _SignUpScreenScaffoldState extends State<SignUpScreenScaffold> with ValidationMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(  
                      resizeToAvoidBottomInset: true,
                      body: GestureDetector(
                        onTap: () {
                          FocusScope.of(context).requestFocus(FocusNode());
                        },
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Form(
                                key: widget.formkey,
                                //Habilta de desabilita o botão
                                onChanged: () {
                                  setState(() {
                                    widget.formValidVN.value =
                                      widget.formkey.currentState?.validate() ?? false;
                                  });
                                },
                                child: SizedBox(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 25, vertical: 10),
                                    child: Center(
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          const Row(
                                            mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  SizedBox(
                                                    height: 200,
                                                    width: 200,
                                                    child: Image(
                                                      image: AssetImage(
                                                          Consts.imageLoginPage),
                                                    ),
                                                  ),
                                                ],
                                          ),
                                          const SizedBox(height: 25),
                                          Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    Consts.signUpTextSalutation,
                                                    style: widget.theme.textTheme.labelLarge,
                                                  ),
                                                  const SizedBox(height: 20),
                                                  Text(
                                                    Consts.textInteraction,
                                                    style: widget.theme.textTheme.labelSmall,
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(height: 20),
                                              CustomTextFormField(
                                                prefixIcon: const Icon(Icons.badge, color: Colors.grey),
                                                label: Text(
                                                    Consts.textUsername,
                                                    style: Theme.of(context).textTheme.labelSmall,
                                                    ), 
                                                validator: (value) => combine([
                                                  () => isEmpty(value),
                                                  () => userNameAlreadyUsed(value, widget.signUpCubit.myUsers),
                                                  ]), 
                                                controller: widget.usernameController,
                                                textInputAction: TextInputAction.next),
                                              const SizedBox(height: 20),
                                              PasswordCustomTextFormField(
                                                password: widget.passwordController, 
                                                textInputAction: TextInputAction.go,
                                                label: Text(
                                                    Consts.textPassword,
                                                    style: Theme.of(context).textTheme.labelSmall,
                                                  ),
                                              ),
                                              
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              ValueListenableBuilder(
                                //Habilta e desabilita o botão
                                valueListenable: widget.formValidVN,
                                builder: (_, formValid, child) {
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                                    child: SizedBox(
                                      width: MediaQuery.of(context).size.width,
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          textStyle: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        onPressed: !formValid
                                          ? null
                                          : () async {
                                            if (widget.formkey.currentState != null &&
                                                widget.formkey.currentState!.validate()) {
                                              UserModel user = UserModel(
                                                name: widget.usernameController.text,
                                                password: widget.passwordController.text,
                                              );
                                              await widget.signUpCubit.addUser(user: user);
                                              widget.formkey.currentState!.reset();
                                              widget.inputClear;
                                              if (!mounted) return; // this line was added to correct a bug due to a Flutter update
                                              Navigator.popAndPushNamed(context, ConstsRoutes.startersRoute);
                                            }
                                          },                              
                                        child: const Text(Consts.signUpButton),
                                      ),
                                    ),
                                  );
                                },
                              ),
                              widget.backButton ?? Container(),
                            ],
                          ),
                        ),
                      ),
                    );
  }
}