import 'package:fluent_ui/fluent_ui.dart';

class PatientFormEntity {
  TextEditingController nameController = TextEditingController();
  int gender = 3;
  DateTime birthDate = DateTime.now();
  TextEditingController guardianNameController = TextEditingController();
  TextEditingController guardianPhoneNumberController = TextEditingController();
  TextEditingController schoolController = TextEditingController();
  TextEditingController lrnController = TextEditingController();

  PatientFormEntity();

  String get name => nameController.text;
  String get guardianName => guardianNameController.text;
  String get guardianPhone => guardianPhoneNumberController.text;
  String get school => schoolController.text;
  String get lrn => lrnController.text;

  bool get isValid {
    bool nameIsValid = name.isNotEmpty;
    bool guardianNameIsValid = guardianName.isNotEmpty;
    bool guardianPhoneIsValid = guardianPhone.isNotEmpty;
    bool schoolIsValid = school.isNotEmpty;
    bool lrnIsValid = lrn.isNotEmpty;
    bool genderIsValid = gender != 3;

    String birthdate = birthDate.toString().split(" ")[0];
    String today = DateTime.now().toString().split(" ")[0];
    bool birthDateIsValid = !today.contains(birthdate);

    return nameIsValid &&
        guardianNameIsValid &&
        guardianPhoneIsValid &&
        schoolIsValid &&
        lrnIsValid &&
        genderIsValid &&
        birthDateIsValid;
  }
}
