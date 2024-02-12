import 'package:fluent_ui/fluent_ui.dart';

class SignInFormEntity {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  String get email => emailController.text;
  String get password => passwordController.text;

  bool get isValid {
    bool emailIsValid = email.isNotEmpty;
    bool passwordIsValid = password.isNotEmpty;

    return emailIsValid && passwordIsValid;
  }
}
