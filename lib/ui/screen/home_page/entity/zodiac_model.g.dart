// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'zodiac_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ZodiacAdapter extends TypeAdapter<Zodiac> {
  @override
  final int typeId = 6;

  @override
  Zodiac read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Zodiac(
      name: fields[0] as String,
      icon: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Zodiac obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.icon);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ZodiacAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
