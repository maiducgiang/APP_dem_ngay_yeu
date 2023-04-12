import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mubaha/ui/router/router.gr.dart';
import 'package:mubaha/ui/screen/auth/siginin/signin_screen.dart';
import 'package:mubaha/ui/services/account_services.dart';
import 'package:mubaha/ui/shared/widget/background/background_login.dart';
import 'package:mubaha/ui/shared/widget/button/primary_button.dart';
import 'package:mubaha/ui/theme/app_path.dart';
import 'package:mubaha/ui/theme/constant.dart';
import 'package:mubaha/ui/theme/text_style.dart';
import 'package:mubaha/translations/locale_keys.g.dart';
import 'package:auto_route/auto_route.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final ValueNotifier<int> _currentSlide = ValueNotifier(0);
  final CarouselController _slideController = CarouselController();

  final List<String> imgList = [
    AppPath.splash2,
    AppPath.splash2,
    AppPath.splash3,
  ];

  final List<String> textHeaderList = [
    'Chào mừng bạn đến với Muabaha',
    'Lựa chọn hoàn hảo cho mọi người',
    'Tất cả các mục yêu thích mới',
  ];

  final List<String> textContentList = [
    'Xu hướng mới nhất về quần áo nữ, nam và trẻ em tại Mubaha. Tìm hàng mới, danh mục thời trang, bộ sưu tập và lookbook mỗi tuần.',
    'Hơn 500 thương hiệu và hơn 1,00,000+ quần áo và phụ kiện. Khám phá những gì phù hợp nhất với bạn với chính sách hoàn trả trong 30 ngày của chúng tôi.',
    'Hàng mới về, danh mục thời trang và bộ sưu tập mỗi tuần. Thương hiệu cao cấp. Giao hàng miễn phí có sẵn. Cài đặt dễ dàng. Thanh toán an toàn.'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: kDefaultPaddingScreen),
        child: Stack(
          children: [
            const BackgroundLogin(),
            SafeArea(
              child: Column(
                children: [
                  Padding(
                    padding:
                        EdgeInsets.only(left: 22.w, right: 22.w, bottom: 10.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                          AppPath.logoPng,
                          width: 117.w,
                        ),
                        ValueListenableBuilder(
                            valueListenable: _currentSlide,
                            builder: (context, value, _) {
                              return GestureDetector(
                                onTap: () {
                                  AccountServices().saveIsFirstLoad(true);
                                  context.router.push(const MainPage());
                                },
                                child: Text(
                                  value != imgList.length - 1
                                      ? 'Bỏ qua'
                                      : 'Xong',
                                  style: AppTextStyle().textSemi16,
                                ),
                              );
                            })
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(children: [
                      Expanded(
                          child: CarouselSlider(
                        items: imgList
                            .map(
                              (e) => Image.asset(e),
                            )
                            .toList(),
                        carouselController: _slideController,
                        options: CarouselOptions(
                            height: double.infinity,
                            enableInfiniteScroll: false,
                            enlargeCenterPage: true,
                            onPageChanged: (index, reason) {
                              _currentSlide.value = index;
                            }),
                      )),
                      SizedBox(
                        height: 15.h,
                      ),
                      ValueListenableBuilder(
                          valueListenable: _currentSlide,
                          builder: (context, value, _) {
                            return Column(
                              children: [
                                Text(
                                  textHeaderList[_currentSlide.value],
                                  style: AppTextStyle().textHeaderSplash,
                                ),
                                SizedBox(
                                  height: 5.h,
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 24.w),
                                  child: Text(
                                    textContentList[_currentSlide.value],
                                    style: AppTextStyle()
                                        .textContentSplash
                                        .copyWith(height: 1.3),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                SizedBox(
                                  height: 20.h,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children:
                                      imgList.asMap().entries.map((entry) {
                                    return Container(
                                      width: _currentSlide.value == entry.key
                                          ? 30.w
                                          : 5.5.h,
                                      height: 5.5.h,
                                      margin: EdgeInsets.symmetric(
                                          horizontal: 2.96.w),
                                      decoration: BoxDecoration(
                                          color: secondaryColor,
                                          borderRadius:
                                              BorderRadius.circular(3)),
                                    );
                                  }).toList(),
                                ),
                              ],
                            );
                          }),
                    ]),
                  ),
                  SizedBox(
                    height: 27.5.h,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 15.w),
                    child: PrimaryButton(
                      label: 'BẮT ĐẦU',
                      onPressed: () {
                        AccountServices().saveIsFirstLoad(true);
                        context.router.push(const MainPage());
                      },
                    ),
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  RichText(
                    text: TextSpan(
                        style: AppTextStyle().textCreateNewAccount,
                        children: [
                          TextSpan(
                            text: 'Tạo tài khoản mới?',
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                context.router.replace(SignupPage());
                              },
                          ),
                          const TextSpan(text: " "),
                          TextSpan(
                            text: 'Đăng nhập',
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                context.router.replace(SiginPage());
                              },
                          ),
                        ]),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
