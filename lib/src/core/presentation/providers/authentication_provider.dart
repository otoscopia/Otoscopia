import 'package:appwrite/appwrite.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:otoscopia/src/core/core.dart';
import 'package:otoscopia/src/features/authentication/authentication.dart';

class AuthenticationNotifier extends StateNotifier<bool> {
  final StateNotifierProviderRef<AuthenticationNotifier, bool> ref;
  AuthenticationNotifier(this.ref) : super(false);

  static final AuthenticationDataSource _source = AuthenticationDataSource();
  final AuthenticationRepository _repository =
      AuthenticationRepositoryImpl(_source);

  Future<UserEntity> login(SignInFormEntity form) async {
    try {
      UserEntity user = await _repository.login(form);
      state = true;
      ref.read(userProvider.notifier).setUser(user);
      return user;
    } on AppwriteException catch (error) {
      throw Exception(error.message);
    }
  }

  Future<bool> signUp(
    SignUpFormEntity form,
  ) async {
    try {
      await _repository.signUp(form);
      return true;
    } on AppwriteException catch (error) {
      throw Exception(error.message);
    }
  }

  Future<void> logout() async {
    UserEntity user = ref.read(userProvider);
    try {
      await _repository.logout(user.sessionId);
      state = false;
      ref.read(userProvider.notifier).setUser(UserEntity.initial());
    } on AppwriteException catch (error) {
      throw Exception(error.message);
    } catch (error) {
      throw Exception(error.toString());
    }
  }
}

final authenticationProvider =
    StateNotifierProvider<AuthenticationNotifier, bool>(
  (ref) => AuthenticationNotifier(ref),
);
