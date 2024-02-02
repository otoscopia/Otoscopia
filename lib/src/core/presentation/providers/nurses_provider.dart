import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:otoscopia/src/core/core.dart';

class NursesNotifier extends StateNotifier<List<UsersEntity>> {
  NursesNotifier() : super([]);

  void setNurses(List<UsersEntity> nurses) => state = nurses;

  UsersEntity findById(String id) {
    return state.firstWhere((user) => user.id == id);
  }
}

final nursesProvider = StateNotifierProvider<NursesNotifier, List<UsersEntity>>(
  (ref) => NursesNotifier(),
);
