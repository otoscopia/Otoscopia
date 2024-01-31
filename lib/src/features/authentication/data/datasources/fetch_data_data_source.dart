import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';

import 'package:otoscopia/src/config/config.dart';
import 'package:otoscopia/src/core/core.dart';

class FetchDataDataSource {
  final Databases _databases;

  FetchDataDataSource() : _databases = Databases(client);

  Future<DocumentList> getAssignments() async {
    try {
      DocumentList result = await _databases.listDocuments(
        databaseId: Env.database,
        collectionId: Env.assignmentCollection,
      );

      return result;
    } on AppwriteException catch (error) {
      throw Exception(error.message);
    }
  }

  Future<DocumentList> getPatients() async {
    try {
      DocumentList result = await _databases.listDocuments(
        databaseId: Env.database,
        collectionId: Env.patientCollection,
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

  Future<DocumentList> getSchools() async {
    try {
      DocumentList result = await _databases.listDocuments(
        databaseId: Env.database,
        collectionId: Env.schoolCollection,
      );

      return result;
    } on AppwriteException catch (error) {
      throw Exception(error.message);
    }
  }

  Future<DocumentList> getScreenings() async {
    try {
      DocumentList result = await _databases.listDocuments(
        databaseId: Env.database,
        collectionId: Env.screeningCollection,
      );

      return result;
    } on AppwriteException catch (error) {
      throw Exception(error.message);
    }
  }

  Future<DocumentList> getRemarks(String screeningId) async {
    try {
      DocumentList result = await _databases.listDocuments(
        databaseId: Env.database,
        collectionId: Env.remarksCollection,
        queries: [Query.equal('screening', screeningId)],
      );

      return result;
    } on AppwriteException catch (error) {
      throw Exception(error.message);
    }
  }
}
