import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:otoscopia/src/core/core.dart';
import 'package:otoscopia/src/features/nurse/nurse.dart';

class SyncDataNotifier extends StateNotifier<void> {
  final StateNotifierProviderRef<SyncDataNotifier, void> ref;
  SyncDataNotifier(this.ref) : super(null);

  Future<void> syncRecord() async {
    final patientBox = await Hive.openBox<PatientModel>(kPatientHiveBox);
    final patientsModel = patientBox.values.toList();
    final screeningBox = await Hive.openBox<ScreeningModel>(kScreeningHiveBox);
    final screeningModel = screeningBox.values.toList();
    final connection = ref.read(connectionProvider);

    if (patientsModel.isNotEmpty) {
      final patients = patientsModel.map((e) => PatientEntity.fromModel(e));
      final screenings = screeningModel.map((e) => ScreeningEntity.fromModel(e));
      final provider = ref.read(postDataProvider.notifier);

      for (PatientEntity patient in patients) {
        await provider.postPatient(connection, patient);
      }

      for (ScreeningEntity screening in screenings) {
        await provider.postScreening(connection, screening);
      }

      Hive.deleteBoxFromDisk(kPatientHiveBox);
      Hive.deleteBoxFromDisk(kScreeningHiveBox);
    }
  }
}

final syncDataProvider = StateNotifierProvider<SyncDataNotifier, void>((ref) {
  return SyncDataNotifier(ref);
});
