import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:otoscopia/core/core.dart';

class UserNotifier extends StateNotifier<UserEntity> {
  UserNotifier() : super(UserEntity.initial());

  void setUser(UserEntity user) {
    state = user;
  }
}

final userProvider = StateNotifierProvider<UserNotifier, UserEntity>(
  (ref) => UserNotifier(),
);
