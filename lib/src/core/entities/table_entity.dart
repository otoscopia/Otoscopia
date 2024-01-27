// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:otoscopia/src/core/core.dart';

class TableEntity {
  final PatientEntity patient;
  final AssignmentEntity assignment;
  final ScreeningEntity screening;
  TableEntity({
    required this.patient,
    required this.assignment,
    required this.screening,
  });

  TableEntity copyWith({
    PatientEntity? patient,
    AssignmentEntity? assignment,
    ScreeningEntity? screening,
  }) {
    return TableEntity(
      patient: patient ?? this.patient,
      assignment: assignment ?? this.assignment,
      screening: screening ?? this.screening,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'patient': patient.toMap(),
      'assignment': assignment.toMap(),
      'screening': screening.toMap(),
    };
  }

  factory TableEntity.fromMap(Map<String, dynamic> map) {
    return TableEntity(
      patient: PatientEntity.fromMap(map['patient'] as Map<String, dynamic>),
      assignment:
          AssignmentEntity.fromMap(map['assignment'] as Map<String, dynamic>),
      screening:
          ScreeningEntity.fromMap(map['screening'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory TableEntity.fromJson(String source) =>
      TableEntity.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'TableEntity(patient: $patient, assignment: $assignment, screening: $screening)';

  @override
  bool operator ==(covariant TableEntity other) {
    if (identical(this, other)) return true;

    return other.patient == patient &&
        other.assignment == assignment &&
        other.screening == screening;
  }

  @override
  int get hashCode =>
      patient.hashCode ^ assignment.hashCode ^ screening.hashCode;
}
