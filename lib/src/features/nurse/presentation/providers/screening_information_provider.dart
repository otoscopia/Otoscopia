import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:otoscopia/src/core/core.dart';
import 'package:otoscopia/src/features/nurse/nurse.dart';

class ScreeningInformationNotifier extends StateNotifier<ScreeningEntity> {
  ScreeningInformationNotifier() : super(ScreeningEntity.initial());

  void setScreening(WidgetRef ref, MedicalFormEntity medical, List<String> images) {
    final user = ref.read(userProvider);
    final patient = ref.read(patientProvider);
    final assignment = ref.read(assignmentsProvider.notifier).findByNurseAndSchool(user.id, patient.school);
    state = ScreeningEntity.fromMedical(medical, patient.id, assignment.id, images);
  }

  void resetInformation() => state = ScreeningEntity.initial();
}

final screeningInformationProvider =
    StateNotifierProvider<ScreeningInformationNotifier, ScreeningEntity>((ref) {
  return ScreeningInformationNotifier();
});
