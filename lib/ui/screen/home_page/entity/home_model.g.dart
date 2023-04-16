// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HomeModelAdapter extends TypeAdapter<HomeModel> {
  @override
  final int typeId = 4;

  @override
  HomeModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HomeModel(
      firstText: fields[0] as String?,
      secondText: fields[1] as String?,
      addMoreDayText: fields[2] as String?,
      me: fields[3] as User?,
      myLover: fields[4] as User?,
      images: fields[5] as Uint8List?,
      loveCount: fields[6] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, HomeModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.firstText)
      ..writeByte(1)
      ..write(obj.secondText)
      ..writeByte(2)
      ..write(obj.addMoreDayText)
      ..writeByte(3)
      ..write(obj.me)
      ..writeByte(4)
      ..write(obj.myLover)
      ..writeByte(5)
      ..write(obj.images)
      ..writeByte(6)
      ..write(obj.loveCount);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HomeModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class UserAdapter extends TypeAdapter<User> {
  @override
  final int typeId = 5;

  @override
  User read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return User(
      name: fields[0] as String?,
      gender: fields[1] as int?,
      zodiac: fields[2] as String?,
      avatar: fields[3] as Uint8List?,
    );
  }

  @override
  void write(BinaryWriter writer, User obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.gender)
      ..writeByte(2)
      ..write(obj.zodiac)
      ..writeByte(3)
      ..write(obj.avatar);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
