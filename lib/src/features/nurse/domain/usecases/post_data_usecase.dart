import 'package:otoscopia/src/core/core.dart';
import 'package:otoscopia/src/features/nurse/nurse.dart';

class PostDataUseCase {
  final PostDataRepository _repository;

  PostDataUseCase(this._repository);

  Future<void> postPatient(PatientEntity patient) async {
    return await _repository.postPatient(patient);
  }

  Future<void> postScreening(ScreeningEntity screening) async {
    return await _repository.postScreening(screening);
  }
}
