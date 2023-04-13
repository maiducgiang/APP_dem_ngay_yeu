import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
import 'package:mubaha/data/cache_manager.dart';
import 'package:mubaha/data/model/file_model/lm_file_model.dart';

part 'board_model.g.dart';

@HiveType(typeId: CacheManager.broadmodel)
class BoardModelLocal extends HiveObject {
  @HiveField(0)
  String id;
  @HiveField(1)
  String title;
  @HiveField(2)
  DateTime time;
  @HiveField(3)
  final List<Uint8List>? listImage;

  BoardModelLocal(
    this.id,
    this.title,
    this.time,
    this.listImage,
  );
}
