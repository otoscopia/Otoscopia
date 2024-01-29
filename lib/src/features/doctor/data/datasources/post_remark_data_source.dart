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

      await _database.updateDocument(
        databaseId: Env.database,
        collectionId: Env.screeningCollection,
        documentId: remarks.screening,
        data: {
          'status': status.toString(),
        },
      );
    } on AppwriteException catch (e) {
      throw Exception(e.message);
    }
  }
}
