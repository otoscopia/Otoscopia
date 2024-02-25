import 'package:appwrite/appwrite.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:otoscopia/src/config/config.dart';
import 'package:otoscopia/src/core/core.dart';

class PostDataDataSource {
  final Databases _databases;
  final Storage _storage;

  PostDataDataSource()
      : _databases = Databases(client),
        _storage = Storage(client);

  Future<void> postPatient(bool connection, PatientEntity patient) async {
    try {
      if (connection) {
        await _databases.createDocument(
          databaseId: Env.database,
          collectionId: Env.patientCollection,
          data: patient.toMap(),
          documentId: patient.id,
        );
      } else {
        final patientBox = Hive.box<PatientModel>(kPatientHiveBox);
        patientBox.add(PatientModel.fromEntity(patient));
      }
    } on AppwriteException catch (error) {
      throw Exception(error.message);
    }
  }

  Future<void> postScreening(bool connection, ScreeningEntity screening) async {
    final bucketId = Env.screeningBucket;
    try {
      if (connection) {
        List<String> images = [];

        for (int i = 0; i < screening.images.length; i++) {
          final fileName = screening.images[i].split("\\").last;
          final file = await _storage.createFile(
            fileId: ID.unique(),
            bucketId: bucketId,
            file: InputFile.fromPath(
              path: screening.images[i],
              filename: fileName,
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
      } else {
        final screeningBox = Hive.box<ScreeningModel>(kScreeningHiveBox);
        screeningBox.add(ScreeningModel.fromEntity(screening));
      }
    } on AppwriteException catch (error) {
      throw Exception(error.message);
    }
  }
}
