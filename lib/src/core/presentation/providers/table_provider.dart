import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:otoscopia/src/core/core.dart';

class TableNotifier extends StateNotifier<List<TableEntity>> {
  final StateNotifierProviderRef<TableNotifier, List<TableEntity>> ref;
  TableNotifier(this.ref) : super([]);

  void setTable(
      List<PatientEntity> patients, List<ScreeningEntity> screenings) {
    final List<TableEntity> tables = patients.map((patients) {
      final screening = screenings
          .firstWhere((screening) => screening.patient == patients.id);
      return TableEntity(patient: patients, screening: screening);
    }).toList();

    state = tables;
  }

  int findTableByPatientId(String id) =>
      state.indexWhere((element) => element.patient.id == id);

  void addTable(TableEntity table) {
    final index = findTableByPatientId(table.patient.id);
    if (index >= 0) {
      removeTable(index);
    }

    state = [...state, table];
  }

  void updateTable(TableEntity table) {
    final index = findTableByPatientId(table.patient.id);
    if (index >= 0) {
      state[index] = table;
    }
  }

  void removeTable(int index) => state.removeAt(index);

  void fromSnapshot(Map<String, dynamic> snapshot) {
    final patient = PatientEntity.fromMap(snapshot['patients']);
    final screening = ScreeningEntity.fromMap(snapshot);

    addTable(TableEntity(patient: patient, screening: screening));
    ref.read(patientsProvider.notifier).addPatient(patient);
    ref.read(screeningsProvider.notifier).addScreening(screening);
  }
}

final tableProvider = StateNotifierProvider<TableNotifier, List<TableEntity>>(
  (ref) => TableNotifier(ref),
);
