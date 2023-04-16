import 'package:auto_route/auto_route.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mubaha/data/cache_manager.dart';
import 'package:mubaha/data/model/user_local/user_model_local.dart';
import 'package:mubaha/ui/router/router.gr.dart';
import 'package:mubaha/ui/theme/app_path.dart';

import 'cubit/sign_up_cubit.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SignUpCubit(),
      child: const SignUpPage(),
    );
  }
}

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  late final SignUpCubit _signUpCubit;
  final _cacheManager = CacheManager.instance;
  @override
  void initState() {
    _signUpCubit = context.read<SignUpCubit>()..initGoogleSheet();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.5), BlendMode.darken),
                image: const AssetImage(AppPath.background2))),
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 100.h),
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Đăng ký\nđể truy cập ứng dụng',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 28.sp,
                      fontWeight: FontWeight.w600),
                ),
              ),
              SizedBox(height: 15.h),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Tên tài khoản',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400),
                ),
              ),
              SizedBox(height: 4.h),
              TextField(
                textAlign: TextAlign.start,
                controller: _nameController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  hintText: 'Nhập tên tài khoản...',
                  hintStyle: TextStyle(fontSize: 11.sp),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide:
                        const BorderSide(width: 0, style: BorderStyle.none),
                  ),
                  filled: true,
                  contentPadding: const EdgeInsets.only(left: 15, right: 15),
                  fillColor: Colors.white,
                ),
              ),
              SizedBox(height: 32.h),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Số điện thoại',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400),
                ),
              ),
              SizedBox(height: 4.h),
              TextField(
                textAlign: TextAlign.start,
                controller: _phoneNumberController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  hintText: 'Nhập số điện thoại...',
                  hintStyle: TextStyle(fontSize: 11.sp),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide:
                        const BorderSide(width: 0, style: BorderStyle.none),
                  ),
                  filled: true,
                  contentPadding:
                      const EdgeInsets.only(left: 15, right: 15, top: 10),
                  fillColor: Colors.white,
                ),
              ),
              BlocListener<SignUpCubit, SignUpState>(
                listener: (context, state) {
                  if (state.isLoading) {
                    BotToast.showLoading();
                  } else if (state.addSuccess ?? false) {
                    BotToast.closeAllLoading();
                    context.router.replaceAll([const MainPage()]);
                  } else {
                    BotToast.closeAllLoading();
                    BotToast.showText(text: state.error ?? '');
                  }
                },
                child: GestureDetector(
                  onTap: () async {
                    final String name = _nameController.text.trim();
                    final String phone = _phoneNumberController.text.trim();
                    if (name.length >= 6 && phone.isNotEmpty) {
                      final feedback = {
                        SheetsColumn.name: name,
                        SheetsColumn.phone: '\'$phone',
                      };
                      await _cacheManager.addUserToCached(UserLocal(
                          name: _nameController.text.trim(),
                          phone: _phoneNumberController.text.trim()));
                      await _signUpCubit.insert([feedback]);
                    } else if (name.length < 6) {
                      BotToast.showText(text: 'Tên phải chứa từ 6 ký tự');
                    } else if (phone.isEmpty) {
                      BotToast.showText(text: 'Vui lòng nhập số điện thoại');
                    }
                  },
                  child: Container(
                    margin: EdgeInsets.only(top: 32.h),
                    padding: EdgeInsets.symmetric(vertical: 15.h),
                    decoration: BoxDecoration(
                        color: const Color(0xFFFF8686),
                        borderRadius: BorderRadius.circular(16)),
                    child: const Center(
                      child: Text(
                        'Đăng ký',
                        style: TextStyle(color: Colors.white, fontSize: 17),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 1.h,
                    width: 38.w,
                    color: Colors.white,
                  ),
                  Text(
                    ' Hoặc ',
                    style: TextStyle(color: Colors.white, fontSize: 17.sp),
                  ),
                  Container(
                    height: 1.h,
                    width: 38.w,
                    color: Colors.white,
                  ),
                ],
              ),
              GestureDetector(
                onTap: () {
                  context.router.push(const MainPage());
                },
                child: Container(
                  margin: EdgeInsets.only(top: 16.h, bottom: 30.h),
                  padding: EdgeInsets.symmetric(vertical: 15.h),
                  decoration: BoxDecoration(
                      color: const Color(0xFFC2CEDB),
                      borderRadius: BorderRadius.circular(16)),
                  child: const Center(
                    child: Text(
                      'Bỏ qua',
                      style: TextStyle(color: Colors.black, fontSize: 17),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
