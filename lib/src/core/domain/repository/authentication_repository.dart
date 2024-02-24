import 'package:otoscopia/src/core/core.dart';
import 'package:otoscopia/src/features/authentication/authentication.dart';

abstract class AuthenticationRepository {
  Future<UserEntity> login(SignInFormEntity form);

  Future<UserEntity> getUser(String sessionId);

  Future<bool> signUp(SignUpFormEntity form);

  Future<void> logout(String sessionId);
}
