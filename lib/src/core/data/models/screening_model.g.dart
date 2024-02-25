// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'screening_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ScreeningModelAdapter extends TypeAdapter<ScreeningModel> {
  @override
  final int typeId = 4;

  @override
  ScreeningModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ScreeningModel(
      id: fields[0] as String,
      patient: fields[1] as String,
      historyOfIllness: fields[2] as String,
      remarks: fields[3] as String,
      temperature: fields[4] as double,
      weight: fields[5] as double,
      height: fields[6] as double,
      similarCondition: fields[7] as bool,
      chiefComplaint: (fields[8] as List).cast<bool>(),
      chiefComplaintRemarks: fields[9] as String,
      allergy: fields[10] as bool,
      allergyRemarks: fields[11] as String,
      undergoneSurgery: fields[12] as bool,
      undergoneSurgeryRemarks: fields[13] as String,
      medication: fields[14] as bool,
      medicationRemarks: fields[15] as String,
      images: (fields[16] as List).cast<String>(),
      createdAt: fields[17] as DateTime,
      updatedAt: fields[18] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, ScreeningModel obj) {
    writer
      ..writeByte(19)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.patient)
      ..writeByte(2)
      ..write(obj.historyOfIllness)
      ..writeByte(3)
      ..write(obj.remarks)
      ..writeByte(4)
      ..write(obj.temperature)
      ..writeByte(5)
      ..write(obj.weight)
      ..writeByte(6)
      ..write(obj.height)
      ..writeByte(7)
      ..write(obj.similarCondition)
      ..writeByte(8)
      ..write(obj.chiefComplaint)
      ..writeByte(9)
      ..write(obj.chiefComplaintRemarks)
      ..writeByte(10)
      ..write(obj.allergy)
      ..writeByte(11)
      ..write(obj.allergyRemarks)
      ..writeByte(12)
      ..write(obj.undergoneSurgery)
      ..writeByte(13)
      ..write(obj.undergoneSurgeryRemarks)
      ..writeByte(14)
      ..write(obj.medication)
      ..writeByte(15)
      ..write(obj.medicationRemarks)
      ..writeByte(16)
      ..write(obj.images)
      ..writeByte(17)
      ..write(obj.createdAt)
      ..writeByte(18)
      ..write(obj.updatedAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ScreeningModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
