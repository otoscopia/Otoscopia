import 'package:appwrite/appwrite.dart';

import 'package:otoscopia/src/core/core.dart';
import 'package:otoscopia/src/features/doctor/doctor.dart';

class PostRemarkRepositoryImpl implements PostRemarkRepository {
  final PostRemarkDataSource _source;

  PostRemarkRepositoryImpl(this._source);

  @override
  Future<void> postRemark(RemarksEntity remark) async {
    try {
      return await _source.postRemark(remark);
    } on AppwriteException catch (e) {
      throw Exception(e.message);
    }
  }
}
