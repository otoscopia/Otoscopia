import 'package:otoscopia/src/core/core.dart';

abstract class PostDataRepository {
  Future<void> postPatient(bool connection, PatientEntity patient);
  Future<void> postScreening(bool connection, ScreeningEntity screening);
}
