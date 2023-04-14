import '../../cache_manager.dart';
import 'package:hive/hive.dart';

part 'lm_file_model.g.dart';

@HiveType(typeId: CacheManager.fileItemHiveType)
class LmFileModel extends HiveObject {
  @HiveField(0)
  final String? id;

  @HiveField(1)
  final String? location;

  LmFileModel({this.id, this.location});
}
