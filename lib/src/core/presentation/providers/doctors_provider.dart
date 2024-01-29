import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:otoscopia/src/core/core.dart';

class DoctorsNotifier extends StateNotifier<List<UsersEntity>> {
  DoctorsNotifier() : super([]);

  void setDoctors(List<UsersEntity> users) => state = users;

  UsersEntity findById(String id) {
    return state.firstWhere((user) => user.id == id);
  }
}

final doctorsProvider =
    StateNotifierProvider<DoctorsNotifier, List<UsersEntity>>((ref) {
  return DoctorsNotifier();
});
