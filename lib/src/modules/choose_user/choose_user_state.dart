import 'package:fluttermon/src/shared/models/user_model.dart';

abstract class ChooseUserState {}

class ChooseUserStateSuccess extends ChooseUserState {
  final List<UserModel> users;
  ChooseUserStateSuccess({
    required this.users,
  });
}
class ChooseUserStateLoading extends ChooseUserState {}
class ChooseUserStateHasPoke extends ChooseUserState {}
class ChooseUserStateNoPoke extends ChooseUserState {}

class ChooseUserStateError extends ChooseUserState {
  
  final Object error;

  ChooseUserStateError({required this.error});

  @override
  String toString() => 'ChooseUserStateError(erro: $error)';
}