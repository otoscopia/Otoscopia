import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';

import 'package:otoscopia/src/core/core.dart';
import 'package:otoscopia/src/features/authentication/authentication.dart';

class FetchDataRepositoryImpl implements FetchDataRepository {
  final FetchDataDataSource _source;

  FetchDataRepositoryImpl(this._source);
  @override
  Future<List<AssignmentEntity>> getAssignments(UserEntity user) async {
    List<AssignmentEntity> assignments;
    try {
      DocumentList result = await _source.getAssignments();
      assignments = result.documents
          .map((e) => AssignmentEntity.fromMap(e.data))
          .toList();

      if (user.role == UserRole.nurse) {
        return assignments
            .where((element) => element.nurse == user.id)
            .toList();
      }

      return assignments;
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
  Future<List<PatientEntity>> getPatients() async {
    try {
      DocumentList result = await _source.getPatients();
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
  Future<List<ScreeningEntity>> getScreenings() async {
    try {
      DocumentList result = await _source.getScreenings();
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
  Future<RemarksEntity?> getRemarks(String screeningId) async {
    try {
      DocumentList result = await _source.getRemarks(screeningId);
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
