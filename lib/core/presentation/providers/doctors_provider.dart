import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:otoscopia/core/core.dart';

class DoctorsNotifier extends StateNotifier<List<UsersEntity>> {
  DoctorsNotifier() : super([]);

  void setDoctors(List<UsersEntity> users) => state = users;
}

final doctorsProvider =
    StateNotifierProvider<DoctorsNotifier, List<UsersEntity>>((ref) {
  return DoctorsNotifier();
});
