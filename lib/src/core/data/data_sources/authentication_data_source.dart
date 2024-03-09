import 'dart:convert';

import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';

import 'package:otoscopia/src/config/config.dart';
import 'package:otoscopia/src/core/core.dart';
import 'package:otoscopia/src/features/authentication/authentication.dart';

class AuthenticationDataSource {
  final Account _account;
  final Functions _function;

  AuthenticationDataSource()
      : _account = Account(client),
        _function = Functions(client);

  Future<List> login(SignInFormEntity form) async {
    try {
      Session session = await _account.createEmailSession(
        email: form.email,
        password: form.password,
      );
      User user = await _account.get();

      final verified = user.emailVerification && user.phoneVerification;

      if (!verified) {
        throw Exception(kAccountNotVerified);
      }

      return [session, user];
    } on AppwriteException catch (error) {
      throw Exception(error.message);
    }
  }

  Future<List> getUser(String sessionId) async {
    try {
      final session = await _account.getSession(sessionId: sessionId);
      final user = await _account.get();
      return [session, user];
    } on AppwriteException catch (error) {
      throw Exception(error.message);
    }
  }

  Future<bool> signUp(SignUpFormEntity form) async {
    try {
      final user = await _account.create(
        email: form.email,
        password: form.password,
        name: form.name,
        userId: ID.unique(),
      );

      await _function.createExecution(
        functionId: Env.accountCreation,
        body: json.encode(form.toMap(user.$id)),
        path: '/',
        method: 'POST',
      );

      return true;
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
