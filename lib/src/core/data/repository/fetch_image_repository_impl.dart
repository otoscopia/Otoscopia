import 'dart:typed_data';

import 'package:otoscopia/src/core/core.dart';

class FetchImageRepositoryImpl implements FetchImageRepository {
  final FetchImageDataSource _source;

  FetchImageRepositoryImpl(this._source);

  @override
  Future<List<Uint8List>> getImages(String path, List<String> ids) async {
    return await _source.getImages(path, ids);
  }

  @override
  Future<List<PrescriptionEntity>> getPrescription(List<String> ids) async {
    return await _source.getPrescription(ids);
  }

  @override
  Future<void> downloadPrescription(PrescriptionEntity prescription) async {
    return await _source.downloadPrescription(prescription);
  }
}
