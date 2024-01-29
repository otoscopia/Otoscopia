import 'dart:typed_data';

import 'package:appwrite/appwrite.dart';

import 'package:otoscopia/src/config/config.dart';
import 'package:otoscopia/src/core/core.dart';

class FetchImageDataSource {
  final Storage _storage;

  FetchImageDataSource() : _storage = Storage(client);

  Future<List<Uint8List>> getImages(String path, List<String> ids) async {
    final bucketId = Env.screeningBucket;
    final List<Uint8List> images = [];

    try {
      for (String id in ids) {
        final file = await _storage.getFile(bucketId: bucketId, fileId: id);

        if (file.name.toLowerCase().contains(path.toLowerCase())) {
          final result = await _storage.getFilePreview(
            bucketId: bucketId,
            fileId: id,
          );

          images.add(result);
        }
      }

      return images;
    } on AppwriteException catch (error) {
      throw Exception(error.message);
    } on Exception catch (error) {
      throw Exception(error.toString());
    }
  }
}
