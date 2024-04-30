import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:otoscopia/src/core/core.dart';

class UserNotifier extends StateNotifier<UserEntity> {
  UserNotifier() : super(UserEntity.initial());

  void setUser(UserEntity user) {
    state = user;
  }

  UserRole get role => state.role;

  bool get isDoctor => state.role == UserRole.doctor;

  bool get isNurse => state.role == UserRole.nurse;

  void updateInformation({
    String? name,
    String? phone,
    String? workAddress,
  }) {
    final user = state.copyWith(
      name: name,
      phone: phone,
      workAddress: workAddress,
    );

    setUser(user);
  }

  void updateMfa(bool mfa) {
    final user = state.updateMfaFactors(mfa);
    setUser(user);
  }
}

final userProvider = StateNotifierProvider<UserNotifier, UserEntity>(
  (ref) => UserNotifier(),
);
