import 'dart:typed_data';

import 'package:otoscopia/src/core/core.dart';

abstract class FetchImageRepository {
  Future<List<Uint8List>> getImages(String path, List<String> ids);

  Future<List<PrescriptionEntity>> getPrescription(List<String> ids);

  Future<void> downloadPrescription(PrescriptionEntity prescription);
}