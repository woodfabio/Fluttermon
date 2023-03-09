
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttermon/src/modules/sign_up/sign_up_cubit.dart';
import 'package:fluttermon/src/modules/sign_up/sign_up_state.dart';
import 'package:fluttermon/src/modules/sign_up/widgets/sign_up_screen_scaffold.dart';
import 'package:fluttermon/src/shared/models/user_model.dart';
import 'package:fluttermon/src/shared/utils/consts.dart';
import 'package:fluttermon/src/shared/utils/consts_routes.dart';
import 'package:fluttermon/src/shared/utils/mixins/validation_mixin.dart';
import 'package:fluttermon/src/shared/widgets/custom_text_form_field.dart';
import 'package:fluttermon/src/shared/widgets/password_custom_text_form_field.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> with ValidationMixin {

  final signUpCubit = SignUpCubit(SignUpStateEmpty());

  // Controle com entrada de parametro "text" com valores para teste
  final formValidVN = ValueNotifier<bool>(false);
  final formkey = GlobalKey<FormState>();
  final usernameController = TextEditingController(text: 'Fábio');  
  final passwordController = TextEditingController(text: 'Abcde1#');

  // controle para botao de voltar
  bool firstSignUp = false;

  Future<bool> init() async {
    await signUpCubit.getUsers();
    final firstSignUp = signUpCubit.myUsers.isEmpty ? true : false;
    return firstSignUp;
  }

  @override
  void dispose() {
    usernameController.dispose();
    signUpCubit.close();
    super.dispose();
  }

  void inputClear() {
    usernameController.clear;
    passwordController.clear;
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return SafeArea(
      child: BlocConsumer<SignUpCubit, SignUpState> (
        bloc: signUpCubit,
        listener: (context, state) {

          if (state is SignUpStateSuccess) {
            log(state.toString());
            Navigator.popAndPushNamed(context, ConstsRoutes.startersRoute);
          }
          
        },
        builder: (context, state) {
          if (state is SignUpStateEmpty) {
            
            log(state.toString());
            return FutureBuilder(
              future: init(),
              builder: (context, snapshot) {
                if (snapshot.data == true) {
                  return SafeArea(
                    child: SignUpScreenScaffold(
                      formValidVN: formValidVN, 
                      formkey: formkey, 
                      usernameController: usernameController, 
                      passwordController: passwordController, 
                      theme: theme, 
                      signUpCubit: signUpCubit, 
                      inputClear: inputClear,
                    )
                  );
                } else {
                  return SafeArea(
                    child: SignUpScreenScaffold(
                      formValidVN: formValidVN, 
                      formkey: formkey, 
                      usernameController: usernameController, 
                      passwordController: passwordController, 
                      theme: theme, 
                      signUpCubit: signUpCubit, 
                      inputClear: inputClear,
                      backButton: ElevatedButton(
                                child: const Text(Consts.backText),
                                onPressed: () {
                                  Navigator.popAndPushNamed(context, ConstsRoutes.chooseUserRoute);
                                },                          
                              ),
                    )
                  );
                  
                }
              }
            );
          
          } else if (state is SignUpStateLoading) {

            return const Center(
              child: CircularProgressIndicator(),
            );
          
          } else if (state is SignUpStateError) {

            log(state.toString());
            log(state.error.toString());
            log(state.runtimeType.toString());
            return Text(state.error.toString());

          }
          return Container();
        }
      ),
    );
  }
}