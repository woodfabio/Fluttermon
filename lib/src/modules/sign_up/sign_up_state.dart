
abstract class SignUpState {}

class SignUpStateEmpty extends SignUpState {}
class SignUpStateLoading extends SignUpState {}
class SignUpStateSuccess extends SignUpState {}

class SignUpStateError extends SignUpState {
  
  final Object error;

  SignUpStateError({required this.error});

  @override
  String toString() => 'SignUpStateError(erro: $error)';
}