// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'school_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SchoolModelAdapter extends TypeAdapter<SchoolModel> {
  @override
  final int typeId = 3;

  @override
  SchoolModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SchoolModel(
      id: fields[0] as String,
      name: fields[1] as String,
      abbr: fields[2] as String,
      code: fields[3] as String,
      address: fields[4] as String,
      isActive: fields[5] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, SchoolModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.abbr)
      ..writeByte(3)
      ..write(obj.code)
      ..writeByte(4)
      ..write(obj.address)
      ..writeByte(5)
      ..write(obj.isActive);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SchoolModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
