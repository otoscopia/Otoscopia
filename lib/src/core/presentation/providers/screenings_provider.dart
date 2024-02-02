import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:otoscopia/src/core/core.dart';

class ScreeningsNotifier extends StateNotifier<List<ScreeningEntity>> {
  ScreeningsNotifier() : super([]);

  void setScreenings(List<ScreeningEntity> screenings) => state = screenings;

  void removeScreening(int index) => state.removeAt(index);

  List<ScreeningEntity> findByPatientId(String patientId) {
    return state.where((screening) => screening.patient == patientId).toList();
  }

  int findByScreeningId(String screeningId) {
    return state.indexWhere((screening) => screening.id == screeningId);
  }

  void addScreening(ScreeningEntity screening) {
    final index = findByScreeningId(screening.id);
    if (index >= 0) {
      removeScreening(index);
    }

    state = [...state, screening];
  }

  updateStatus(ScreeningEntity screening) {
    final index = findByScreeningId(screening.id);
    if (index >= 0) {
      state[index] = screening;
    }
  }
}

final screeningsProvider =
    StateNotifierProvider<ScreeningsNotifier, List<ScreeningEntity>>(
  (ref) => ScreeningsNotifier(),
);
