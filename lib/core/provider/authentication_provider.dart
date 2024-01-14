import 'package:appwrite/appwrite.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:otoscopia/core/core.dart';

class AuthenticationNotifier extends StateNotifier<bool> {
  final StateNotifierProviderRef<AuthenticationNotifier, bool> ref;
  AuthenticationNotifier(this.ref) : super(false);

  static final AuthenticationDataSource _source = AuthenticationDataSource();
  final AuthenticationRepository _repository =
      AuthenticationRepositoryImpl(_source);

  Future<bool> login(String email, String password) async {
    try {
      UserEntity user = await _repository.login(email, password);
      state = true;
      ref.read(userProvider.notifier).setUser(user);
      return true;
    } on AppwriteException catch (error) {
      throw Exception(error.message);
    }
  }
}

final authenticationProvider =
    StateNotifierProvider<AuthenticationNotifier, bool>(
  (ref) => AuthenticationNotifier(ref),
);
