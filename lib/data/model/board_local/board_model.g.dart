// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'board_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BoardModelLocalAdapter extends TypeAdapter<BoardModelLocal> {
  @override
  final int typeId = 1;

  @override
  BoardModelLocal read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BoardModelLocal(
      fields[0] as String,
      fields[1] as String,
      fields[2] as DateTime,
      (fields[3] as List?)
          ?.map((dynamic e) => (e as List).cast<Uint8List>())
          .toList(),
    );
  }

  @override
  void write(BinaryWriter writer, BoardModelLocal obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.time)
      ..writeByte(3)
      ..write(obj.listImage);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BoardModelLocalAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
