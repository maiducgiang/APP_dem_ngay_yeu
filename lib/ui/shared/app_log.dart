import 'package:flutter/foundation.dart';
import 'package:logging/logging.dart';

// Class log debug
class AppLog {
  final String? className;

  static Logger? log;

  AppLog({this.className}) {
    log = Logger(className ?? "MBS");

    Logger.root.level = Level.ALL; // defaults to Level.INFO
    Logger.root.onRecord.listen((record) {
      print(
          "------------------------------->STATR<-------------------------------");
      print(
          '${record.level.name}: ${record.time}: ${record.loggerName}: ${record.message}');
      print(
          "------------------------------->END<--------------------------------");
    });
  }

  static info(dynamic message) {
    log?.info(message);
  }

  static warning(dynamic message) {
    log?.warning(message);
  }

  static config(String message) {
    log?.config(message);
  }

  /// Emit a [info] log event
  static printInfo(String info) {
    print('\u001b[32m[INFO] MBS: $info\u001b[0m');
  }

  /// Emit a [warning] log event
  static printWarning(String warning) {
    print('\u001B[34m[WARNING] MBS: $warning\u001b[0m');
  }

  /// Emit a [error] log event
  static printError(String error) {
    print('\u001b[31m[ERROR] MBS: $error\u001b[0m');
  }
}
