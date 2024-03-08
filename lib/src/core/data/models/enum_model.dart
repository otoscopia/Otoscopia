import 'package:hive/hive.dart';

part 'enum_model.g.dart';

@HiveType(typeId: 7)
enum UserRoleModel {
  @HiveField(0)
  admin,

  @HiveField(1)
  nurse,

  @HiveField(2)
  doctor,

  @HiveField(3)
  patient
}

@HiveType(typeId: 8)
enum GenderModel {
  @HiveField(0)
  male,

  @HiveField(1)
  female,

  @HiveField(2)
  unknown
}

@HiveType(typeId: 9)
enum RecordStatusModel {
  @HiveField(0)
  pending,

  @HiveField(1)
  followUp,

  @HiveField(2)
  medicalAttention,

  @HiveField(3)
  resolved
}
