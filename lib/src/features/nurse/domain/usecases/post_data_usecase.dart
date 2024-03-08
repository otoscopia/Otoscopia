import 'package:otoscopia/src/core/core.dart';
import 'package:otoscopia/src/features/nurse/nurse.dart';

class PostDataUseCase {
  final PostDataRepository _repository;

  PostDataUseCase(this._repository);

  Future<void> postPatient(bool connection, PatientEntity patient) async {
    return await _repository.postPatient(connection, patient);
  }

  Future<void> postScreening(bool connection, ScreeningEntity screening) async {
    return await _repository.postScreening(connection, screening);
  }
}
