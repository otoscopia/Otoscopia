// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:otoscopia/src/core/core.dart';

class TableEntity {
  final PatientEntity patient;
  final ScreeningEntity screening;
  final RemarksEntity? remarks;

  TableEntity({
    required this.patient,
    required this.screening,
    this.remarks,
  });

  TableEntity copyWith({
    PatientEntity? patient,
    ScreeningEntity? screening,
    RemarksEntity? remarks,
  }) {
    return TableEntity(
      patient: patient ?? this.patient,
      screening: screening ?? this.screening,
      remarks: remarks ?? this.remarks,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'patient': patient.toMap(),
      'screening': screening.toMap(),
      'remarks': remarks?.toMap(),
    };
  }

  factory TableEntity.fromMap(Map<String, dynamic> map) {
    return TableEntity(
      patient: PatientEntity.fromMap(map['patient'] as Map<String, dynamic>),
      screening:
          ScreeningEntity.fromMap(map['screening'] as Map<String, dynamic>),
      remarks: map['remarks'] != null
          ? RemarksEntity.fromMap(map['remarks'] as Map<String, dynamic>)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory TableEntity.fromJson(String source) =>
      TableEntity.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'TableEntity(patient: $patient, screening: $screening, remarks: $remarks)';

  @override
  bool operator ==(covariant TableEntity other) {
    if (identical(this, other)) return true;

    return other.patient == patient &&
        other.screening == screening &&
        other.remarks == remarks;
  }

  @override
  int get hashCode => patient.hashCode ^ screening.hashCode ^ remarks.hashCode;
}
