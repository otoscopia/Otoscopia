import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:otoscopia/core/core.dart';

class DoctorsNotifier extends StateNotifier<List<UserEntity>> {
  DoctorsNotifier() : super([]);

  void setUsers(List<UserEntity> users) => state = users;
}

final doctorsProvider =
    StateNotifierProvider<DoctorsNotifier, List<UserEntity>>((ref) {
  return DoctorsNotifier();
});
