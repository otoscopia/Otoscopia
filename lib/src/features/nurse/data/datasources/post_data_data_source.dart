import 'package:appwrite/appwrite.dart';

import 'package:otoscopia/src/config/config.dart';
import 'package:otoscopia/src/core/core.dart';

class PostDataDataSource {
  final Databases _databases;
  final Storage _storage;

  PostDataDataSource()
      : _databases = Databases(client),
        _storage = Storage(client);

  Future<void> postPatient(PatientEntity patient) async {
    try {
      await _databases.createDocument(
        databaseId: Env.database,
        collectionId: Env.patientCollection,
        data: patient.toMap(),
        documentId: patient.id,
      );
    } on AppwriteException catch (error) {
      throw Exception(error.message);
    }
  }

  Future<void> postScreening(ScreeningEntity screening) async {
    try {
      List<String> images = [];

      for (int i = 0; i < screening.images.length; i++) {
        final file = await _storage.createFile(
          fileId: ID.unique(),
          bucketId: Env.screeningBucket,
          file: InputFile.fromPath(
            path: screening.images[i],
            filename: screening.images[i].split("/").last,
            contentType: "image/jpeg",
          ),
        );

        images.add(file.$id);
      }

      final modified = screening.copyWith(images: images);

      await _databases.createDocument(
        databaseId: Env.database,
        collectionId: Env.screeningCollection,
        documentId: screening.id,
        data: modified.toMap(),
      );
    } on AppwriteException catch (error) {
      throw Exception(error.message);
    }
  }
}
