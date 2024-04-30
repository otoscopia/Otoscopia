/// Abstract class for multi factor authentication repository
abstract class MultiFactorAuthenticationRepository {
  /// Get recovery codes
  Future<List<String>> getRecoveryCodes();

  /// Enable authenticator app
  Future<List> enableAuthenticatorApp();

  /// Disable authenticator app
  Future<void> disableAuthenticatorApp(String otp);

  /// Verify authenticator app
  Future<void> verifyAuthenticatorApp(String otp);
}
