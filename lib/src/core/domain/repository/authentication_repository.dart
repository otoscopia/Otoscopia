import 'package:otoscopia/src/core/core.dart';
import 'package:otoscopia/src/features/authentication/authentication.dart';

abstract class AuthenticationRepository {
  Future<UserEntity> login(String email, String password);

  Future<bool> signUp(SignUpFormEntity form);

  Future<void> logout(String sessionId);
}
