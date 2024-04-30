import 'package:otoscopia/src/features/settings/settings.dart';

/// Use case for the multi-factor authentication repository
class MultiFactorAuthenticationUseCase {
  final MultiFactorAuthenticationRepository _repository;

  MultiFactorAuthenticationUseCase(this._repository);

  /// Enable authenticator app
  Future<List> enableAuthenticatorApp() async {
    return await _repository.enableAuthenticatorApp();
  }

  /// Disable authenticator app
  Future<void> disableAuthenticatorApp(String otp) async {
    return await _repository.disableAuthenticatorApp(otp);
  }
}
