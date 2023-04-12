import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mubaha/data/model/login/login_response.dart';
import 'package:mubaha/data/repository/customer/customer_repository.dart';
import 'package:mubaha/injection.dart';
import 'package:mubaha/ui/app_cubit.dart';
import 'package:mubaha/ui/router/router.gr.dart';
import 'package:mubaha/ui/screen/auth/siginin/cubit/signin_cubit.dart';
import 'package:mubaha/ui/screen/auth/siginin/cubit/signin_state.dart';
import 'package:mubaha/ui/shared/utils/functions.dart';
import 'package:mubaha/ui/shared/widget/background/social_login.dart';
import 'package:mubaha/ui/shared/widget/button/primary_button.dart';
import 'package:mubaha/ui/shared/widget/registration/registration_base.dart';
import 'package:mubaha/ui/shared/widget/richtext/custom_richtext.dart';
import 'package:mubaha/ui/shared/widget/textfield/primary_textfield.dart';
import 'package:mubaha/ui/theme/constant.dart';
import 'package:mubaha/ui/theme/text_style.dart';
import 'package:mubaha/translations/locale_keys.g.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  final TextEditingController _passController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          SigninCubit(getIt.get<CustomerRepository>(), getIt.get<AppCubit>()),
      child: BlocConsumer<SigninCubit, SigninState>(
        listener: (context, state) {},
        builder: (context, state) {
          return RegistrationBase(
              customWidget: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'XIN CHÀO',
                  style: AppTextStyle().textTitle,
                ),
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  'ĐĂNG KÝ',
                  style: AppTextStyle().textTitle,
                ),
                SizedBox(
                  height: 24.h,
                ),
                PrimaryTextField(
                  label: 'Tên tài khoản',
                  controller: _usernameController,
                  isUsername: true,
                ),
                SizedBox(
                  height: 17.h,
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
                  label: 'Email',
                  controller: _emailController,
                  isEmail: true,
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
                  label: 'ĐĂNG KÝ',
                  onPressed: () async {
                    unfocus(context);
                    if (_formKey.currentState!.validate()) {
                      final response = await context
                          .read<SigninCubit>()
                          .register(LoginRequest(
                              phone: _phoneController.text,
                              password: _passController.text,
                              fullName: _usernameController.text,
                              email: _emailController.text));
                      if (response!.status == 200) {
                        context.router.push(OtpPage(
                            phone: _phoneController.text, isLogin: false));
                      }
                    }
                  },
                ),
                SizedBox(
                  height: 26.h,
                ),
                Row(
                  children: [
                    const Expanded(
                      child: Divider(
                        color: dividerColor,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 7.w),
                      child: Text(
                        'Hoặc đăng nhập với',
                        style: AppTextStyle().textOrLoginWith,
                      ),
                    ),
                    const Expanded(
                        child: Divider(
                      color: dividerColor,
                    ))
                  ],
                ),
                SizedBox(
                  height: 28.h,
                ),
                const SocialLoginWidget(),
                SizedBox(
                  height: 36.h,
                ),
                CustomRichtext(
                    textSpan1: 'Đã có tài khoản, ',
                    textSpan2: 'đăng nhập',
                    widgetNavigator: SiginPage()),
                SizedBox(
                  height: 30.h,
                )
              ],
            ),
          ));
        },
      ),
    );
  }
}
