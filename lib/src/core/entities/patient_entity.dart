// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:otoscopia/src/config/config.dart';
import 'package:otoscopia/src/core/core.dart';
import 'package:otoscopia/src/features/nurse/nurse.dart';

class PatientEntity {
  final String id;
  final String name;
  final Gender gender;
  final DateTime birthDate;
  final String school;
  final String lrn;
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

  PatientEntity copyWith({
    String? id,
    String? name,
    Gender? gender,
    DateTime? birthDate,
    String? school,
    String? lrn,
    String? guardian,
    String? guardianPhone,
    String? creator,
    String? doctor,
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
      lrn: lrn ?? this.lrn,
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

  String get genderString {
    return gender.toString().split(".").last;
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'gender': genderString,
      'birthDate': birthDate.toIso8601String(),
      'school': school,
      'lrn': lrn,
      'guardian': guardian,
      'guardianPhone': guardianPhone,
      'creator': creator,
      'doctor': doctor,
      'code': code,
      'image': image,
    };
  }

  factory PatientEntity.fromMap(Map<String, dynamic> map) {
    Gender gender = map["gender"] == "male" ? Gender.male : Gender.female;

    return PatientEntity(
      id: map['\$id'] as String,
      name: map['name'] as String,
      gender: gender,
      birthDate: DateTime.parse(map['birthDate'] as String),
      school: map['school']['\$id'] as String,
      lrn: map['lrn'] as String,
      guardian: map['guardian'] as String,
      guardianPhone: map['guardianPhone'] as String,
      creator: map['creator'] as String,
      doctor: map['doctor']["\$id"] as String,
      code: map['code'] as String,
      image: map['image'] != null ? map['image'] as String : null,
      updatedAt: DateTime.parse(map['\$updatedAt'] as String),
      createdAt: DateTime.parse(map['\$createdAt'] as String),
    );
  }

  String toJson() => json.encode(toMap());

  factory PatientEntity.fromJson(String source) =>
      PatientEntity.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'PatientEntity(id: $id, name: $name, gender: $gender, birthDate: $birthDate, school: $school, lrn: $lrn, guardian: $guardian, guardianPhone: $guardianPhone, creator: $creator, doctor: $doctor, code: $code, image: $image, updatedAt: $updatedAt, createdAt: $createdAt)';
  }

  @override
  bool operator ==(covariant PatientEntity other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.gender == gender &&
        other.birthDate == birthDate &&
        other.school == school &&
        other.lrn == lrn &&
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
        lrn.hashCode ^
        guardian.hashCode ^
        guardianPhone.hashCode ^
        creator.hashCode ^
        doctor.hashCode ^
        code.hashCode ^
        image.hashCode ^
        updatedAt.hashCode ^
        createdAt.hashCode;
  }

  factory PatientEntity.initial() {
    return PatientEntity(
      id: "",
      name: "",
      gender: Gender.unknown,
      birthDate: DateTime.now(),
      school: "",
      lrn: "",
      guardian: "",
      guardianPhone: "",
      creator: "",
      doctor: "",
      code: "",
      updatedAt: DateTime.now(),
      createdAt: DateTime.now(),
    );
  }

  factory PatientEntity.fromFormEntity(
    PatientFormEntity form,
    String creatorId,
    List<UsersEntity> doctors,
  ) {
    return PatientEntity(
      id: uuid.v4(),
      name: form.name,
      gender: Gender.values[form.gender],
      birthDate: form.birthDate,
      school: form.school,
      lrn: form.lrn,
      guardian: form.guardianName,
      guardianPhone: form.guardianPhone,
      creator: creatorId,
      doctor: shuffleDoctor(doctors).id,
      code: generateCode(form.name, form.birthDate),
      updatedAt: DateTime.now(),
      createdAt: DateTime.now(),
    );
  }

  factory PatientEntity.copyFromForm(
    PatientEntity patient,
    PatientFormEntity form,
  ) {
    return PatientEntity(
      id: patient.id,
      name: form.name,
      gender: Gender.values[form.gender],
      birthDate: form.birthDate,
      school: form.school,
      lrn: form.lrn,
      guardian: form.guardianName,
      guardianPhone: form.guardianPhone,
      creator: patient.creator,
      doctor: patient.doctor,
      code: generateCode(form.name, form.birthDate),
      updatedAt: patient.updatedAt,
      createdAt: patient.createdAt,
    );
  }
}
