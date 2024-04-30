import 'package:otoscopia/src/features/settings/settings.dart';

class MultiFactorAuthenticationRepositoryImpl implements MultiFactorAuthenticationRepository {
  final MultiFactorAuthenticationDataSource _dataSource;

  MultiFactorAuthenticationRepositoryImpl(this._dataSource);

  @override
  Future<List<String>> getRecoveryCodes() async {
    return _dataSource.getRecoveryCodes();
  }

  @override
  Future<List> enableAuthenticatorApp() async {
    return _dataSource.enableAuthenticatorApp();
  }

  @override
  Future<void> disableAuthenticatorApp(String otp) async {
    return _dataSource.disableAuthenticatorApp(otp);
  }

  @override
  Future<void> verifyAuthenticatorApp(String otp) async {
    return _dataSource.verifyAuthenticatorApp(otp);
  }
}