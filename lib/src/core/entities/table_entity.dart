// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:otoscopia/src/core/core.dart';

class TableEntity {
  final PatientEntity patient;
  final ScreeningEntity screening;
  TableEntity({
    required this.patient,
    required this.screening,
  });

  TableEntity copyWith({
    PatientEntity? patient,
    ScreeningEntity? screening,
  }) {
    return TableEntity(
      patient: patient ?? this.patient,
      screening: screening ?? this.screening,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'patient': patient.toMap(),
      'screening': screening.toMap(),
    };
  }

  factory TableEntity.fromMap(Map<String, dynamic> map) {
    return TableEntity(
      patient: PatientEntity.fromMap(map['patient'] as Map<String, dynamic>),
      screening:
          ScreeningEntity.fromMap(map['screening'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory TableEntity.fromJson(String source) =>
      TableEntity.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'TableEntity(patient: $patient, screening: $screening)';

  @override
  bool operator ==(covariant TableEntity other) {
    if (identical(this, other)) return true;

    return other.patient == patient && other.screening == screening;
  }

  @override
  int get hashCode => patient.hashCode ^ screening.hashCode;
}
