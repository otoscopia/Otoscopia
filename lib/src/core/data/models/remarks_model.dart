import 'package:hive_flutter/hive_flutter.dart';

import 'package:otoscopia/src/core/core.dart';

part 'remarks_model.g.dart';

@HiveType(typeId: 2)
class RemarksModel {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String remarks;

  @HiveField(2)
  final String screening;

  @HiveField(3)
  final String? location;

  @HiveField(4)
  final RecordStatusModel status;

  @HiveField(5)
  final DateTime? date;

  @HiveField(6)
  final DateTime? createdAt;

  RemarksModel({
    required this.id,
    required this.remarks,
    required this.screening,
    required this.status,
    this.location,
    this.date,
    this.createdAt,
  });

  factory RemarksModel.fromEntity(RemarksEntity entity) {
    final status = entity.status == RecordStatus.followUp
        ? RecordStatusModel.followUp
        : entity.status == RecordStatus.medicalAttention
            ? RecordStatusModel.medicalAttention
            : entity.status == RecordStatus.resolved
                ? RecordStatusModel.resolved
                : RecordStatusModel.pending;

    return RemarksModel(
      id: entity.id,
      remarks: entity.remarks ?? "",
      screening: entity.screening,
      status: status,
      location: entity.location,
      date: entity.date,
      createdAt: entity.createdAt,
    );
  }
}
