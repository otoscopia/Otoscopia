import 'package:appwrite/appwrite.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:otoscopia/src/core/core.dart';
import 'package:otoscopia/src/features/doctor/doctor.dart';

class PostRemarkNotifier extends StateNotifier<void> {
  PostRemarkNotifier() : super(null);

  static final _source = PostRemarkDataSource();
  static final _repository = PostRemarkRepositoryImpl(_source);

  Future<void> postRemark(
    String remarks,
    DateTime? followUpDate,
    String id,
    RecordStatus status,
  ) async {
    final entity = RemarksEntity(id: id, remarks: remarks, screening: id);

    try {
      await _repository.postRemark(entity, status);
    } on AppwriteException catch (e) {
      throw Exception(e.message);
    }
  }
}

final postRemarkProvider =
    StateNotifierProvider<PostRemarkNotifier, void>((ref) {
  return PostRemarkNotifier();
});
