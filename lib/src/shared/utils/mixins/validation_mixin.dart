
import 'package:fluttermon/src/shared/models/user_model.dart';

mixin ValidationMixin {

  // mixins:
  // - combine
  // - isEmpty
  // - userNameAlreadyUsed
  // - validatePassword

  // combine different validations
  String? combine(List<String? Function()> validators) {
    for (final func in validators) {
      final validation = func();
      if (validation != null) return validation;
    }
    return null;
  }

  // verify if the input is not empty
  String? isEmpty(String? value, [String? message]) {
    if (value == null || value.isEmpty) {
      return message ?? "This field must be filled";
    }
    return null;
  }

  // verify if the name is already being used
  String? userNameAlreadyUsed(String? value, List<UserModel> userNames) {
    for (int i=0; i < userNames.length; i++) {
      if (value == userNames[i].name) {
        return "This name is already being used";
      }
    }
    return null;
  }

  // verify is password:
  //  - has 6 characteres
  //  - has at least 1 uppercase letter
  //  - has at least 1 number
  //  - has at least 1 lowercase letter
  //  - has at least 1 special character
  String? validatePassword(password) {
  if (password == null || password.isEmpty) {
    return 'Enter password';
  } else if (password.length < 6) {
    return 'Your password need at least 6 characters';
  }

  String hasUppercase =
      password.contains(RegExp(r'[A-Z]')) ? '' : 'uppercase letters, ';

  String hasDigits = password.contains(RegExp(r'[0-9]')) ? '' : 'numbers, ';

  String hasLowercase =
      password.contains(RegExp(r'[a-z]')) ? '' : 'lowercase letters, ';

  String hasSpecialCharacters =
      password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))
          ? ''
          : 'special character';
  String? result = '$hasUppercase$hasDigits$hasLowercase$hasSpecialCharacters';

  result = (result.isNotEmpty) ? "Must include: $result" : null;

  return result;
}

  


  /*
  // verify if 'isEmpty()' and 'userNameAlreadyUsed()' conditions are fullfiled
  String? isEmptyAndUsed(
    String? value,
    List<UserModel> userNames,
    [String? message]) {
      String? test = isEmpty(value);
      test ??= userNameAlreadyUsed(value, userNames);
      return test;
    }
  */

}