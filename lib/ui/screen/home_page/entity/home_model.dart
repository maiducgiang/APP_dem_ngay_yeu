import 'dart:typed_data';

import 'package:hive/hive.dart';

part 'home_model.g.dart';


@HiveType(typeId: 4)
class HomeModel extends HiveObject {
  @HiveField(0)
  String? firstText;
  @HiveField(1)
  String? secondText;
  @HiveField(2)
  String? addMoreDayText;
  @HiveField(3)
  User? me;
  @HiveField(4)
  User? myLover;
  @HiveField(5)
  Uint8List? images;
  @HiveField(6)
  int? loveCount;

  HomeModel copyWith({
    String? firstText,
    String? secondText,
    String? addMoreDayText,
    User? me,
    User? myLover,
    Uint8List? images,
    int? loveCount,
  }) {
    return HomeModel(
      firstText: firstText ?? this.firstText,
      secondText: secondText ?? this.secondText,
      addMoreDayText: addMoreDayText ?? this.addMoreDayText,
      me: me ?? this.me,
      myLover: myLover ?? this.myLover,
      images: images ?? this.images,
      loveCount: loveCount ?? this.loveCount
    );
  }

  HomeModel(
      {this.firstText,
      this.secondText,
      this.addMoreDayText,
      this.me,
      this.myLover,
      this.images,
      this.loveCount});
}

@HiveType(typeId: 5)
class User extends HiveObject {
  @HiveField(0)
  String? name;
  @HiveField(1)
  int? gender;
  @HiveField(2)
  String? zodiac;
  @HiveField(3)
  Uint8List? avatar;

  User({this.name, this.gender, this.zodiac, this.avatar});

  User copyWith({
    String? name,
    int? gender,
    String? zodiac,
    Uint8List? avatar
  }) {
    return User(
      name: name ?? this.name,
      gender: gender ?? this.gender,
      zodiac: zodiac ?? this.zodiac,
      avatar: avatar ?? this.avatar
    );
  }
}
