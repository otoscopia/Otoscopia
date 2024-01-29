import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:otoscopia/src/core/core.dart';

class PatientsTabNotifier extends StateNotifier<List<Tab>> {
  final StateNotifierProviderRef<PatientsTabNotifier, List<Tab>> ref;
  static final _tabs = [
    Tab(
      text: const Text("Patients"),
      icon: const Icon(FluentIcons.health),
      closeIcon: null,
      semanticLabel: "Patients",
      body: const PatientsTable(),
    ),
  ];

  PatientsTabNotifier(this.ref) : super(_tabs);

  bool findTab(PatientEntity patient) {
    final index =
        state.indexWhere((Tab tab) => (tab.text as Text).data == patient.name);

    if (index != -1) {
      ref.read(patientsIndexProvider.notifier).setIndex(index);
    }

    return !(index != -1);
  }

  void addTab(PatientEntity patient) {
    if (findTab(patient)) {
      late final Tab tab;
      tab = Tab(
        text: Text(patient.name),
        icon: const Icon(FluentIcons.contact_heart),
        semanticLabel: patient.name,
        body: PatientsInfo(patient),
        onClosed: () {
          state = state..remove(tab);
        },
      );

      state = [...state, tab];
      ref.read(patientsIndexProvider.notifier).setIndex(state.length - 1);
    }
  }
}

final patientsTabProvider =
    StateNotifierProvider<PatientsTabNotifier, List<Tab>>(
  (ref) => PatientsTabNotifier(ref),
);

class PatientsIndexNotifier extends StateNotifier<int> {
  PatientsIndexNotifier() : super(0);

  void setIndex(int index) => state = index;
}

final patientsIndexProvider = StateNotifierProvider<PatientsIndexNotifier, int>(
    (ref) => PatientsIndexNotifier());
