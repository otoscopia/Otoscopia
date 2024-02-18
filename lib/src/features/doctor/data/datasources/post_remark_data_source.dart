import 'package:appwrite/appwrite.dart';

import 'package:otoscopia/src/config/config.dart';
import 'package:otoscopia/src/core/core.dart';

class PostRemarkDataSource {
  final Databases _database;

  PostRemarkDataSource() : _database = Databases(client);

  Future<void> postRemark(RemarksEntity remarks) async {
    try {
      await _database.createDocument(
        databaseId: Env.database,
        collectionId: Env.remarksCollection,
        documentId: remarks.id,
        data: remarks.toMap(),
      );
    } on AppwriteException catch (e) {
      throw Exception(e.message);
    }
  }
}
