import 'package:appwrite/appwrite.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:otoscopia/src/core/core.dart';
import 'package:otoscopia/src/features/authentication/authentication.dart';
import 'package:otoscopia/src/features/doctor/doctor.dart';

class PostRemarkNotifier extends StateNotifier<void> {
  final StateNotifierProviderRef<PostRemarkNotifier, void> ref;
  PostRemarkNotifier(this.ref) : super(null);

  static final _source = PostRemarkDataSource();
  static final _repository = PostRemarkRepositoryImpl(_source);

  Future<void> postRemark(
    String remarks,
    DateTime? followUpDate,
    String id,
    RecordStatus status,
  ) async {
    final response =
        await ref.read(fetchDataProvider.notifier).getRemarks(id);
    final hasRemarks = response?.id.isNotEmpty ?? false;
    

    try {
      if (hasRemarks) {
        final entity = RemarksEntity(
          id: response!.id,
          remarks: remarks,
          screening: response.id,
          followUpDate: followUpDate,
        );
        _repository.updateRemark(entity, status);
      } else {
        final entity = RemarksEntity(id: id, remarks: remarks, screening: id, followUpDate: followUpDate);

        await _repository.postRemark(entity, status);
      }
    } on AppwriteException catch (e) {
      throw Exception(e.message);
    }
  }
}

final postRemarkProvider =
    StateNotifierProvider<PostRemarkNotifier, void>((ref) {
  return PostRemarkNotifier(ref);
});
