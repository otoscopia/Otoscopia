import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:otoscopia/src/core/core.dart';

class ScreeningsNotifier extends StateNotifier<List<ScreeningEntity>> {
  ScreeningsNotifier() : super([]);

  void setScreenings(List<ScreeningEntity> screenings) => state = screenings;

  void removeScreening(int index) => state.removeAt(index);

  List<ScreeningEntity> findByPatientId(String patientId) {
    return state.where((screening) => screening.patient == patientId).toList();
  }

  void addScreening(ScreeningEntity screening) {
    final index = state.indexWhere((element) => element.id == screening.id);
    if (index >= 0) {
      removeScreening(index);
    }

    state = [...state, screening];
  }
}

final screeningsProvider =
    StateNotifierProvider<ScreeningsNotifier, List<ScreeningEntity>>(
  (ref) => ScreeningsNotifier(),
);
