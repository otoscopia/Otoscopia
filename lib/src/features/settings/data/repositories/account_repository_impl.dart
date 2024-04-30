import 'dart:typed_data';

import 'package:otoscopia/src/features/settings/settings.dart';

class AccountRepositoryImpl implements AccountRepository {
  final AccountDataSource _dataSource;

  AccountRepositoryImpl(this._dataSource);

  @override
  Future<void> changePassword(String password, String oldPassword) async {
    return await _dataSource.changePassword(password, oldPassword);
  }

  @override
  Future<void> deleteAccount(String id) async {
    return await _dataSource.deleteAccount(id);
  }

  @override
  Future<void> updateAddress(String address) async {
    return await _dataSource.updateAddress(address);
  }

  @override
  Future<void> updateContact(String contact, String password) async {
    return await _dataSource.updateContact(contact, password);
  }

  @override
  Future<void> updateName(String name) async {
    return await _dataSource.updateName(name);
  }

  @override
  Future<void> updateProfilePicture({String? path, Uint8List? cache}) async {
    return await _dataSource.updateProfilePicture(path: path, cache: cache);
  }
}
