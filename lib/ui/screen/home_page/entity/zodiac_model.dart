import 'package:hive/hive.dart';
part 'zodiac_model.g.dart';
@HiveType(typeId: 6)
class Zodiac extends HiveObject {
  @HiveField(0)
  String name;
  @HiveField(1)
  String icon;

  Zodiac({required this.name, required this.icon});
}