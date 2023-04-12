import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:mubaha/ui/shared/validators/validators.dart';
import 'package:mubaha/ui/theme/constant.dart';
import 'package:mubaha/ui/theme/text_style.dart';

class PrimaryTextField extends StatelessWidget {
  final String label;
  final bool? isPass;
  final bool? isPhone;
  final bool? isUsername;
  final bool? isEmail;

  final TextEditingController controller;
  PrimaryTextField(
      {Key? key,
      required this.label,
      this.isPass,
      required this.controller,
      this.isUsername,
      this.isPhone,
      this.isEmail})
      : super(key: key);

  final ValueNotifier _isShow = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: _isShow,
        builder: (context, value, _) {
          return TextFormField(
            style: AppTextStyle().textBody.copyWith(color: titleColor),
            validator: (text) {
              if (isUsername == true
                  ? !Validators.isValidUsername(text!)
                  : isPass == true
                      ? !Validators.isValidPassword(text!)
                      : isEmail == true
                          ? !Validators.isValidEmail(text!)
                          : !Validators.isValidUsername(text!)) {
                return isUsername == true
                    ? 'Vui lòng điền tên tài khoản'
                    : isPhone == true
                        ? 'Vui lòng điền số điện thoại'
                        : isPass == true
                            ? 'Vui lòng nhập mật khẩu'
                            : isEmail == true
                                ? 'Email không đúng'
                                : 'Vui lòng điền Tên đường, toà nhà, số nhà';
              }
              return null;
            },
            controller: controller,
            obscureText: isPass == true ? !_isShow.value : false,
            // cursorColor: primaryColor,
            // style: const TextStyle(fontSize: 15, color: Colors.black),
            decoration: InputDecoration(
                errorStyle: const TextStyle(
                  fontSize: 10,
                ),
                // focusColor: primaryColor,
                labelText: label,
                floatingLabelBehavior: FloatingLabelBehavior.always,
                labelStyle: AppTextStyle().textBody,
                floatingLabelStyle:
                    AppTextStyle().textBody.copyWith(color: primaryColor),
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
                suffixIcon: isPass == true
                    ? GestureDetector(
                        onTap: () {
                          _isShow.value = !_isShow.value;
                        },
                        child: _isShow.value
                            ? const Icon(MdiIcons.eye)
                            : const Icon(MdiIcons.eyeOff))
                    : null),
          );
        });
  }
}
