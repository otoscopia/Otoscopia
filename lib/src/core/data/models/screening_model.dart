import 'package:hive_flutter/hive_flutter.dart';

import 'package:otoscopia/src/core/core.dart';

part 'screening_model.g.dart';

@HiveType(typeId: 4)
class ScreeningModel {
  
  @HiveField(0)
  final String id;
  
  @HiveField(1)
  final String patient;
  
  @HiveField(2)
  final String historyOfIllness;
  
  @HiveField(3)
  final String remarks;
  
  @HiveField(4)
  final double temperature;
  
  @HiveField(5)
  final double weight;
  
  @HiveField(6)
  final double height;
  
  @HiveField(7)
  final bool similarCondition;
  
  @HiveField(8)
  final List<bool> chiefComplaint;
  
  @HiveField(9)
  final String chiefComplaintRemarks;
  
  @HiveField(10)
  final bool allergy;
  
  @HiveField(11)
  final String allergyRemarks;
  
  @HiveField(12)
  final bool undergoneSurgery;
  
  @HiveField(13)
  final String undergoneSurgeryRemarks;
  
  @HiveField(14)
  final bool medication;
  
  @HiveField(15)
  final String medicationRemarks;
  
  @HiveField(16)
  final List<String> images;
  
  @HiveField(17)
  final DateTime createdAt;

  @HiveField(18)
  final DateTime updatedAt;

  ScreeningModel({
    required this.id,
    required this.patient,
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
  });

  factory ScreeningModel.fromEntity(ScreeningEntity entity) {
    return ScreeningModel(
      id: entity.id,
      patient: entity.patient,
      historyOfIllness: entity.historyOfIllness,
      remarks: entity.remarks,
      temperature: entity.temperature,
      weight: entity.weight,
      height: entity.height,
      similarCondition: entity.similarCondition,
      chiefComplaint: entity.chiefComplaint,
      chiefComplaintRemarks: entity.chiefComplaintRemarks,
      allergy: entity.allergy,
      allergyRemarks: entity.allergyRemarks,
      undergoneSurgery: entity.undergoneSurgery,
      undergoneSurgeryRemarks: entity.undergoneSurgeryRemarks,
      medication: entity.medication,
      medicationRemarks: entity.medicationRemarks,
      images: entity.images,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
    );
  }
}
