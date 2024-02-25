import 'package:hive_flutter/hive_flutter.dart';

import 'enum_model.dart';

part 'patient_model.g.dart';

@HiveType(typeId: 1)
class PatientModel {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final GenderModel gender;

  @HiveField(3)
  final DateTime birthDate;

  @HiveField(4)
  final String school;

  @HiveField(5)
  final String lrn;

  @HiveField(6)
  final String guardian;

  @HiveField(7)
  final String guardianPhone;

  @HiveField(8)
  final String creator;

  @HiveField(9)
  final String doctor;

  @HiveField(10)
  final String code;

  @HiveField(11)
  final String? image;

  @HiveField(12)
  final DateTime updatedAt;

  @HiveField(13)
  final DateTime createdAt;

  PatientModel({
    required this.id,
    required this.name,
    required this.gender,
    required this.birthDate,
    required this.school,
    required this.lrn,
    required this.guardian,
    required this.guardianPhone,
    required this.creator,
    required this.doctor,
    required this.code,
    this.image,
    required this.updatedAt,
    required this.createdAt,
  });
}
