// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patient_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PatientModelAdapter extends TypeAdapter<PatientModel> {
  @override
  final int typeId = 1;

  @override
  PatientModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PatientModel(
      id: fields[0] as String,
      name: fields[1] as String,
      gender: fields[2] as GenderModel,
      birthDate: fields[3] as DateTime,
      school: fields[4] as String,
      lrn: fields[5] as String,
      guardian: fields[6] as String,
      guardianPhone: fields[7] as String,
      creator: fields[8] as String,
      doctor: fields[9] as String,
      code: fields[10] as String,
      image: fields[11] as String?,
      updatedAt: fields[12] as DateTime,
      createdAt: fields[13] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, PatientModel obj) {
    writer
      ..writeByte(14)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.gender)
      ..writeByte(3)
      ..write(obj.birthDate)
      ..writeByte(4)
      ..write(obj.school)
      ..writeByte(5)
      ..write(obj.lrn)
      ..writeByte(6)
      ..write(obj.guardian)
      ..writeByte(7)
      ..write(obj.guardianPhone)
      ..writeByte(8)
      ..write(obj.creator)
      ..writeByte(9)
      ..write(obj.doctor)
      ..writeByte(10)
      ..write(obj.code)
      ..writeByte(11)
      ..write(obj.image)
      ..writeByte(12)
      ..write(obj.updatedAt)
      ..writeByte(13)
      ..write(obj.createdAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PatientModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
