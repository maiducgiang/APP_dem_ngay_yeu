import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mubaha/data/model/board_local/board_model.dart';

class CacheManager {
  static CacheManager? _instance;
  static const String _cacheBoxName = 'HiveCache';
  static const int broadmodel = 1;
  static const int fileItemHiveType = 3;
  static CacheManager get instance => _instance ??= CacheManager._();

  CacheManager._();

  Box get _cacheBox => Hive.box(_cacheBoxName);

  Future<void> init() async {
    try {
      print('Init hive cache manager');
      await Hive.initFlutter();
      Hive.registerAdapter(BoardModelLocalAdapter());
      await openBox();
      print('Open box successfully');
    } catch (ex) {
      print('Cache Init failed: $ex');
    }
  }

  Future<void> openBox() async {
    try {
      await Hive.openBox(_cacheBoxName);
    } catch (e) {
      // Error occurs when install new version application (which have new box schema)
      // on old version application (which have old box schema). The conflict of box
      // schema will cause error, so the solution is we delete all data has old schema.
      print('Init database error: ${e.toString()}');
      await Hive.deleteBoxFromDisk(_cacheBoxName);
      print('Delete of out date box and reopen box');
      await Hive.openBox(_cacheBoxName);
    }
  }

  Future<void> clear() async {
    try {
      await _cacheBox.deleteAll([]);
    } catch (e) {
      print(e);
    }
  }
}
