
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttermon/src/modules/sign_up/sign_up_cubit.dart';
import 'package:fluttermon/src/modules/sign_up/sign_up_state.dart';
import 'package:fluttermon/src/shared/utils/consts.dart';
import 'package:fluttermon/src/shared/utils/consts_routes.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  final signUpCubit = SignUpCubit(SignUpStateLoading());

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
      child: BlocBuilder<SignUpCubit, SignUpState> (
        bloc: signUpCubit,
        builder: (context, state) {
          if (state is SignUpStateLoading) {

            return const Center(
              child: CircularProgressIndicator(),
            );

          } else if (state is SignUpStateEmpty) {
            
            log(state.toString());
            return SafeArea(
              child: ListView(
                children: [
                  Column(
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: const [
                                          SizedBox(
                                            height: 180,
                                            width: 180,
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
                                            CrossAxisAlignment.start,
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
                    ],
                  ),
                ],
              ),
            );


          
          } else if (state is SignUpStateSuccess) {
            
            log(state.toString());
            Navigator.popAndPushNamed(context, ConstsRoutes.startersRoute);

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