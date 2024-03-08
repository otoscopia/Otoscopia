// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'enum_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserRoleModelAdapter extends TypeAdapter<UserRoleModel> {
  @override
  final int typeId = 7;

  @override
  UserRoleModel read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return UserRoleModel.admin;
      case 1:
        return UserRoleModel.nurse;
      case 2:
        return UserRoleModel.doctor;
      case 3:
        return UserRoleModel.patient;
      default:
        return UserRoleModel.admin;
    }
  }

  @override
  void write(BinaryWriter writer, UserRoleModel obj) {
    switch (obj) {
      case UserRoleModel.admin:
        writer.writeByte(0);
        break;
      case UserRoleModel.nurse:
        writer.writeByte(1);
        break;
      case UserRoleModel.doctor:
        writer.writeByte(2);
        break;
      case UserRoleModel.patient:
        writer.writeByte(3);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserRoleModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class GenderModelAdapter extends TypeAdapter<GenderModel> {
  @override
  final int typeId = 8;

  @override
  GenderModel read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return GenderModel.male;
      case 1:
        return GenderModel.female;
      case 2:
        return GenderModel.unknown;
      default:
        return GenderModel.male;
    }
  }

  @override
  void write(BinaryWriter writer, GenderModel obj) {
    switch (obj) {
      case GenderModel.male:
        writer.writeByte(0);
        break;
      case GenderModel.female:
        writer.writeByte(1);
        break;
      case GenderModel.unknown:
        writer.writeByte(2);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GenderModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class RecordStatusModelAdapter extends TypeAdapter<RecordStatusModel> {
  @override
  final int typeId = 9;

  @override
  RecordStatusModel read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return RecordStatusModel.pending;
      case 1:
        return RecordStatusModel.followUp;
      case 2:
        return RecordStatusModel.medicalAttention;
      case 3:
        return RecordStatusModel.resolved;
      default:
        return RecordStatusModel.pending;
    }
  }

  @override
  void write(BinaryWriter writer, RecordStatusModel obj) {
    switch (obj) {
      case RecordStatusModel.pending:
        writer.writeByte(0);
        break;
      case RecordStatusModel.followUp:
        writer.writeByte(1);
        break;
      case RecordStatusModel.medicalAttention:
        writer.writeByte(2);
        break;
      case RecordStatusModel.resolved:
        writer.writeByte(3);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RecordStatusModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
