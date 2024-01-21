import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:otoscopia/core/core.dart';

class PatientsNotifier extends StateNotifier<List<PatientEntity>> {
  PatientsNotifier() : super([]);

  void setPatients(List<PatientEntity> patients) => state = patients;

  List<PatientEntity> findByDoctorId(String doctorId) {
    final patients = state.where((patient) => patient.creator == doctorId);
    return patients.toList();
  }
}

final patientsProvider =
    StateNotifierProvider<PatientsNotifier, List<PatientEntity>>(
  (ref) => PatientsNotifier(),
);
