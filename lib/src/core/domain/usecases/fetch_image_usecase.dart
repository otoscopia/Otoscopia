import 'dart:typed_data';

import 'package:otoscopia/src/core/core.dart';

class FetchImageUseCase {
  final FetchImageRepository _fetchImageRepository;

  FetchImageUseCase(this._fetchImageRepository);

  Future<List<Uint8List>> getImages(String path, List<String> ids) async {
    return await _fetchImageRepository.getImages(path, ids);
  }

  Future<List<PrescriptionEntity>> getPrescription(List<String> ids) async {
    return await _fetchImageRepository.getPrescription(ids);
  }
}
