
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttermon/src/modules/sign_up/sign_up_cubit.dart';
import 'package:fluttermon/src/modules/sign_up/sign_up_state.dart';
import 'package:fluttermon/src/shared/models/user_model.dart';
import 'package:fluttermon/src/shared/utils/consts.dart';
import 'package:fluttermon/src/shared/utils/consts_routes.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  final signUpCubit = SignUpCubit(SignUpStateEmpty());

  //Controle com entrada de parametro "text" com valores para teste
  final formValidVN = ValueNotifier<bool>(false);
  final formkey = GlobalKey<FormState>();
  final usernameController = TextEditingController(text: 'WOOD');

  @override
  void dispose() {
    usernameController.dispose();
    signUpCubit.close();
    super.dispose();
  }

  get inputClear {
    usernameController.clear;
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
          if (state is SignUpStateLoading) {

            return const Center(
              child: CircularProgressIndicator(),
            );

          } else if (state is SignUpStateEmpty) {
            
            log(state.toString());
            return SafeArea(
              child: Material(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Form(
                      key: formkey,
                      //Habilta de desabilita o botão
                      onChanged: () {
                        setState(() {
                          formValidVN.value =
                            formkey.currentState?.validate() ?? false;
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
                                Row(
                                  mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: const [
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
                                          Consts.textSalutation,
                                          style: theme.textTheme.labelLarge,
                                        ),
                                        const SizedBox(height: 20),
                                        Text(
                                          Consts.textInteraction,
                                          style: theme.textTheme.labelSmall,
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 20),
                                    TextFormField(
                                      decoration: InputDecoration(
                                        label: Text(
                                          Consts.textUsername,
                                          style: Theme.of(context).textTheme.labelSmall,
                                          ),
                                        border: const OutlineInputBorder(
                                           borderRadius: BorderRadius.all(Radius.circular(10)),
                                          ),                                        
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
                      valueListenable: formValidVN,
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
                                if (formkey.currentState != null &&
                                    formkey.currentState!.validate()) {
                                  UserModel user = UserModel(
                                    name: usernameController.text,
                                  );
                                  await signUpCubit.addUser(user: user);
                                  formkey.currentState!.reset();
                                  inputClear;
                                  Navigator.popAndPushNamed(context, ConstsRoutes.startersRoute);
                                }
                              },                              
                            child: const Text(Consts.signUpButton),
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
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