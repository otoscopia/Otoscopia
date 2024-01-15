// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:otoscopia/core/core.dart';

class PatientEntity {
  final String id;
  final String name;
  final Gender gender;
  final DateTime birthDate;
  final String school;
  final String guardian;
  final String guardianPhone;
  final String creator;
  final String doctor;
  final String code;
  final String? image;
  final DateTime updatedAt;
  final DateTime createdAt;

  PatientEntity({
    required this.id,
    required this.name,
    required this.gender,
    required this.birthDate,
    required this.school,
    required this.guardian,
    required this.guardianPhone,
    required this.creator,
    required this.doctor,
    required this.code,
    this.image,
    required this.updatedAt,
    required this.createdAt,
  });

  PatientEntity copyWith({
    String? id,
    String? name,
    Gender? gender,
    DateTime? birthDate,
    String? school,
    String? guardian,
    String? guardianPhone,
    String? creator,
    String? doctor,
    String? nurse,
    String? code,
    String? image,
    DateTime? updatedAt,
    DateTime? createdAt,
  }) {
    return PatientEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      gender: gender ?? this.gender,
      birthDate: birthDate ?? this.birthDate,
      school: school ?? this.school,
      guardian: guardian ?? this.guardian,
      guardianPhone: guardianPhone ?? this.guardianPhone,
      creator: creator ?? this.creator,
      doctor: doctor ?? this.doctor,
      code: code ?? this.code,
      image: image ?? this.image,
      updatedAt: updatedAt ?? this.updatedAt,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'gender': gender.toString(),
      'birthDate': birthDate.millisecondsSinceEpoch,
      'school': school,
      'guardian': guardian,
      'guardianPhone': guardianPhone,
      'creator': creator,
      'doctor': doctor,
      'code': code,
      'image': image,
      'updatedAt': updatedAt.millisecondsSinceEpoch,
      'createdAt': createdAt.millisecondsSinceEpoch,
    };
  }

  factory PatientEntity.fromMap(Map<String, dynamic> map) {
  Gender gender =
        map["gender"] == "Gender.male" ? Gender.male : Gender.female;
    return PatientEntity(
      id: map['id'] as String,
      name: map['name'] as String,
      gender: gender,
      birthDate: DateTime.fromMillisecondsSinceEpoch(map['birthDate'] as int),
      school: map['school'] as String,
      guardian: map['guardian'] as String,
      guardianPhone: map['guardianPhone'] as String,
      creator: map['creator'] as String,
      doctor: map['doctor'] as String,
      code: map['code'] as String,
      image: map['image'] != null ? map['image'] as String : null,
      updatedAt: DateTime.fromMillisecondsSinceEpoch(map['updatedAt'] as int),
      createdAt: DateTime.fromMillisecondsSinceEpoch(map['createdAt'] as int),
    );
  }

  String toJson() => json.encode(toMap());

  factory PatientEntity.fromJson(String source) =>
      PatientEntity.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'PatientEntity(id: $id, name: $name, gender: $gender, birthDate: $birthDate, school: $school, guardian: $guardian, guardianPhone: $guardianPhone, creator: $creator, doctor: $doctor, code: $code, image: $image, updatedAt: $updatedAt, createdAt: $createdAt)';
  }

  @override
  bool operator ==(covariant PatientEntity other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.gender == gender &&
        other.birthDate == birthDate &&
        other.school == school &&
        other.guardian == guardian &&
        other.guardianPhone == guardianPhone &&
        other.creator == creator &&
        other.doctor == doctor &&
        other.code == code &&
        other.image == image &&
        other.updatedAt == updatedAt &&
        other.createdAt == createdAt;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        gender.hashCode ^
        birthDate.hashCode ^
        school.hashCode ^
        guardian.hashCode ^
        guardianPhone.hashCode ^
        creator.hashCode ^
        doctor.hashCode ^
        code.hashCode ^
        image.hashCode ^
        updatedAt.hashCode ^
        createdAt.hashCode;
  }
}
