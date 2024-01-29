import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:otoscopia/src/core/core.dart';
import 'package:otoscopia/src/features/nurse/nurse.dart';

class ScreeningInformationNotifier extends StateNotifier<ScreeningEntity> {
  ScreeningInformationNotifier() : super(ScreeningEntity.initial());

  void setScreening(WidgetRef ref, MedicalFormEntity medical) {
    final user = ref.read(userProvider);
    final patient = ref.read(patientProvider);
    final assignment = ref.read(assignmentsProvider.notifier).findByNurseAndSchool(user.id, patient.school);
    state = ScreeningEntity.fromMedical(medical, patient.id, assignment.id, state.images);
  }

  void setImage(String image) {
    state = state.copyWith(images: [...state.images, image]);
  }

  void resetInformation() => state = ScreeningEntity.initial();
}

final screeningInformationProvider =
    StateNotifierProvider<ScreeningInformationNotifier, ScreeningEntity>((ref) {
  return ScreeningInformationNotifier();
});
