import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:otoscopia/src/core/core.dart';

class AppIndexNotifier extends StateNotifier<int> {
  final StateNotifierProviderRef<AppIndexNotifier, int> ref;

  AppIndexNotifier(this.ref) : super(0);

  void setIndex(int index) {
    state = index;
  }

  void visitPatient(PatientEntity patient) {
    state = 1;
    ref.read(patientsTabProvider.notifier).addTab(patient);
  }
}

final appIndexProvider = StateNotifierProvider<AppIndexNotifier, int>(
  (ref) => AppIndexNotifier(ref),
);
