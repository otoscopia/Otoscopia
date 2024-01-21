import 'dart:math';

import 'package:otoscopia/core/core.dart';

UsersEntity shuffleDoctor(List<UsersEntity> doctors) {
  int index = Random.secure().nextInt(doctors.length);

  doctors.shuffle(Random(Random().nextInt(1000)));

  return doctors[index];
}
