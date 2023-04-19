import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mubaha/data/cache_manager.dart';
import '../cubit/home_page_cubit.dart';
import 'add_day.dart';

class CountCircle extends StatefulWidget {
  const CountCircle({Key? key}) : super(key: key);

  @override
  State<CountCircle> createState() => _CountCircleState();
}

class _CountCircleState extends State<CountCircle> {
  // late final HomePageCubit _homePageCubit;
  int _hour = 0;
  int _minute = 0;
  int _second = 0;
  late Timer _timer;

  void _startTimer() {
    // Start the timer
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        // Increase second by 1
        _second++;

        // If second is 60, reset it to 0 and increase minute by 1
        if (_second >= 60) {
          _second = 0;
          _minute++;
        }
        // If minute is 60, reset it to 0 and increase hour by 1
        if (_minute >= 60) {
          _minute = 0;
          _hour++;
        }

        // If hour is 24, stop the timer
        if (_hour >= 24) {
          setState(() {
            _hour = 0;
            CacheManager.instance.cacheBox.put('love_count',
                (CacheManager.instance.cacheBox.get('love_count') ?? 0) + 1);
            CacheManager.instance.cacheBox.delete('start_time');
          });
          _timer.cancel();
        }
      });
    });
  }

  @override
  void initState() {
    final DateTime? savedDate =
        CacheManager.instance.cacheBox.get('start_time') as DateTime?;
    if (savedDate != null) {
      final difference = DateTime.now().difference(savedDate);
      Duration duration = Duration(seconds: difference.inSeconds);
      if (duration.inHours < 24) {
        _hour = duration.inHours;
        _minute = duration.inMinutes.remainder(60);
        _second = duration.inSeconds.remainder(60);
        _startTimer();
      } else {
        setState(() {
          CacheManager.instance.cacheBox.put('love_count',
              (CacheManager.instance.cacheBox.get('love_count') ?? 0) + 1);
          CacheManager.instance.cacheBox.delete('start_time');
        });
      }
    }
    // _homePageCubit = context.read<HomePageCubit>();
    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomePageCubit, HomePageState>(
      builder: (context, state) {
        return Column(
          children: [
            Text(
              'Bên nhau',
              style: TextStyle(
                  fontSize: 17.sp,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xFFED5564)),
            ),
            const SizedBox(height: 15),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 77),
              padding: const EdgeInsets.all(16),
              height: 137,
              decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.34),
                  borderRadius: BorderRadius.circular(24)),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 5,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: FittedBox(
                            child: ValueListenableBuilder<Box<dynamic>>(
                              valueListenable:
                                  CacheManager.instance.cacheBox.listenable(),
                              builder: (context, box, child) {
                                return Text(
                                  (CacheManager.instance.cacheBox
                                              .get('love_count') ??
                                          0)
                                      .toString(),
                                  style: TextStyle(
                                      fontSize: 17.sp,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white),
                                );
                              },
                            ),
                          ),
                        ),
                        Text(
                          'Ngày',
                          style: TextStyle(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w400,
                              color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 20),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20, right: 10),
                    child: Text(
                      ':',
                      style: TextStyle(
                          fontSize: 60.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    flex: 3,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: FittedBox(
                            child: Text(
                              '$_hour Giờ',
                              style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                        Expanded(
                          child: FittedBox(
                            child: Text(
                              '$_minute Phút',
                              style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                        Expanded(
                          child: FittedBox(
                            child: Text(
                              '$_second Giây',
                              style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 10),
                ],
              ),
            ),
            AddDay(
              enable: CacheManager.instance.cacheBox.get('start_time') == null,
              onTap: () async {
                if (CacheManager.instance.cacheBox.get('start_time') == null) {
                  CacheManager.instance.cacheBox
                      .put('start_time', DateTime.now());
                  _startTimer();
                }
              },
            ),
          ],
        );
      },
    );
  }
}
