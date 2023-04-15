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
              Text(
                'Ngày yêu',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 48.sp,
                    fontWeight: FontWeight.w400),
              ),
              SizedBox(height: 8.h),
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
                  hintText: 'Tên tài khoản',
                  hintStyle: TextStyle(fontSize: 16.sp),
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
                  hintText: 'Số điện thoại',
                  hintStyle: TextStyle(fontSize: 16.sp),
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
                    final feedback = {
                      SheetsColumn.name: _nameController.text.trim(),
                      SheetsColumn.phone:
                          '\'${_phoneNumberController.text.trim()}',
                    };
                    await _cacheManager.addUserToCached(UserLocal(
                        name: _nameController.text.trim(),
                        phone: _phoneNumberController.text.trim()));
                    await _signUpCubit.insert([feedback]);
                  },
                  child: Container(
                    height: 48.h,
                    margin: EdgeInsets.only(top: 32.h),
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
                  height: 48.h,
                  margin: EdgeInsets.only(top: 16.h, bottom: 30.h),
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
