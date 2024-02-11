import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';

import 'package:otoscopia/src/core/core.dart';
import 'package:otoscopia/src/features/authentication/authentication.dart';

class FetchDataRepositoryImpl implements FetchDataRepository {
  final FetchDataDataSource _source;

  FetchDataRepositoryImpl(this._source);

  @override
  Future<List<SchoolEntity>> getSchools() async {
    try {
      DocumentList result = await _source.getSchools();
      final schools =
          result.documents.map((e) => SchoolEntity.fromMap(e.data)).toList();

      return schools;
    } on AppwriteException catch (error) {
      throw Exception(error.message);
    } on Exception catch (error) {
      throw Exception(error.toString());
    }
  }

  @override
  Future<List<AssignmentEntity>> getAssignments() async {
    List<AssignmentEntity> assignments;
    try {
      DocumentList result = await _source.getAssignments();
      assignments = result.documents
          .map((e) => AssignmentEntity.fromMap(e.data))
          .toList();

      return assignments;
    } on AppwriteException catch (error) {
      throw Exception(error.message);
    } on Exception catch (error) {
      throw Exception(error.toString());
    }
  }

  @override
  Future<List<AssignmentEntity>> getAssignmentsByNurse(String user) async {
    List<AssignmentEntity> assignments;
    try {
      DocumentList result = await _source.getAssignmentsByNurse(user);
      assignments = result.documents
          .map((e) => AssignmentEntity.fromMap(e.data))
          .toList();

      return assignments;
    } on AppwriteException catch (error) {
      throw Exception(error.message);
    } on Exception catch (error) {
      throw Exception(error.toString());
    }
  }

  @override
  Future<List<PatientEntity>> getPatientsBySchools(List<String> schools) async {
    try {
      DocumentList result = await _source.getPatientsBySchools(schools);
      final patients =
          result.documents.map((e) => PatientEntity.fromMap(e.data)).toList();

      return patients;
    } on AppwriteException catch (error) {
      throw Exception(error.message);
    } on Exception catch (error) {
      throw Exception(error.toString());
    }
  }

  @override
  Future<List<PatientEntity>> getPatientsByDoctor(String id) async {
    try {
      DocumentList result = await _source.getPatientsByDoctor(id);
      final patients =
          result.documents.map((e) => PatientEntity.fromMap(e.data)).toList();

      return patients;
    } on AppwriteException catch (error) {
      throw Exception(error.message);
    } on Exception catch (error) {
      throw Exception(error.toString());
    }
  }

  @override
  Future<List<UsersEntity>> getDoctors() async {
    try {
      DocumentList result = await _source.getDoctors();
      final doctors =
          result.documents.map((e) => UsersEntity.fromMap(e.data)).toList();

      return doctors;
    } on AppwriteException catch (error) {
      throw Exception(error.message);
    } on Exception catch (error) {
      throw Exception(error.toString());
    }
  }

  @override
  Future<List<UsersEntity>> getNurses() async {
    try {
      DocumentList result = await _source.getNurses();
      final nurses =
          result.documents.map((e) => UsersEntity.fromMap(e.data)).toList();

      return nurses;
    } on AppwriteException catch (error) {
      throw Exception(error.message);
    } on Exception catch (error) {
      throw Exception(error.toString());
    }
  }

  @override
  Future<List<ScreeningEntity>> getScreeningsByPatient(List<String> patients) async {
    try {
      DocumentList result = await _source.getScreeningsByPatient(patients);
      final screenings =
          result.documents.map((e) => ScreeningEntity.fromMap(e.data)).toList();

      return screenings;
    } on AppwriteException catch (error) {
      throw Exception(error.message);
    } on Exception catch (error) {
      throw Exception(error.toString());
    }
  }

  @override
  Future<RemarksEntity?> getRemarksByScreening(String screening) async {
    try {
      DocumentList result = await _source.getRemarksByScreening(screening);
      final remarks =
          result.documents.map((e) => RemarksEntity.fromMap(e.data)).toList();

      if (remarks.isEmpty) {
        return null;
      }

      return remarks.first;
    } on AppwriteException catch (error) {
      throw Exception(error.message);
    } on Exception catch (error) {
      throw Exception(error.toString());
    }
  }
}
