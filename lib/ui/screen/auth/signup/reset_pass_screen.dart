import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mubaha/ui/router/router.gr.dart';
import 'package:mubaha/ui/shared/utils/functions.dart';
import 'package:mubaha/ui/shared/widget/button/primary_button.dart';
import 'package:mubaha/ui/shared/widget/registration/registration_base.dart';
import 'package:mubaha/ui/shared/widget/richtext/custom_richtext.dart';
import 'package:mubaha/ui/shared/widget/textfield/primary_textfield.dart';
import 'package:mubaha/ui/theme/text_style.dart';
import 'package:mubaha/translations/locale_keys.g.dart';

class ResetPassScreen extends StatelessWidget {
  ResetPassScreen({Key? key}) : super(key: key);
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return RegistrationBase(
        customWidget: Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Đặt lại mật khẩu',
            style: AppTextStyle().textTitle,
          ),
          SizedBox(
            height: 24.h,
          ),
          PrimaryTextField(
            label: 'Số điện thoại',
            controller: _phoneController,
            isPhone: true,
          ),
          SizedBox(
            height: 17.h,
          ),
          PrimaryTextField(
            label: 'Mật khẩu',
            controller: _passController,
            isPass: true,
          ),
          SizedBox(
            height: 25.h,
          ),
          PrimaryButton(
            label: 'Đặt lại mật khẩu',
            onPressed: () {
              unfocus(context);
              if (_formKey.currentState!.validate()) {
                print('done');
              }
            },
          ),
          SizedBox(
            height: 21.h,
          ),
          CustomRichtext(
              textSpan1: 'Quay lại ',
              textSpan2: 'Đăng nhập',
              widgetNavigator: SiginPage()),
          SizedBox(
            height: 30.h,
          )
        ],
      ),
    ));
  }
}
