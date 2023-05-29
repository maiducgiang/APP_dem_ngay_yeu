import 'package:auto_route/auto_route.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/sign_up_cubit.dart';

class SignUpFinalScreen extends StatelessWidget {
  const SignUpFinalScreen({Key? key}) : super(key: key);

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
  final TextEditingController _gmailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  late final SignUpCubit _signUpCubit;

  @override
  void initState() {
    _signUpCubit = context.read<SignUpCubit>()..initGoogleSheet();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpCubit, SignUpState>(
      listener: (context, state) {
        if (state.isLoading) {
          BotToast.showLoading();
        }
        if (!state.isLoading) {
          BotToast.closeAllLoading();
        }
        // else {
        //   BotToast.closeAllLoading();
        //   BotToast.showText(text: state.error ?? '');
        // }
      },
      builder: (context, state) {
        return Scaffold(
          body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Color(0xff22252D),
            ),
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 100),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      state.isSignIn ? 'Đăng nhập' : "Đăng ký",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  SizedBox(height: 15),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Gmail',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  SizedBox(height: 4),
                  TextField(
                    textAlign: TextAlign.start,
                    controller: _gmailController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      hintText: 'Nhập gmail ...',
                      hintStyle: TextStyle(fontSize: 11),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide:
                            const BorderSide(width: 0, style: BorderStyle.none),
                      ),
                      filled: true,
                      contentPadding:
                          const EdgeInsets.only(left: 15, right: 15),
                      fillColor: Colors.white,
                    ),
                  ),
                  if (state.isSignIn == false) ...[
                    SizedBox(height: 32),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Số điện thoại',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    SizedBox(height: 4),
                    TextField(
                      textAlign: TextAlign.start,
                      controller: _phoneNumberController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        hintText: 'Nhập số điện thoại...',
                        hintStyle: TextStyle(fontSize: 11),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                              width: 0, style: BorderStyle.none),
                        ),
                        filled: true,
                        contentPadding:
                            const EdgeInsets.only(left: 15, right: 15, top: 10),
                        fillColor: Colors.white,
                      ),
                    ),
                  ],
                  SizedBox(height: 32),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Mật khẩu',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  SizedBox(height: 4),
                  TextField(
                    textAlign: TextAlign.start,
                    controller: _passController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      hintText: 'Nhập mật khẩu...',
                      hintStyle: TextStyle(fontSize: 11),
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
                  GestureDetector(
                    onTap: () async {
                      if (state.isSignIn) {
                        final String gmail = _gmailController.text.trim();
                        final String pass = _passController.text.trim();
                        if (gmail.length >= 6 &&
                            pass.isNotEmpty &&
                            gmail.contains("@gmail.")) {
                          if (await context
                              .read<SignUpCubit>()
                              .signIn(gmail, pass)) {}

                          // final feedback = {
                          //   SheetsColumn.name: gmail,
                          //   SheetsColumn.phone: '\'$phone',
                          // };
                          // await _signUpCubit.insert([feedback]);
                        } else if (!gmail.contains("@gmail.")) {
                          BotToast.showText(text: 'Vui lòng nhập lại gmail');
                        } else if (pass.isEmpty) {
                          BotToast.showText(text: 'Vui lòng nhập mật khẩu');
                        }
                      } else {
                        final String gmail = _gmailController.text.trim();
                        final String pass = _passController.text.trim();
                        final String phone = _phoneNumberController.text.trim();
                        if (gmail.length >= 6 &&
                            pass.isNotEmpty &&
                            gmail.contains("@gmail.") &&
                            phone.length >= 8) {
                          if (await context
                              .read<SignUpCubit>()
                              .signUp(gmail, pass)) {
                            final feedback = {
                              SheetsColumn.name: gmail,
                              SheetsColumn.phone: '\'$phone',
                            };
                            await _signUpCubit.insert([feedback]);
                          }
                        } else if (!gmail.contains("@gmail.")) {
                          BotToast.showText(text: 'Vui lòng nhập lại gmail');
                        } else if (pass.isEmpty) {
                          BotToast.showText(text: 'Vui lòng nhập mật khẩu');
                        } else if (phone.isEmpty || phone.length < 8) {
                          BotToast.showText(
                              text: 'Vui lòng nhập lại số điện thoại');
                        }
                      }
                    },
                    child: Container(
                      margin: EdgeInsets.only(top: 32),
                      padding: EdgeInsets.symmetric(vertical: 15),
                      decoration: BoxDecoration(
                          color: const Color(0xFFFF8686),
                          borderRadius: BorderRadius.circular(16)),
                      child: Center(
                        child: Text(
                          state.isSignIn ? "Đăng nhập" : 'Đăng ký',
                          style: TextStyle(color: Colors.white, fontSize: 17),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  state.isSignIn
                      ? GestureDetector(
                          onTap: () {
                            context.read<SignUpCubit>().setStatus(false);
                          },
                          child: RichText(
                            textAlign: TextAlign.left,
                            text: TextSpan(
                              style: TextStyle(
                                color: Colors.white,
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                    text: "Bạn chưa có tài khoản ",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 12)),
                                TextSpan(
                                    text: "đăng ký ngay",
                                    style: TextStyle(
                                        color: Colors.blue, fontSize: 12)),
                              ],
                            ),
                          ),
                        )
                      : GestureDetector(
                          onTap: () {
                            context.read<SignUpCubit>().setStatus(true);
                          },
                          child: RichText(
                            textAlign: TextAlign.left,
                            text: TextSpan(
                              style: TextStyle(
                                color: Colors.white,
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                    text: "Bạn đã có tài khoản ",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 12)),
                                TextSpan(
                                    text: "đăng nhập ngay",
                                    style: TextStyle(
                                        color: Colors.blue, fontSize: 12)),
                              ],
                            ),
                          ),
                        ),
                  //),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 1,
                        width: 38,
                        color: Colors.white,
                      ),
                      Text(
                        ' Hoặc ',
                        style: TextStyle(color: Colors.white, fontSize: 17),
                      ),
                      Container(
                        height: 1,
                        width: 38,
                        color: Colors.white,
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      margin: EdgeInsets.only(top: 16, bottom: 30),
                      padding: EdgeInsets.symmetric(vertical: 15),
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
      },
    );
  }
}
