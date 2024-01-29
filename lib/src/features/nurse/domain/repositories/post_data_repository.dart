import 'package:otoscopia/src/core/core.dart';

abstract class PostDataRepository {
  Future<void> postPatient(PatientEntity patient);
  Future<void> postScreening(ScreeningEntity screening);
}
