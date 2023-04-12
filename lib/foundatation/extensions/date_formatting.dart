import 'package:intl/intl.dart';

extension DateFormatting on DateTime {
  String tohhmmddMMyyyy() {
    final f = DateFormat('hh:mm dd/MM/yyyy');
    return f.format(this);
  }
}
