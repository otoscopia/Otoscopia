import 'package:otoscopia/src/core/core.dart';
import 'package:otoscopia/src/features/doctor/doctor.dart';

class PostRemarkUseCase {
  final PostRemarkRepository _repository;

  PostRemarkUseCase(this._repository);

  Future<void> postRemark(RemarksEntity remarks, RecordStatus status) async {
    return await _repository.postRemark(remarks, status);
  }
}