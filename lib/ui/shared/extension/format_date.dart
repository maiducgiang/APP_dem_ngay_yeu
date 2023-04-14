import 'package:intl/intl.dart';
import 'package:mubaha/data/enums/enum_day_of_week.dart';

extension FormatDate on DateTime {
  String format() {
    return DateFormat('dd/MM/yyyy').format(this);
  }
}

extension FormatDate2 on DateTime {
  String format() {
    return DateFormat('dd-MM-yyyy').format(this);
  }
}

extension FormatDateToDayAndTime on DateTime {
  String format() {
    return DateFormat('dd-MM-yyyy hh:mm').format(this);
  }
}

extension FormatTime on DateTime {
  String format() {
    return DateFormat('hh:mm').format(this);
  }
}

extension FormatDateShip on DateTime {
  String format() {
    return DateFormat('dd').format(this) +
        ' Th' +
        DateFormat('MM').format(this);
  }
}

extension FormatDayOfWeek on DateTime {
  String format() {
    return dayOfWeekToString(DateFormat('E').format(this));
  }
}

String dayOfWeekToString(String day) {
  switch (day) {
    case 'Mon':
      return '2';
    case 'Tue':
      return "3";
    case 'Wed':
      return "4";
    case 'Thu':
      return "5";
    case 'Fri':
      return "6";
    case 'Sat':
      return "7";
    default:
      return "Chủ nhật";
  }
}

extension FormatDayShip on DateTime {
  String format() {
    return (FormatDayOfWeek(this).format() == 'Chủ nhật' ? '' : 'Thứ ') +
        FormatDayOfWeek(this).format() +
        ', Ngày ' +
        DateFormat('dd').format(this) +
        ' Thg ' +
        DateFormat('MM').format(this) +
        ' ' +
        DateFormat('yyyy').format(this);
  }

  String format2() {
    return (FormatDayOfWeek(this).format() == 'Chủ nhật' ? '' : 'Thứ ') +
        FormatDayOfWeek(this).format() +
        ' Ngày ' +
        DateFormat('dd').format(this) +
        ' Thg ' +
        DateFormat('MM').format(this) +
        ' ' +
        DateFormat('yyyy').format(this);
  }

  String format3() {
    return (FormatDayOfWeek(this).format() == 'Chủ nhật' ? '' : 'Thứ ') +
        FormatDayOfWeek(this).format();
  }

  String format4() {
    return '${DateFormat('dd').format(this)}/Thg ${DateFormat('MM').format(this)}\n${DateFormat('yyyy').format(this)}';
  }
}
