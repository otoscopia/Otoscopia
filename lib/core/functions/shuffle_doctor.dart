import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:otoscopia/core/core.dart';

UserEntity shuffleDoctor(WidgetRef ref) {
  List<UserEntity> doctors = ref.read(doctorsProvider);

  int index = Random.secure().nextInt(doctors.length - 1);

  doctors.shuffle(Random(Random().nextInt(1000)));

  return doctors[index];
}
