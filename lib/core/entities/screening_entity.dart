// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:collection/collection.dart';

import 'package:otoscopia/core/core.dart';

class ScreeningEntity {
  final String id;
  final String patient;
  final String assignment;
  final String historyOfIllness;
  final String remarks;
  final double temperature;
  final double weight;
  final double height;
  final bool similarCondition;
  final String chiefComplaint;
  final String chiefComplaintRemarks;
  final bool allergy;
  final String allergyRemarks;
  final bool undergoneSurgery;
  final String undergoneSurgeryRemarks;
  final bool medication;
  final String medicationRemarks;
  final List<String> images;
  final DateTime createdAt;
  final DateTime updatedAt;
  final RecordStatus status;

  ScreeningEntity({
    required this.id,
    required this.patient,
    required this.assignment,
    required this.historyOfIllness,
    required this.remarks,
    required this.temperature,
    required this.weight,
    required this.height,
    required this.similarCondition,
    required this.chiefComplaint,
    required this.chiefComplaintRemarks,
    required this.allergy,
    required this.allergyRemarks,
    required this.undergoneSurgery,
    required this.undergoneSurgeryRemarks,
    required this.medication,
    required this.medicationRemarks,
    required this.images,
    required this.createdAt,
    required this.updatedAt,
    required this.status,
  });

  ScreeningEntity copyWith({
    String? id,
    String? patient,
    String? assignment,
    String? historyOfIllness,
    String? remarks,
    double? temperature,
    double? weight,
    double? height,
    bool? similarCondition,
    String? chiefComplaint,
    String? chiefComplaintRemarks,
    bool? allergy,
    String? allergyRemarks,
    bool? undergoneSurgery,
    String? undergoneSurgeryRemarks,
    bool? medication,
    String? medicationRemarks,
    List<String>? images,
    DateTime? createdAt,
    DateTime? updatedAt,
    RecordStatus? status,
  }) {
    return ScreeningEntity(
      id: id ?? this.id,
      patient: patient ?? this.patient,
      assignment: assignment ?? this.assignment,
      historyOfIllness: historyOfIllness ?? this.historyOfIllness,
      remarks: remarks ?? this.remarks,
      temperature: temperature ?? this.temperature,
      weight: weight ?? this.weight,
      height: height ?? this.height,
      similarCondition: similarCondition ?? this.similarCondition,
      chiefComplaint: chiefComplaint ?? this.chiefComplaint,
      chiefComplaintRemarks:
          chiefComplaintRemarks ?? this.chiefComplaintRemarks,
      allergy: allergy ?? this.allergy,
      allergyRemarks: allergyRemarks ?? this.allergyRemarks,
      undergoneSurgery: undergoneSurgery ?? this.undergoneSurgery,
      undergoneSurgeryRemarks:
          undergoneSurgeryRemarks ?? this.undergoneSurgeryRemarks,
      medication: medication ?? this.medication,
      medicationRemarks: medicationRemarks ?? this.medicationRemarks,
      images: images ?? this.images,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      status: status ?? this.status,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'patient': patient,
      'assignment': assignment,
      'historyOfIllness': historyOfIllness,
      'remarks': remarks,
      'temperature': temperature,
      'weight': weight,
      'height': height,
      'similarCondition': similarCondition,
      'chiefComplaint': chiefComplaint,
      'chiefComplaintRemarks': chiefComplaintRemarks,
      'allergy': allergy,
      'allergyRemarks': allergyRemarks,
      'undergoneSurgery': undergoneSurgery,
      'undergoneSurgeryRemarks': undergoneSurgeryRemarks,
      'medication': medication,
      'medicationRemarks': medicationRemarks,
      'images': images,
      'createdAt': createdAt.millisecondsSinceEpoch,
      'updatedAt': updatedAt.millisecondsSinceEpoch,
      'status': status.toString(),
    };
  }

  factory ScreeningEntity.fromMap(Map<String, dynamic> map) {
    RecordStatus status = map['status'] == 'RecordStatus.pending'
        ? RecordStatus.pending
        : map['status'] == 'RecordStatus.followUp'
            ? RecordStatus.followUp
            : map['status'] == 'RecordStatus.medicalAttention'
                ? RecordStatus.medicalAttention
                : RecordStatus.resolved;

    return ScreeningEntity(
      id: map['id'] as String,
      patient: map['patient'] as String,
      assignment: map['assignment'] as String,
      historyOfIllness: map['historyOfIllness'] as String,
      remarks: map['remarks'] as String,
      temperature: map['temperature'] as double,
      weight: map['weight'] as double,
      height: map['height'] as double,
      similarCondition: map['similarCondition'] as bool,
      chiefComplaint: map['chiefComplaint'] as String,
      chiefComplaintRemarks: map['chiefComplaintRemarks'] as String,
      allergy: map['allergy'] as bool,
      allergyRemarks: map['allergyRemarks'] as String,
      undergoneSurgery: map['undergoneSurgery'] as bool,
      undergoneSurgeryRemarks: map['undergoneSurgeryRemarks'] as String,
      medication: map['medication'] as bool,
      medicationRemarks: map['medicationRemarks'] as String,
      images: List<String>.from((map['images'] as List<String>)),
      createdAt: DateTime.fromMillisecondsSinceEpoch(map['createdAt'] as int),
      updatedAt: DateTime.fromMillisecondsSinceEpoch(map['updatedAt'] as int),
      status: status,
    );
  }

  String toJson() => json.encode(toMap());

  factory ScreeningEntity.fromJson(String source) =>
      ScreeningEntity.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ScreeningEntity(id: $id, patient: $patient, assignment: $assignment, historyOfIllness: $historyOfIllness, remarks: $remarks, temperature: $temperature, weight: $weight, height: $height, similarCondition: $similarCondition, chiefComplaint: $chiefComplaint, chiefComplaintRemarks: $chiefComplaintRemarks, allergy: $allergy, allergyRemarks: $allergyRemarks, undergoneSurgery: $undergoneSurgery, undergoneSurgeryRemarks: $undergoneSurgeryRemarks, medication: $medication, medicationRemarks: $medicationRemarks, images: $images, createdAt: $createdAt, updatedAt: $updatedAt, status: $status)';
  }

  @override
  bool operator ==(covariant ScreeningEntity other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return other.id == id &&
        other.patient == patient &&
        other.assignment == assignment &&
        other.historyOfIllness == historyOfIllness &&
        other.remarks == remarks &&
        other.temperature == temperature &&
        other.weight == weight &&
        other.height == height &&
        other.similarCondition == similarCondition &&
        other.chiefComplaint == chiefComplaint &&
        other.chiefComplaintRemarks == chiefComplaintRemarks &&
        other.allergy == allergy &&
        other.allergyRemarks == allergyRemarks &&
        other.undergoneSurgery == undergoneSurgery &&
        other.undergoneSurgeryRemarks == undergoneSurgeryRemarks &&
        other.medication == medication &&
        other.medicationRemarks == medicationRemarks &&
        listEquals(other.images, images) &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt &&
        other.status == status;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        patient.hashCode ^
        assignment.hashCode ^
        historyOfIllness.hashCode ^
        remarks.hashCode ^
        temperature.hashCode ^
        weight.hashCode ^
        height.hashCode ^
        similarCondition.hashCode ^
        chiefComplaint.hashCode ^
        chiefComplaintRemarks.hashCode ^
        allergy.hashCode ^
        allergyRemarks.hashCode ^
        undergoneSurgery.hashCode ^
        undergoneSurgeryRemarks.hashCode ^
        medication.hashCode ^
        medicationRemarks.hashCode ^
        images.hashCode ^
        createdAt.hashCode ^
        updatedAt.hashCode ^
        status.hashCode;
  }
}
