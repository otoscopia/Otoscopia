import 'package:flutter/services.dart';

import 'package:otoscopia/src/features/settings/settings.dart';

/// Use case for the account repository
class AccountUseCase {
  final AccountRepository _repository;

  AccountUseCase(this._repository);

  /// Update the user's name
  Future<void> updateName(String name) async {
    return await _repository.updateName(name);
  }

  /// Update the user's contact number
  Future<void> updateContact(String contact, String password) async {
    return await _repository.updateContact(contact, password);
  }

  /// Update the user's clinic address
  Future<void> updateAddress(String address) async {
    return await _repository.updateAddress(address);
  }

  /// Update the user's profile picture
  Future<void> updateProfilePicture({String? path, Uint8List? cache}) async {
    return await _repository.updateProfilePicture(path: path, cache: cache);
  }

  /// Change the user's password
  Future<void> changePassword(String password, String oldPassword) async {
    return await _repository.changePassword(password, oldPassword);
  }

  /// Delete the user's account
  Future<void> deleteAccount(String id) async {
    return await _repository.deleteAccount(id);
  }
}
