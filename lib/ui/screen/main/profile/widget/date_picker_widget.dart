import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mubaha/ui/screen/main/profile/bloc/date_cubit.dart';
import 'package:mubaha/ui/screen/main/profile/bloc/date_state.dart';
import 'package:mubaha/ui/theme/constant.dart';
import 'package:mubaha/ui/theme/text_style.dart';
import 'package:mubaha/ui/shared/extension/format_date.dart';

class DatePickerWidget extends StatefulWidget {
  final DateTime? date;
  final String title;
  const DatePickerWidget({
    Key? key,
    required this.title,
    this.date,
  }) : super(key: key);

  @override
  State<DatePickerWidget> createState() => _DatePickerWidgetState();
}

class _DatePickerWidgetState extends State<DatePickerWidget> {
  late DateCubit _dateCubit;
  DateTime get date => widget.date!;
  @override
  initState() {
    super.initState();
    _dateCubit = context.read<DateCubit>();
    // date != null ? _dateCubit.emit(DateState(dateTime: date)) : null;
  }

  _dayPicker(DateTime dateTime) {
    showModalBottomSheet(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        context: context,
        builder: (context) {
          return CalendarDatePicker(
            initialDate: dateTime,
            firstDate: DateTime(1990),
            lastDate: DateTime.now(),
            onDateChanged: (DateTime newDate) {
              _dateCubit.updateDate(newDate);
              Navigator.pop(context);
            },
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DateCubit, DateState>(builder: (context, dateState) {
      return InkWell(
        onTap: () {
          FocusScope.of(context).unfocus();
          TextEditingController().clear();
          _dayPicker(dateState.dateTime ?? DateTime.now());
        },
        child: FormField(
          validator: (_) {
            if (dateState.dateTime == null) {
              return 'demo error';
            }
            return null;
          },
          builder: (FormFieldState<String> state) {
            return InputDecorator(
              decoration: InputDecoration(
                suffixIcon: const Icon(
                  Icons.calendar_today,
                  size: 20,
                  color: Colors.grey,
                ),
                labelStyle: dateState.dateTime == null
                    ? AppTextStyle().textBody
                    : AppTextStyle().textBody.copyWith(color: primaryColor),
                floatingLabelBehavior: FloatingLabelBehavior.always,
                labelText: 'Date of birth',
                errorBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.red),
                    borderRadius: BorderRadius.circular(5)),
                focusedErrorBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.red),
                    borderRadius: BorderRadius.circular(5)),
                contentPadding:
                    EdgeInsets.only(top: 0, bottom: 0, left: 20.w, right: 0),
                enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: borderColor),
                    borderRadius: BorderRadius.circular(5)),
                focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: primaryColor),
                    borderRadius: BorderRadius.circular(5)),
              ),
              child: Text(
                  dateState.dateTime != null
                      ? FormatDate(dateState.dateTime!).format()
                      : '',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis),
            );
          },
        ),
      );
    });
  }
}
