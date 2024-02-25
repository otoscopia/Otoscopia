import 'package:hive/hive.dart';

import 'package:otoscopia/src/core/core.dart';

part 'user_model.g.dart';

@HiveType(typeId: 5)
class UserModel {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String email;

  @HiveField(3)
  final String phone;

  @HiveField(4)
  final String workAddress;

  @HiveField(5)
  final String publicKey;

  @HiveField(6)
  final UserRole role;

  @HiveField(7)
  final String sessionId;
  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.workAddress,
    required this.publicKey,
    required this.role,
    required this.sessionId,
  });
}
