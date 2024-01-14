import 'package:otoscopia/core/core.dart';

abstract class AuthenticationRepository {
  Future<UserEntity> login(String email, String password);

  Future<void> logout(String sessionId);
}
