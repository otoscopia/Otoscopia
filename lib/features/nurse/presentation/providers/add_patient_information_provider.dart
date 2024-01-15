import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:otoscopia/core/core.dart';

class AddPatientInformationNotifier extends StateNotifier<PatientEntity> {
  final StateNotifierProviderRef<AddPatientInformationNotifier, PatientEntity>
      ref;

  AddPatientInformationNotifier(this.ref) : super(PatientEntity.initial());

  void setPatient(PatientEntity patient) {
    state = patient;
  }

  void resetInformation() {
    state = PatientEntity.initial();
  }
}

final addPatientInformationProvider =
    StateNotifierProvider<AddPatientInformationNotifier, PatientEntity>((ref) {
  return AddPatientInformationNotifier(ref);
});
