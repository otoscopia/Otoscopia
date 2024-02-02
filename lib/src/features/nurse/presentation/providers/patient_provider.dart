import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:otoscopia/src/core/core.dart';
import 'package:otoscopia/src/features/nurse/nurse.dart';

class PatientNotifier extends StateNotifier<PatientEntity> {
  PatientNotifier() : super(PatientEntity.initial());

  void setPatient(WidgetRef ref, PatientFormEntity form, bool hasValue) {
    final user = ref.read(userProvider);
    final doctors = ref.read(doctorsProvider);
    final school = ref.read(schoolsProvider.notifier).findByName(form.school);
    form.schoolController.text = school.id;
    if (hasValue) {
      state = PatientEntity.copyFromForm(state, form);
    } else {
      state = PatientEntity.fromFormEntity(form, user.id, doctors);
    }
  }

  void resetInformation() {
    state = PatientEntity.initial();
  }
}

final patientProvider =
    StateNotifierProvider<PatientNotifier, PatientEntity>((ref) {
  return PatientNotifier();
});
