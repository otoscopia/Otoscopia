import 'package:flutter/services.dart';

import 'package:otoscopia/src/core/core.dart';
import 'package:otoscopia/src/features/doctor/doctor.dart';

class PostRemarkUseCase {
  final PostRemarkRepository _repository;

  PostRemarkUseCase(this._repository);

  Future<void> postRemark(RemarksEntity remarks, List<Uint8List> bytes, List<String> names) async {
    return await _repository.postRemark(remarks, bytes, names);
  }

  Future<bool> referDoctor(String id, String doctor) async {
    return await _repository.referDoctor(id, doctor);
  }
}