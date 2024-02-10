import 'package:otoscopia/src/core/core.dart';

abstract class FetchDataRepository {
  Future<List<SchoolEntity>> getSchools();

  Future<List<AssignmentEntity>> getAssignments();

  Future<List<AssignmentEntity>> getAssignmentsByNurse(String user);

  Future<List<PatientEntity>> getPatientsBySchools(List<String> schools);

  Future<List<PatientEntity>> getPatientsByDoctor(String id);

  Future<List<UsersEntity>> getDoctors();

  Future<List<UsersEntity>> getNurses();

  Future<List<ScreeningEntity>> getScreeningsByPatient(List<String> patients);

  Future<RemarksEntity?> getRemarksByScreening(String screening);
}
