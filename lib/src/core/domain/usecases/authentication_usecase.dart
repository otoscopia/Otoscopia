import 'package:otoscopia/src/core/core.dart';

class AuthenticationUseCase {
  final AuthenticationRepository _authenticationRepository;

  AuthenticationUseCase(this._authenticationRepository);

  Future<UserEntity> login(String email, String password) async {
    return await _authenticationRepository.login(email, password);
  }

  Future<void> logout(String sessionId) async {
    return await _authenticationRepository.logout(sessionId);
  }
}
