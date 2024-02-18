import 'package:appwrite/appwrite.dart';

import 'package:otoscopia/src/config/config.dart';
import 'package:otoscopia/src/core/core.dart';

class PostRemarkDataSource {
  final Databases _database;

  PostRemarkDataSource() : _database = Databases(client);

  Future<void> postRemark(RemarksEntity remarks, RecordStatus status) async {
    try {
      await _database.createDocument(
        databaseId: Env.database,
        collectionId: Env.remarksCollection,
        documentId: remarks.id,
        data: remarks.toMap(),
      );

      await updateScreening(remarks.screening, status.toString());
    } on AppwriteException catch (e) {
      throw Exception(e.message);
    }
  }

  Future<void> updateScreening(String id, String status) async {
    await _database.updateDocument(
      databaseId: Env.database,
      collectionId: Env.screeningCollection,
      documentId: id,
      data: {'status': status},
    );
  }

  Future<void> updateRemark(RemarksEntity remarks, RecordStatus status) async {
    try {
      await _database.updateDocument(
        databaseId: Env.database,
        collectionId: Env.remarksCollection,
        documentId: remarks.id,
        data: remarks.toMap(),
      );

      await updateScreening(remarks.screening, status.toString());
    } on AppwriteException catch (e) {
      throw Exception(e.message);
    }
  }
}
