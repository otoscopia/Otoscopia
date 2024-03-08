import 'package:hive_flutter/hive_flutter.dart';

import 'package:otoscopia/src/core/core.dart';

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

  factory PatientModel.fromEntity(PatientEntity entity) {
    final GenderModel gender =
        entity.gender == Gender.male ? GenderModel.male : GenderModel.female;

    return PatientModel(
      id: entity.id,
      name: entity.name,
      gender: gender,
      birthDate: entity.birthDate,
      school: entity.school,
      lrn: entity.lrn,
      guardian: entity.guardian,
      guardianPhone: entity.guardianPhone,
      creator: entity.creator,
      doctor: entity.doctor,
      code: entity.code,
      updatedAt: entity.updatedAt,
      createdAt: entity.createdAt,
    );
  }
}
