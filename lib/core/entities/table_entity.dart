// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:otoscopia/core/core.dart';

class TableEntity {
  final PatientEntity patient;
  final String status;
  TableEntity({
    required this.patient,
    required this.status,
  });

  TableEntity copyWith({
    PatientEntity? patient,
    String? status,
  }) {
    return TableEntity(
      patient: patient ?? this.patient,
      status: status ?? this.status,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'patient': patient.toMap(),
      'status': status,
    };
  }

  factory TableEntity.fromMap(Map<String, dynamic> map) {
    return TableEntity(
      patient: PatientEntity.fromMap(map['patient'] as Map<String, dynamic>),
      status: map['status'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory TableEntity.fromJson(String source) =>
      TableEntity.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'TableEntity(patient: $patient, status: $status)';

  @override
  bool operator ==(covariant TableEntity other) {
    if (identical(this, other)) return true;

    return other.patient == patient && other.status == status;
  }

  @override
  int get hashCode => patient.hashCode ^ status.hashCode;
}
