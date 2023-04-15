import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:lottie/lottie.dart';
import 'package:mubaha/ui/screen/home_page/cubit/home_page_cubit.dart';
import 'package:mubaha/ui/theme/app_path.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomePageCubit(),
      child: const HomePageScreen(),
    );
  }
}

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({Key? key}) : super(key: key);

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(AppPath.background3)
          ),
          gradient: LinearGradient(
              colors: [
                Color(0xFFFFDDDD),
                Color(0xFFFDB1B1),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.0, 1.0],
              tileMode: TileMode.clamp),
        ),
        child: Column(
          children: [
            _header(),
            _countCircle(),
            _addDay(),
            Expanded(
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Image.asset(
                        AppPath.cloud,
                        fit: BoxFit.cover,
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 96.w,
                          width: 96.w,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: const Color(0xFFEFF2F7),
                            border: Border.all(
                                color: const Color(0xFFFF8686), width: 3.w),
                          ),
                          child: const Center(
                            child: Icon(Icons.add, color: Color(0xFFC2CEDB)),
                          ),
                        ),
                        SizedBox(width: 17.w),
                        Container(
                          height: 96.w,
                          width: 96.w,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: const Color(0xFFEFF2F7),
                            border: Border.all(
                                color: const Color(0xFFFF8686), width: 3.w),
                          ),
                          child: const Center(
                            child: Icon(Icons.add, color: Color(0xFFC2CEDB)),
                          ),
                        ),
                      ],
                    ),
                        Padding(
                          padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 34.h, bottom: 13.h),
                          child: Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Tôi',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 17.sp
                                    ),
                                  ),
                                  SizedBox(height: 5.h),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.all(3),
                                        decoration: const BoxDecoration(
                                          color: Color(0xFF00A7E5),
                                          shape: BoxShape.circle
                                        ),
                                        child: const Icon(Icons.male, color: Colors.white),
                                      ),
                                      SizedBox(width: 3.w),
                                      Container(
                                        padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 12.w),
                                        decoration: BoxDecoration(
                                          color: const Color(0xFFFF8686),
                                          borderRadius: BorderRadius.circular(45)
                                        ),
                                        child: const Text(
                                          'Chòm sao',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 13,
                                            fontWeight: FontWeight.w400
                                          ),
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                              const Spacer(),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    'Người ấy',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 17.sp
                                    ),
                                  ),
                                  SizedBox(height: 5.h),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 12.w),
                                        decoration: BoxDecoration(
                                          color: const Color(0xFFFF8686),
                                          borderRadius: BorderRadius.circular(45)
                                        ),
                                        child: const Text(
                                          'Chòm sao',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 13,
                                            fontWeight: FontWeight.w400
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 3.w),
                                      Container(
                                        padding: const EdgeInsets.all(3),
                                        decoration: const BoxDecoration(
                                          color: Color(0xFFF44336),
                                          shape: BoxShape.circle
                                        ),
                                        child: const Icon(Icons.female, color: Colors.white),
                                      ),
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    )
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 150, top: 50),
                    child: Center(
                      child: Lottie.asset(
                        AppPath.lottieHeart,
                        fit: BoxFit.cover,
                        width: 100
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _header() {
    return Padding(
      padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 50.h, bottom: 27),
      child: Row(
        children: [
          Container(
            height: 40.h,
            width: 40.w,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.8), shape: BoxShape.circle),
            child: Center(child: Image.asset(AppPath.icShare)),
          ),
          const Spacer(),
          Container(
            height: 40.h,
            width: 40.w,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.8), shape: BoxShape.circle),
            child: Center(child: Image.asset(AppPath.icEdit)),
          ),
        ],
      ),
    );
  }

  Widget _countCircle() {
    return Container(
        height: 195.w,
        width: 195.w,
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.8), shape: BoxShape.circle),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Bên nhau',
                    style:
                        TextStyle(fontSize: 17.sp, fontWeight: FontWeight.w400),
                  ),
                  SizedBox(height: 20.h),
                  Text(
                    '1,000',
                    style: TextStyle(
                        fontSize: 32.sp,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFFF44336)),
                  ),
                  SizedBox(height: 20.h),
                  Text(
                    'Ngày',
                    style:
                        TextStyle(fontSize: 17.sp, fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),
            HourProgressBar(
              radius: 120.w,
              strokeWidth: 5,
              backgroundColor: Colors.transparent,
              color: Colors.red,
              dateTime: DateTime.now(),
            ),
          ],
        ));
  }

  Widget _addDay() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
      margin: EdgeInsets.only(top: 19.h, left: 24.w, right: 24.w),
      decoration: BoxDecoration(
          color: const Color(0xFFED5564),
          borderRadius: BorderRadius.circular(16)),
      child: Text(
        'Yêu thêm ngày nữa',
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.white, fontSize: 17.sp),
      ),
    );
  }
}

class HourProgressBar extends StatelessWidget {
  final double radius;
  final double strokeWidth;
  final Color color;
  final Color backgroundColor;
  final DateTime dateTime;

  const HourProgressBar(
      {Key? key,
      required this.radius,
      required this.strokeWidth,
      required this.color,
      required this.backgroundColor,
      required this.dateTime})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(radius * 2, radius * 2),
      painter: HourProgressBarPainter(
        strokeWidth: strokeWidth,
        color: color,
        backgroundColor: backgroundColor,
        dateTime: dateTime,
      ),
    );
  }
}

class HourProgressBarPainter extends CustomPainter {
  final double strokeWidth;
  final Color color;
  final Color backgroundColor;
  final DateTime dateTime;

  HourProgressBarPainter({
    required this.strokeWidth,
    required this.color,
    required this.backgroundColor,
    required this.dateTime,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..color = backgroundColor;
    final center = Offset(size.width / 2, size.height / 2);
    final radius = min(size.width, size.height) / 2 - strokeWidth / 2;
    canvas.drawCircle(center, radius, paint);

    final progressPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..color = color;
    final progressAngle = dateTime.hour / 24 * pi * 2;
    final progressPath = Path()
      ..addArc(
        Rect.fromCircle(center: center, radius: radius),
        -pi / 2,
        progressAngle,
      );
    canvas.drawPath(progressPath, progressPaint);

    final dotPaint = Paint()
      ..style = PaintingStyle.fill
      ..color = color;
    final dotOffset = Offset(
      center.dx + radius * cos(progressAngle - pi / 2),
      center.dy + radius * sin(progressAngle - pi / 2),
    );
    canvas.drawCircle(dotOffset, strokeWidth + 3, dotPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
