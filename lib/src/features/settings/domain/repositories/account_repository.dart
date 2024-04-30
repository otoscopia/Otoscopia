import 'dart:typed_data';

/// Abstract class for the account repository
abstract class AccountRepository {
  /// Update the user's name
  Future<void> updateName(String name);

  /// Update the user's contact number
  Future<void> updateContact(String contact, String password);

  /// Update the user's clinic address
  Future<void> updateAddress(String address);

  /// Update the user's profile picture
  Future<void> updateProfilePicture({String? path, Uint8List? cache});

  /// Change the user's password
  Future<void> changePassword(String password, String oldPassword);

  /// Delete the user's account
  Future<void> deleteAccount(String id);
}
