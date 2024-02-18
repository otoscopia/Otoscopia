import 'package:otoscopia/src/core/core.dart';

abstract class PostRemarkRepository {
  Future<void> postRemark(RemarksEntity remark, RecordStatus status);

  Future<void> updateRemark(RemarksEntity remark, RecordStatus status);
}
