import 'package:hive/hive.dart';

import 'enum_model.dart';

part 'users_model.g.dart';

@HiveType(typeId: 6)
class UsersModel {
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
  final UserRoleModel role;

  UsersModel({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.workAddress,
    required this.publicKey,
    required this.role,
  });
}
