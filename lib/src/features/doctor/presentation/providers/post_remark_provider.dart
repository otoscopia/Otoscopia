import 'package:appwrite/appwrite.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:otoscopia/src/config/config.dart';
import 'package:otoscopia/src/core/core.dart';
import 'package:otoscopia/src/features/doctor/doctor.dart';

class PostRemarkNotifier extends StateNotifier<void> {
  final StateNotifierProviderRef<PostRemarkNotifier, void> ref;
  PostRemarkNotifier(this.ref) : super(null);

  static final _source = PostRemarkDataSource();
  static final _repository = PostRemarkRepositoryImpl(_source);

  Future<RemarksEntity> postRemark(
    String remarks,
    DateTime? date,
    String id,
    String? location,
    RecordStatus status,
  ) async {
    try {
      final entity = RemarksEntity(
        id: uuid.v4(),
        remarks: remarks,
        screening: id,
        date: date,
        location: location,
        status: status,
      );

      await _repository.postRemark(entity);

      return entity;
    } on AppwriteException catch (e) {
      throw Exception(e.message);
    }
  }
}

final postRemarkProvider =
    StateNotifierProvider<PostRemarkNotifier, void>((ref) {
  return PostRemarkNotifier(ref);
});
