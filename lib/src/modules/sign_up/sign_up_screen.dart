
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttermon/src/modules/sign_up/sign_up_cubit.dart';
import 'package:fluttermon/src/modules/sign_up/sign_up_state.dart';
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

  //Controle com entrada de parametro "text" com valores para teste
  final formValidVN = ValueNotifier<bool>(false);
  final formkey = GlobalKey<FormState>();
  final usernameController = TextEditingController();  
  final passwordController = TextEditingController(text: 'Abcde1#');

  @override
  void initState() {
    signUpCubit.getUsers();
    super.initState();
  }

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
          if (state is SignUpStateEmpty) {
            
            log(state.toString());
            return SafeArea(
              child: Scaffold(  
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
                                        CustomTextFormField(
                                          prefixIcon: const Icon(Icons.badge, color: Colors.grey),
                                          label: Text(
                                              Consts.textUsername,
                                              style: Theme.of(context).textTheme.labelSmall,
                                              ), 
                                          validator: (value) => combine([
                                            () => isEmpty(value),
                                            () => userNameAlreadyUsed(value, signUpCubit.myUsers),
                                            ]), 
                                          controller: usernameController,
                                          textInputAction: TextInputAction.next),
                                        const SizedBox(height: 20),
                                        PasswordCustomTextFormField(
                                          password: passwordController, 
                                          textInputAction: TextInputAction.next,
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
                        const SizedBox(height: 25),
                        ElevatedButton(
                          child: const Text(Consts.backText),
                          onPressed: () {
                            Navigator.popAndPushNamed(context, ConstsRoutes.chooseUserRoute);
                          },
                          
                        ),
                      ],
                    ),
                  ),
                ),
              ),
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