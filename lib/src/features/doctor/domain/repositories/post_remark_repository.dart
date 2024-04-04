import 'package:flutter/services.dart';

import 'package:otoscopia/src/core/core.dart';

abstract class PostRemarkRepository {
  Future<void> postRemark(RemarksEntity remark, List<Uint8List> bytes, List<String> names);

  Future<bool> referDoctor(String id, String doctor);
}
