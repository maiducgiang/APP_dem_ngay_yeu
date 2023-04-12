import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:mubaha/data/model/login/login_response.dart';
import 'package:mubaha/data/repository/customer/customer_repository.dart';
import 'package:mubaha/injection.dart';
import 'package:mubaha/ui/app_cubit.dart';
import 'package:mubaha/ui/router/router.gr.dart';
import 'package:mubaha/ui/screen/auth/siginin/cubit/signin_cubit.dart';
import 'package:mubaha/ui/screen/auth/siginin/cubit/signin_state.dart';
import 'package:mubaha/ui/shared/loading_screen.dart';
import 'package:mubaha/ui/shared/widget/button/primary_button.dart';
import 'package:mubaha/ui/shared/widget/registration/registration_base.dart';
import 'package:mubaha/ui/shared/widget/richtext/custom_richtext.dart';
import 'package:mubaha/ui/theme/constant.dart';
import 'package:mubaha/ui/theme/text_style.dart';
import 'package:mubaha/translations/locale_keys.g.dart';
import 'package:pinput/pin_put/pin_put.dart';

class OtpScreen extends StatelessWidget {
  OtpScreen({Key? key, required this.phone, this.isLogin = true})
      : super(key: key);
  final String phone;
  final bool isLogin;
  final FocusNode _pinPutFocusNode = FocusNode();
  final TextEditingController _pinPutController = TextEditingController();
  BoxDecoration get _pinPutDecoration {
    return BoxDecoration(

        // border: Border.all(color: Colors.black12),
        borderRadius: BorderRadius.circular(5.0),
        color: secondaryColor45);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          SigninCubit(getIt.get<CustomerRepository>(), getIt.get<AppCubit>()),
      child: BlocConsumer<SigninCubit, SigninState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          if (state.token != null) {
            context.router.replace(MainPage());
          }
          if (!state.isLoading) {
            return GestureDetector(
              onTap: () {
                _pinPutFocusNode.unfocus();
              },
              child: RegistrationBase(
                  customWidget: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Xác minh',
                    style: AppTextStyle().textTitle,
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  Text(
                    'Xác thực mã OTP:',
                    style: AppTextStyle().textBody.copyWith(
                        fontWeight: FontWeight.w600, color: titleColor),
                  ),
                  SizedBox(
                    height: 7.h,
                  ),
                  Text(
                    'Nhập mã xác thực của bạn vào đây:',
                    style: AppTextStyle().textRegular16.copyWith(
                        fontWeight: FontWeight.w400, color: contentColor),
                  ),
                  SizedBox(
                    height: 18.h,
                  ),
                  Row(
                    children: [
                      Text(
                        phone,
                        style: AppTextStyle().textRegular16.copyWith(
                            fontWeight: FontWeight.w400, color: titleColor),
                      ),
                      SizedBox(
                        width: 8.w,
                      ),
                      // Icon(
                      //   MdiIcons.leadPencil,
                      //   size: 15.sp,
                      // )
                    ],
                  ),
                  SizedBox(
                    height: 19.h,
                  ),
                  SizedBox(
                    width: 250.w,
                    child: PinPut(
                      eachFieldAlignment: Alignment.center,
                      eachFieldHeight: 55.w,
                      eachFieldWidth: 55.w,
                      textStyle: AppTextStyle().textRegular21,
                      fieldsCount: 4,
                      autofocus: true,
                      onSubmit: (_) {
                        _pinPutFocusNode.unfocus();
                      },
                      focusNode: _pinPutFocusNode,
                      controller: _pinPutController,
                      submittedFieldDecoration: _pinPutDecoration,
                      selectedFieldDecoration: _pinPutDecoration,
                      followingFieldDecoration: _pinPutDecoration,
                    ),
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  CustomRichtext(
                      textSpan1: 'Không nhận được mã? ',
                      textSpan2: 'Gửi lại',
                      widgetNavigator: OtpPage(phone: '098765431')),
                  SizedBox(
                    height: 19.h,
                  ),
                  PrimaryButton(
                    label: 'GỬI',
                    onPressed: () {
                      isLogin
                          ? context.read<SigninCubit>().verifyLoginOtp(
                              LoginRequest(
                                  phone: phone, code: _pinPutController.text))
                          : context.read<SigninCubit>().verifyRegisterOtp(
                              LoginRequest(
                                  phone: phone, code: _pinPutController.text));
                    },
                  ),
                  SizedBox(
                    height: 30.h,
                  )
                ],
              )),
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
