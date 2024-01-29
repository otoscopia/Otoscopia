import 'dart:typed_data';

abstract class FetchImageRepository {
  Future<List<Uint8List>> getImages(String path, List<String> ids);
}