import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';

import 'package:otoscopia/config/config.dart';

class AuthenticationDataSource {
  final Account _account;

  AuthenticationDataSource() : _account = Account(client);

  Future<List> login(String email, String password) async {
    try {
      Session session = await _account.createEmailSession(email: email, password: password);
      User user = await _account.get();

      return [session, user];
    } on AppwriteException catch (error) {
      throw Exception(error.message);
    }
  }

  Future<void> logout(String sessionId) async {
    try {
      await _account.deleteSession(sessionId: sessionId);
    } on AppwriteException catch (error) {
      throw Exception(error.message);
    }
  }
}
