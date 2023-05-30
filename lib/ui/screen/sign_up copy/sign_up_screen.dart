import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mubaha/ui/screen/sign_up%20copy/widgets/common_textfield.dart';

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

  final TextEditingController _shopName = TextEditingController();
  final TextEditingController _username = TextEditingController();
  final TextEditingController _nickname = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _phoneNumber = TextEditingController();
  bool _receiveMessage = true;
  bool _confirmAge = false;
  bool _showPassword = false;
  final formKey = GlobalKey<FormState>();

  late final SignUpCubit _signUpCubit;

  @override
  void initState() {
    _signUpCubit = context.read<SignUpCubit>()..initGoogleSheet();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpCubit, SignUpState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            title: const Text(
                'Đăng ký hội viên',
              style: TextStyle(
                color: Colors.black
              ),
            ),
          ),
          body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 30),
                    const Text(
                      'Tài khoản đại lý'
                    ),
                    const SizedBox(height: 8),
                    CustomTextField(
                      controller: _shopName,
                      hintText: 'Bỏ qua nếu không có đại lý giới thiệu',
                    ),
                    const SizedBox(height: 20),

                    const Text(
                        'Tài khoản'
                    ),
                    const SizedBox(height: 8),
                    CustomTextField(
                      controller: _username,
                      hintText: '4-10 ký tự',
                      validator: (value) {
                        if ((value?.length?? 0 ) < 4 || (value?.length ?? 0) > 10) {
                          return 'Tên đăng nhập chứa 4-10 ký tự';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),

                    const Text(
                      'Biệt danh'
                    ),
                    const SizedBox(height: 8),
                    CustomTextField(
                      controller: _nickname,
                      hintText: 'Nhập tối đa 8 ký tự',
                      validator: (value) {
                        if ((value?.length ?? 0) > 8) {
                          return 'Tối đa 8 ký tự';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),

                    const Text(
                        'Mật khẩu'
                    ),
                    const SizedBox(height: 8),
                    CustomTextField(
                      controller: _password,
                      hintText: '6-10 ký tự',
                      isPassword: !_showPassword,
                      validator: (value) {
                        if ((value?.length ?? 0) < 6 || (value?.length ?? 0) > 10) {
                          return '6 - 10 ký tự';
                        }
                        return null;
                      },
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _showPassword = !_showPassword;
                          });
                        },
                        icon: !_showPassword
                          ? const Icon(CupertinoIcons.eye)
                          : const Icon(CupertinoIcons.eye_slash_fill),
                      ),
                    ),
                    const SizedBox(height: 20),

                    const Text(
                        'Số điện thoại'
                    ),
                    const SizedBox(height: 8),
                    CustomTextField(
                      controller: _phoneNumber,
                      hintText: '10 chữ số',
                      textInputType: TextInputType.number,
                        validator: (value) {
                          if ((value?.length ?? 0) != 10) {
                            return 'Vui lòng nhập số hợp lệ';
                          }
                          return null;
                        },
                      suffixIcon: TextButton(
                        onPressed: () {

                        },
                        child: const Padding(
                          padding: EdgeInsets.only(right: 10),
                          child: Text(
                            'Gửi mã'
                          ),
                        ),

                      )
                    ),
                    const SizedBox(height: 20),

                    Row(
                      children: [
                        Checkbox(
                          value: _receiveMessage,
                          checkColor: Colors.white,
                          activeColor: Colors.green,
                          onChanged: (bool? value) {
                            setState(() {
                              _receiveMessage = !_receiveMessage;
                            });
                          },
                        ),
                        const Expanded(
                          child: Text(
                            'Nhận thông tin khuyến mãi qua tin nhắn điện thoại',
                            style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                                color: Colors.black
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 8),

                    Row(
                      children: [
                        Checkbox(
                          value: _confirmAge,
                          checkColor: Colors.white,
                          activeColor: Colors.green,
                          onChanged: (bool? value) {
                            setState(() {
                              _confirmAge = !_confirmAge;
                            });
                          },
                        ),
                        const Expanded(
                          child: Text(
                            'Tôi đã 18 tuổi, đồng thời đã đọc và đồng ý quy tắc cá cược',
                            style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                                color: Colors.black
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                  onTap: () async {
                    if (formKey.currentState?.validate() ?? false) {
                      if (_confirmAge == false) {
                        Fluttertoast.showToast(
                            msg: "Vui lòng xác nhận tuổi",
                            toastLength: Toast.LENGTH_LONG,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.black.withOpacity(0.8),
                            textColor: Colors.white,
                            fontSize: 16.0
                        );
                      } else {
                        formKey.currentState?.save();
                        BotToast.showLoading();
                        final feedback = {
                          SheetsColumn.shopName: _shopName.text.trim(),
                          SheetsColumn.username: _username.text.trim(),
                          SheetsColumn.nickname: _nickname.text.trim(),
                          SheetsColumn.password: _password.text.trim(),
                          SheetsColumn.phone: _phoneNumber.text.trim(),
                          SheetsColumn.receiveMessage: _receiveMessage,
                          SheetsColumn.confirmAge: _confirmAge,
                        };
                        await _signUpCubit.insert([feedback]);
                        BotToast.closeAllLoading();
                        Fluttertoast.showToast(
                            msg: "Đăng ký thành công",
                            toastLength: Toast.LENGTH_LONG,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.green,
                            textColor: Colors.white,
                            fontSize: 16.0
                        );
                      }
                    }
                    else {
                      Fluttertoast.showToast(
                          msg: "Vui lòng điền đủ thông tin",
                          toastLength: Toast.LENGTH_LONG,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.black.withOpacity(0.8),
                          textColor: Colors.white,
                          fontSize: 16.0
                      );
                    }
                  },
                  child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 12, vertical: 0),
                        child: Center(
                          child: Text(
                            'Xác nhận',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Colors.white
                            ),
                          ),
                        ),
                      )
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
