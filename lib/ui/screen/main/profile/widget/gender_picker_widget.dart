import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mubaha/ui/screen/main/profile/bloc/gender_cubit.dart';
import 'package:mubaha/ui/screen/main/profile/bloc/gender_state.dart';
import 'package:mubaha/ui/shared/utils/functions.dart';
import 'package:mubaha/ui/theme/constant.dart';
import 'package:mubaha/ui/theme/text_style.dart';
import 'package:provider/src/provider.dart';

class GenderPickerWidget extends StatefulWidget {
  // final Userr userr;
  final String male;
  final String female;
  GenderPickerWidget(
      {Key? key,
      // @required this.userr,
      required this.male,
      required this.female})
      : super(key: key);

  @override
  _GenderPickerWidgetState createState() => _GenderPickerWidgetState();
}

class _GenderPickerWidgetState extends State<GenderPickerWidget> {
  late GenderCubit _genderCubit;
  String get male => widget.male;
  String get female => widget.female;

  @override
  void initState() {
    super.initState();
    _genderCubit = context.read<GenderCubit>();
    //_genderCubit.emit(GenderState(1));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenderCubit, GenderState>(
        builder: (context, genderState) {
      return FormField(
        validator: (_) {
          if (genderState.gender == null) {
            return 'demo error';
          }
          return null;
        },
        builder: (FormFieldState<String> state) {
          return InputDecorator(
            decoration: InputDecoration(
              labelStyle: genderState.gender == null
                  ? AppTextStyle().textBody
                  : AppTextStyle().textBody.copyWith(color: primaryColor),
              floatingLabelBehavior: FloatingLabelBehavior.always,
              labelText: 'Gender',
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
            child: DropdownButton(
                onTap: () => unfocus(context),
                style: const TextStyle(fontSize: 15, color: Colors.black),
                isExpanded: true,
                value: genderState.gender,
                icon: const Icon(
                  Icons.arrow_drop_down,
                  size: 30,
                  color: Colors.grey,
                ),
                underline: const SizedBox(),
                onChanged: (int? newValue) {
                  _genderCubit.updateGender(newValue!);
                },
                items: <int>[1, 2].map<DropdownMenuItem<int>>((int value) {
                  return DropdownMenuItem<int>(
                    value: value,
                    child: Text(value == 1 ? male : female),
                  );
                }).toList()),
          );
        },
      );
    });
  }
}
