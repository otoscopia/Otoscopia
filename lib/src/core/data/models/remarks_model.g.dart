// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remarks_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RemarksModelAdapter extends TypeAdapter<RemarksModel> {
  @override
  final int typeId = 2;

  @override
  RemarksModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return RemarksModel(
      id: fields[0] as String,
      remarks: fields[1] as String,
      screening: fields[2] as String,
      status: fields[4] as RecordStatusModel,
      location: fields[3] as String?,
      date: fields[5] as DateTime?,
      createdAt: fields[6] as DateTime?,
    );
  }

  @override
  void write(BinaryWriter writer, RemarksModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.remarks)
      ..writeByte(2)
      ..write(obj.screening)
      ..writeByte(3)
      ..write(obj.location)
      ..writeByte(4)
      ..write(obj.status)
      ..writeByte(5)
      ..write(obj.date)
      ..writeByte(6)
      ..write(obj.createdAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RemarksModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
