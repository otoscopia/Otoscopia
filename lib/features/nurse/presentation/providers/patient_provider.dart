import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:otoscopia/core/core.dart';
import 'package:otoscopia/features/nurse/nurse.dart';

class PatientNotifier extends StateNotifier<PatientEntity> {
  PatientNotifier() : super(PatientEntity.initial());

  void setPatient(WidgetRef ref, PatientFormEntity patient) {
    final user = ref.read(userProvider);
    final doctors = ref.read(doctorsProvider);
    final school =
        ref.read(schoolsProvider.notifier).findByName(patient.school);
    patient.schoolController.text = school.id;
    state = PatientEntity.fromFormEntity(patient, user.id, doctors);
  }

  void resetInformation() {
    state = PatientEntity.initial();
  }
}

final patientProvider =
    StateNotifierProvider<PatientNotifier, PatientEntity>((ref) {
  return PatientNotifier();
});
