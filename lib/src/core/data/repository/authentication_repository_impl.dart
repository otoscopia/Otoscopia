import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';

import 'package:otoscopia/src/config/config.dart';
import 'package:otoscopia/src/core/core.dart';
import 'package:otoscopia/src/features/authentication/authentication.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  final Databases _database;
  final AuthenticationDataSource _source;

  AuthenticationRepositoryImpl(this._source) : _database = Databases(client);

  @override
  Future<UserEntity> login(SignInFormEntity form) async {
    try {
      List response = await _source.login(form);
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
  Future<bool> signUp(SignUpFormEntity form) {
    try {
      return _source.signUp(form);
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
