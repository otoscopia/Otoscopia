import 'package:fluent_ui/fluent_ui.dart';

class SignUpFormEntity {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final addressController = TextEditingController();
  final schoolController = TextEditingController();
  String? role;
  String? publickKey;

  String get email => emailController.text;
  String get password => passwordController.text;
  String get name => nameController.text;
  String get phone => phoneController.text;
  String get address => addressController.text;
  String get school => schoolController.text;

  bool get isValid {
    bool emailIsValid = email.isNotEmpty;
    bool passwordIsValid = password.isNotEmpty;
    bool nameIsValid = name.isNotEmpty;
    bool phoneIsValid = phone.isNotEmpty;
    bool addressIsValid = address.isNotEmpty;
    bool schoolIsValid = school.isNotEmpty;
    bool roleIsValid = role != null;

    return emailIsValid &&
        passwordIsValid &&
        nameIsValid &&
        phoneIsValid &&
        addressIsValid &&
        schoolIsValid &&
        roleIsValid;
  }

  Map<String, dynamic> toMap(String id) {
    return {
      'userId': id,
      'email': email,
      'name': name,
      'phone': "+63$phone",
      'workAddress': address,
      'school': school,
      'role': role!.toLowerCase(),
      'publicKey': "--",
    };
  }
}
