import 'package:otoscopia/src/core/core.dart';

abstract class PostRemarkRepository {
  Future<void> postRemark(RemarksEntity remark);
}
