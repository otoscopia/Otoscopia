import 'package:hive_flutter/hive_flutter.dart';

part 'school_model.g.dart';

@HiveType(typeId: 3)
class SchoolModel {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String abbr;

  @HiveField(3)
  final String code;

  @HiveField(4)
  final String address;

  @HiveField(5)
  final bool isActive;

  SchoolModel({
    required this.id,
    required this.name,
    required this.abbr,
    required this.code,
    required this.address,
    required this.isActive,
  });
}
