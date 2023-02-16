
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttermon/src/modules/choose_user/choose_user_cubit.dart';
import 'package:fluttermon/src/modules/choose_user/choose_user_state.dart';
import 'package:fluttermon/src/shared/models/user_model.dart';
import 'package:fluttermon/src/shared/utils/consts.dart';
import 'package:fluttermon/src/shared/utils/consts_routes.dart';
import 'package:fluttermon/src/shared/widgets/custom_elevated_button.dart';

class ChooseUserScreen extends StatefulWidget {
  const ChooseUserScreen({super.key});

  @override
  State<ChooseUserScreen> createState() => _ChooseUserScreenState();
}

class _ChooseUserScreenState extends State<ChooseUserScreen> {

  final chooseUserCubit = ChooseUserCubit(ChooseUserStateLoading());

  @override
  void initState() {
    chooseUserCubit.getUsers();
    super.initState();
  }
  

  Future<List<UserModel>> getUsers() async {
    await chooseUserCubit.getUsers();
    return chooseUserCubit.myUsers;
  }
  
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return SafeArea(
      child: BlocConsumer<ChooseUserCubit, ChooseUserState>(
        bloc: chooseUserCubit,
        listener: (context, state) {
          if (state is ChooseUserStateNoPoke) {
            log(state.toString());
            Navigator.popAndPushNamed(context, ConstsRoutes.startersRoute);
          } else if (state is ChooseUserStateHasPoke) {
            Navigator.popAndPushNamed(context, ConstsRoutes.roadMapRoute);
          }
        },
        builder: (context, state) {          
          if (state is ChooseUserStateSuccess) {
            return Scaffold(
              body: Padding(
                padding: const EdgeInsets.symmetric(
                              horizontal: 25, vertical: 70),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30.0),
                        child: Text(
                          Consts.chooseUserText,
                          style: theme.textTheme.labelLarge,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(height: 40),
                      CustomElevatedButton(
                        onPressed: () {
                          Navigator.popAndPushNamed(context, ConstsRoutes.signUpRoute);
                        }, 
                        label: Consts.createUserText,
                      ),
                      const SizedBox(height: 25),
                      Expanded(
                        child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: state.users.length,
                          itemBuilder: (context, i) {
                            return Card(
                              child: Row(
                                children: [
                                  IconButton(
                                    iconSize: 120,
                                    onPressed: () async {
                                      await chooseUserCubit.setUser(user: state.users[i]);
                                      final hasPoke = await chooseUserCubit.hasPokemon(
                                        user: state.users[i]
                                      );
                                      if (!mounted) return;
                                      if (hasPoke) {
                                        Navigator.popAndPushNamed(context, ConstsRoutes.roadMapRoute);
                                      } else {
                                        Navigator.popAndPushNamed(context, ConstsRoutes.startersRoute);
                                      }                                    
                                    },
                                    icon: Ink(
                                      height: 90,
                                      width: 90,
                                      decoration: const BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(Consts.userImg),
                                        fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Text(
                                    state.users[i].name,                                 
                                    style: Theme.of(context).textTheme.titleLarge
                                  ),
                                ]
                              ),
                            );
                          }
                        ),
                      ),
                          
                    ],
                  )
                ),
              ),
            );

          } else if (state is ChooseUserStateLoading) {

            return const Center(
              child: CircularProgressIndicator(),
            );
          
          } else if (state is ChooseUserStateError) {

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