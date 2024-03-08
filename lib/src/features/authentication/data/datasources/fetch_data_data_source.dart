import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';

import 'package:otoscopia/src/config/config.dart';
import 'package:otoscopia/src/core/core.dart';

class FetchDataDataSource {
  final Databases _databases;

  FetchDataDataSource() : _databases = Databases(client);

  Future<DocumentList> getSchools() async {
    try {
      DocumentList result = await _databases.listDocuments(
        databaseId: Env.database,
        collectionId: Env.schoolCollection,
        queries: [
          Query.limit(100),
          Query.equal('isActive', true),
        ],
      );

      return result;
    } on AppwriteException catch (error) {
      throw Exception(error.message);
    }
  }

  Future<DocumentList> getUnAssignedSchools() async {
    try {
      DocumentList result = await _databases.listDocuments(
        databaseId: Env.database,
        collectionId: Env.schoolCollection,
        queries: [
          Query.limit(100),
          Query.equal('isAssigned', false),
          Query.equal('isActive', true),
        ],
      );

      return result;
    } on AppwriteException catch (error) {
      throw Exception(error.message);
    }
  }

  Future<DocumentList> getAssignments() async {
    try {
      DocumentList result = await _databases.listDocuments(
        databaseId: Env.database,
        collectionId: Env.assignmentCollection,
        queries: [Query.limit(100)],
      );

      return result;
    } on AppwriteException catch (error) {
      throw Exception(error.message);
    }
  }

  Future<DocumentList> getAssignmentsByNurse(String id) async {
    try {
      DocumentList result = await _databases.listDocuments(
        databaseId: Env.database,
        collectionId: Env.assignmentCollection,
        queries: [Query.equal("nurse", id)],
      );

      return result;
    } on AppwriteException catch (error) {
      throw Exception(error.message);
    }
  }

  Future<DocumentList> getPatientsBySchools(List<String> schools) async {
    try {
      DocumentList result = await _databases.listDocuments(
        databaseId: Env.database,
        collectionId: Env.patientCollection,
        queries: [
          if (schools.isNotEmpty) Query.equal('school', schools),
          Query.limit(100)
        ],
      );

      return result;
    } on AppwriteException catch (error) {
      throw Exception(error.message);
    }
  }

  Future<DocumentList> getPatientsByDoctor(String id) async {
    try {
      DocumentList result = await _databases.listDocuments(
        databaseId: Env.database,
        collectionId: Env.patientCollection,
        queries: [Query.equal('doctor', id), Query.limit(100)],
      );

      return result;
    } on AppwriteException catch (error) {
      throw Exception(error.message);
    }
  }

  Future<DocumentList> getDoctors() async {
    try {
      DocumentList result = await _databases.listDocuments(
        databaseId: Env.database,
        collectionId: Env.userCollection,
        queries: [Query.equal('role', 'doctor'), Query.limit(100)],
      );

      return result;
    } on AppwriteException catch (error) {
      throw Exception(error.message);
    }
  }

  Future<DocumentList> getNurses() async {
    try {
      DocumentList result = await _databases.listDocuments(
        databaseId: Env.database,
        collectionId: Env.userCollection,
        queries: [Query.equal('role', 'nurse'), Query.limit(100)],
      );

      return result;
    } on AppwriteException catch (error) {
      throw Exception(error.message);
    }
  }

  Future<DocumentList> getScreeningsByPatient(List<String> patients) async {
    try {
      DocumentList result = await _databases.listDocuments(
        databaseId: Env.database,
        collectionId: Env.screeningCollection,
        queries: [
          if (patients.isNotEmpty) Query.equal('patient', patients),
          Query.limit(100)
        ],
      );

      return result;
    } on AppwriteException catch (error) {
      throw Exception(error.message);
    }
  }

  Future<DocumentList> getRemarksByPatients(List<String> screening) async {
    try {
      DocumentList result = await _databases.listDocuments(
        databaseId: Env.database,
        collectionId: Env.remarksCollection,
        queries: [
          if (screening.isNotEmpty) Query.equal('screening', screening),
          Query.limit(100)
        ],
      );

      return result;
    } on AppwriteException catch (error) {
      throw Exception(error.message);
    }
  }

  Future<DocumentList> getScreeningsByPatientId(String patient) async {
    try {
      DocumentList result = await _databases.listDocuments(
        databaseId: Env.database,
        collectionId: Env.screeningCollection,
        queries: [
          Query.equal('patient', patient),
          Query.limit(100)
        ],
      );

      return result;
    } on AppwriteException catch (error) {
      throw Exception(error.message);
    }
  }

  Future<DocumentList> getRemarksByScreening(String screening) async {
    try {
      DocumentList result = await _databases.listDocuments(
        databaseId: Env.database,
        collectionId: Env.remarksCollection,
        queries: [Query.equal('screening', screening), Query.limit(100)],
      );

      return result;
    } on AppwriteException catch (error) {
      throw Exception(error.message);
    }
  }
}
