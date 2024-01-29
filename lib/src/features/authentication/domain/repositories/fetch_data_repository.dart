import 'package:otoscopia/src/core/core.dart';

abstract class FetchDataRepository {
  Future<List<AssignmentEntity>> getAssignments(UserEntity user);

  Future<List<PatientEntity>> getPatients();

  Future<List<UsersEntity>> getDoctors();

  Future<List<UsersEntity>> getNurses();

  Future<List<SchoolEntity>> getSchools();

  Future<List<ScreeningEntity>> getScreenings();
}
