import 'package:flutter/services.dart';

class PrescriptionEntity {
  String id;
  String name;
  Uint8List image;

  PrescriptionEntity({
    required this.id,
    required this.name,
    required this.image,
  });
}
