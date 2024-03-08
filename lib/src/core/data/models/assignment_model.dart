import 'package:hive_flutter/hive_flutter.dart';

import 'package:otoscopia/src/core/core.dart';

part 'assignment_model.g.dart';

@HiveType(typeId: 0)
class AssignmentModel {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String nurse;

  @HiveField(2)
  final String school;

  @HiveField(3)
  final bool isActive;

  @HiveField(4)
  final DateTime createdAt;

  @HiveField(5)
  final DateTime updatedAt;

  AssignmentModel({
    required this.id,
    required this.nurse,
    required this.school,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
  });

  factory AssignmentModel.fromEntity(AssignmentEntity entity) {
    return AssignmentModel(
      id: entity.id,
      nurse: entity.nurse,
      school: entity.school,
      isActive: entity.isActive,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
    );
  }
}
