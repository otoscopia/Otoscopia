import 'package:fluent_ui/fluent_ui.dart';

import 'package:otoscopia/src/core/core.dart';

class MedicalFormEntity {
  final historyOfIllnessController = TextEditingController();
  final remarksController = TextEditingController();
  final temperatureController = TextEditingController();
  final heightController = TextEditingController();
  final weightController = TextEditingController();
  final chiefComplainsRemarksController = TextEditingController();
  final allergyRemarksController = TextEditingController();
  final undergoneSurgeryRemarksController = TextEditingController();
  final medicationRemarksController = TextEditingController();

  List<bool> chiefComplains = List.generate(complains.length, (index) => false);
  int similarCondition = 3;
  int allergy = 3;
  int undergoneSurgery = 3;
  int medication = 3;

  String get historyOfIllness => historyOfIllnessController.text;
  String get remarks => remarksController.text;
  double get temperature => heightController.text.isEmpty ? 0 : double.parse(temperatureController.text);
  double get height => heightController.text.isEmpty ? 0 : double.parse(heightController.text);
  double get weight => weightController.text.isEmpty ? 0 : double.parse(weightController.text);
  String get chiefComplaintRemarks => chiefComplainsRemarksController.text;
  String get allergyRemarks => allergyRemarksController.text;
  String get undergoneSurgeryRemarks => undergoneSurgeryRemarksController.text;
  String get medicationRemarks => medicationRemarksController.text;
  bool get isSimilarCondition => similarCondition == 0;
  bool get isAllergy => allergy == 0;
  bool get isUndergoneSurgery => undergoneSurgery == 0;
  bool get isMedication => medication == 0;

  MedicalFormEntity();

  bool get isValid {
    bool historyOfIllnessIsValid = historyOfIllness.isNotEmpty;
    bool remarksIsValid = remarks.isNotEmpty;
    bool temperatureIsValid = temperature > 0;
    bool heightIsValid = height > 0;
    bool weightIsValid = weight > 0;
    bool chiefComplainsRemarksIsValid = chiefComplains[4] ? chiefComplaintRemarks.isNotEmpty : true;
    bool allergyRemarksIsValid = isAllergy ? allergyRemarks.isNotEmpty : true;
    bool undergoneSurgeryRemarksIsValid = isUndergoneSurgery ? undergoneSurgeryRemarks.isNotEmpty : true;
    bool medicationRemarksIsValid = isMedication ? medicationRemarks.isNotEmpty : true;
    bool similarConditionIsValid = similarCondition != 3;
    bool allergyIsValid = allergy != 3;
    bool undergoneSurgeryIsValid = undergoneSurgery != 3;
    bool medicationIsValid = medication != 3;

    return historyOfIllnessIsValid &&
        remarksIsValid &&
        temperatureIsValid &&
        heightIsValid &&
        weightIsValid &&
        chiefComplainsRemarksIsValid &&
        allergyRemarksIsValid &&
        undergoneSurgeryRemarksIsValid &&
        medicationRemarksIsValid &&
        similarConditionIsValid &&
        allergyIsValid &&
        undergoneSurgeryIsValid &&
        medicationIsValid;
  }

  factory MedicalFormEntity.fromScreeningEntity(ScreeningEntity screening) {
    return MedicalFormEntity()
      ..historyOfIllnessController.text = screening.historyOfIllness
      ..remarksController.text = screening.remarks
      ..temperatureController.text = screening.temperature.toString()
      ..heightController.text = screening.height.toString()
      ..weightController.text = screening.weight.toString()
      ..chiefComplains = screening.chiefComplaint
      ..similarCondition = screening.similarCondition ? 0 : 1
      ..allergy = screening.allergy ? 0 : 1
      ..undergoneSurgery = screening.undergoneSurgery ? 0 : 1
      ..chiefComplainsRemarksController.text = screening.chiefComplaintRemarks
      ..allergyRemarksController.text = screening.allergyRemarks
      ..undergoneSurgeryRemarksController.text = screening.undergoneSurgeryRemarks
      ..medication = screening.medication ? 0 : 1
      ..medicationRemarksController.text = screening.medicationRemarks;
  }
}
