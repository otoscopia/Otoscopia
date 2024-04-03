import 'package:flutter/services.dart';

import 'package:appwrite/appwrite.dart';

import 'package:otoscopia/src/core/core.dart';
import 'package:otoscopia/src/features/doctor/doctor.dart';

class PostRemarkRepositoryImpl implements PostRemarkRepository {
  final PostRemarkDataSource _source;

  PostRemarkRepositoryImpl(this._source);

  @override
  Future<void> postRemark(RemarksEntity remark, List<Uint8List> bytes, List<String> names) async {
    try {
      return await _source.postRemark(remark, bytes, names);
    } on AppwriteException catch (e) {
      throw Exception(e.message);
    }
  }

  @override
  Future<bool> referDoctor(String id, String doctor) async {
    try {
      return await _source.referDoctor(id, doctor);
    } on AppwriteException catch (e) {
      throw Exception(e.message);
    }
  }
}
