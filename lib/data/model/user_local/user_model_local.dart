import 'dart:typed_data';

import 'package:hive/hive.dart';
import 'package:mubaha/data/cache_manager.dart';

part 'user_model_local.g.dart';

@HiveType(typeId: CacheManager.userLocal)
class UserLocal extends HiveObject {
  @HiveField(0)
  String name;
  @HiveField(1)
  String phone;

  UserLocal({required this.name, required this.phone});

  UserLocal copyWith({String? name, String? phone}) {
    return UserLocal(name: name ?? this.name, phone: phone ?? this.phone);
  }
}
