import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';

import 'package:otoscopia/config/config.dart';
import 'package:otoscopia/core/core.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  final Databases _database;
  final AuthenticationDataSource _source;

  AuthenticationRepositoryImpl(this._source) : _database = Databases(client);

  @override
  Future<UserEntity> login(String email, String password) async {
    try {
      List response = await _source.login(email, password);
      Session session = response[0];
      User user = response[1];

      Document result = await _database.getDocument(
        databaseId: Env.database,
        collectionId: Env.userCollection,
        documentId: user.$id,
      );

      return UserEntity.fromMap(result.data, session.$id);
    } on AppwriteException catch (error) {
      throw Exception(error.message);
    } on Exception catch (error) {
      throw Exception(error.toString());
    }
  }

  @override
  Future<void> logout(String sessionId) {
    return _source.logout(sessionId);
  }
}
