// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lm_file_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LmFileModelAdapter extends TypeAdapter<LmFileModel> {
  @override
  final int typeId = 3;

  @override
  LmFileModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LmFileModel(
      id: fields[0] as String?,
      location: fields[1] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, LmFileModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.location);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LmFileModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}