import 'package:auto_route/src/router/auto_router_x.dart';
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
import 'package:mubaha/ui/shared/loading_screen.dart';
import 'package:mubaha/ui/shared/utils/functions.dart';
import 'package:mubaha/ui/shared/widget/background/social_login.dart';
import 'package:mubaha/ui/shared/widget/button/primary_button.dart';
import 'package:mubaha/ui/shared/widget/registration/registration_base.dart';
import 'package:mubaha/ui/shared/widget/richtext/custom_richtext.dart';
import 'package:mubaha/ui/shared/widget/textfield/primary_textfield.dart';
import 'package:mubaha/ui/theme/constant.dart';
import 'package:mubaha/ui/theme/text_style.dart';

class SigninScreen extends StatefulWidget {
  SigninScreen({Key? key}) : super(key: key);

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _accountController = TextEditingController();

  final TextEditingController _passController = TextEditingController();
  bool isLoginWithPass = true;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          SigninCubit(getIt.get<CustomerRepository>(), getIt.get<AppCubit>()),
      child: BlocBuilder<SigninCubit, SigninState>(
        builder: (context, state) {
          // if (state is SigninFailed) {
          //   return ErrorOutput(message: state.message);
          // }
          if (state.token != null) {
            context.router.replace(MainPage());
          }
          if (!state.isLoading) {
            return RegistrationBase(
              customWidget: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
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
                      'ĐĂNG NHẬP',
                      style: AppTextStyle().textTitle,
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    PrimaryTextField(
                      label: 'Số điện thoại',
                      controller: _accountController,
                      isPhone: true,
                    ),
                    SizedBox(
                      height: isLoginWithPass ? 17.h : 0,
                    ),
                    Visibility(
                      visible: isLoginWithPass,
                      child: PrimaryTextField(
                        label: 'Mật khẩu',
                        controller: _passController,
                        isPass: true,
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      margin:
                          EdgeInsets.only(right: 8.w, top: 20.h, bottom: 25.h),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            isLoginWithPass = !isLoginWithPass;
                          });
                        },
                        child: Text(
                          isLoginWithPass
                              ? 'Đăng nhập với số điện thoại'
                              : 'Đăng nhập bằng mật khẩu',
                          style: AppTextStyle()
                              .textBody
                              .copyWith(color: primaryColor),
                          textAlign: TextAlign.right,
                        ),
                      ),
                    ),
                    PrimaryButton(
                      label: 'ĐĂNG NHẬP',
                      onPressed: () async {
                        unfocus(context);
                        if (_formKey.currentState!.validate()) {
                          if (isLoginWithPass) {
                            context.read<SigninCubit>().login(LoginRequest(
                                phone: _accountController.text,
                                password: _passController.text));
                          }
                          final response = await context
                              .read<SigninCubit>()
                              .loginOtp(
                                  LoginRequest(phone: _accountController.text));
                          if (response != null && response.status == 200) {
                            context.router
                                .push(OtpPage(phone: _accountController.text));
                          }
                        }
                      },
                    ),
                    Visibility(
                      visible: isLoginWithPass,
                      child: Container(
                        width: double.infinity,
                        margin: EdgeInsets.only(right: 8.w, top: 10.h),
                        child: GestureDetector(
                          onTap: () {
                            context.router.push(ResetPassPage());
                          },
                          child: Text(
                            'Quên mật khẩu ?',
                            style: AppTextStyle()
                                .textBody
                                .copyWith(color: primaryColor),
                            textAlign: TextAlign.right,
                          ),
                        ),
                      ),
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
                        textSpan1: 'Không có tài khoản, ',
                        textSpan2: 'tạo ngay',
                        widgetNavigator: SignupPage()),
                    SizedBox(
                      height: 30.h,
                    )
                  ],
                ),
              ),
            );
          }
          return Scaffold(
            body: LoadingScreen(),
          );
        },
      ),
    );
  }
}
