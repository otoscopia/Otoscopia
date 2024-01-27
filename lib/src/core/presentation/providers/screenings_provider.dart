import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:otoscopia/src/core/core.dart';

class ScreeningsNotifier extends StateNotifier<List<ScreeningEntity>> {
  ScreeningsNotifier() : super([]);

  void setScreenings(List<ScreeningEntity> screenings) => state = screenings;
}

final screeningsProvider =
    StateNotifierProvider<ScreeningsNotifier, List<ScreeningEntity>>(
  (ref) => ScreeningsNotifier(),
);