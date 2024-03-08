// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:otoscopia/src/core/core.dart';

class UsersEntity {
  final String id;
  final String name;
  final String email;
  final String phone;
  final String workAddress;
  final String publicKey;
  final UserRole role;

  UsersEntity({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.workAddress,
    required this.publicKey,
    required this.role,
  });

  UsersEntity copyWith({
    String? id,
    String? name,
    String? email,
    String? phone,
    String? workAddress,
    String? publicKey,
    UserRole? role,
    String? sessionId,
  }) {
    return UsersEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      workAddress: workAddress ?? this.workAddress,
      publicKey: publicKey ?? this.publicKey,
      role: role ?? this.role,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'workAddress': workAddress,
      'publicKey': publicKey,
      'role': role.toString(),
    };
  }

  factory UsersEntity.fromModel(UsersModel model) {
    final role = model.role == UserRoleModel.admin
        ? UserRole.admin
        : model.role == UserRoleModel.doctor
            ? UserRole.doctor
            : model.role == UserRoleModel.nurse
                ? UserRole.nurse
                : UserRole.patient;

    return UsersEntity(
      id: model.id,
      name: model.name,
      email: model.email,
      phone: model.phone,
      workAddress: model.workAddress,
      publicKey: model.publicKey,
      role: role,
    );
  }

  static UserRole getRole(String role) {
    switch (role) {
      case "admin":
        return UserRole.admin;
      case "doctor":
        return UserRole.doctor;
      case "nurse":
        return UserRole.nurse;
      case "patient":
        return UserRole.patient;
      default:
        return UserRole.patient;
    }
  }

  factory UsersEntity.fromMap(Map<String, dynamic> map) {
    UserRole role = getRole(map['role']);

    return UsersEntity(
      id: map['\$id'] as String,
      name: map['name'] as String,
      email: map['email'] as String,
      phone: map['phone'] as String,
      workAddress: map['workAddress'] as String,
      publicKey: map['publicKey'] as String,
      role: role,
    );
  }

  String toJson() => json.encode(toMap());

  factory UsersEntity.fromJson(String source) =>
      UsersEntity.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UsersEntity(id: $id, name: $name, email: $email, phone: $phone, workAddress: $workAddress, publicKey: $publicKey, role: $role)';
  }

  @override
  bool operator ==(covariant UsersEntity other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.email == email &&
        other.phone == phone &&
        other.workAddress == workAddress &&
        other.publicKey == publicKey &&
        other.role == role;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        email.hashCode ^
        phone.hashCode ^
        workAddress.hashCode ^
        publicKey.hashCode ^
        role.hashCode;
  }
}
