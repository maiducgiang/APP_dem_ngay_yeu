import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mubaha/data/cache_manager.dart';
import 'package:mubaha/ui/screen/home_page/entity/home_model.dart';
import 'package:mubaha/ui/shared/utils/functions.dart';
import 'package:mubaha/ui/shared/widget/edit_popup.dart';

import '../../../theme/app_path.dart';
import '../cubit/home_page_cubit.dart';
import 'hour_progress.dart';

class CountCircle extends StatefulWidget {
  const CountCircle({Key? key}) : super(key: key);

  @override
  State<CountCircle> createState() => _CountCircleState();
}

class _CountCircleState extends State<CountCircle> {
  late final HomePageCubit _homePageCubit;

  @override
  void initState() {
    _homePageCubit = context.read<HomePageCubit>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomePageCubit, HomePageState>(
      builder: (context, state) {
        return Container(
            height: 195.w,
            width: 195.w,
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.8), shape: BoxShape.circle),
            child: Stack(
              children: [
                HourProgressBar(
                  radius: 120.w,
                  strokeWidth: 5,
                  backgroundColor: Colors.transparent,
                  color: Colors.red,
                  dateTime: DateTime.now(),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      state.editing
                          ? GestureDetector(
                              onTap: () {
                                showPopup(
                                    context: context,
                                    title: 'Tiêu đề trên',
                                    onChanged: (value) {
                                      _homePageCubit.updateData(
                                          homeModel:
                                              HomeModel(firstText: value));
                                    },
                                    onTapCancel: () {
                                      _homePageCubit.updateData(
                                          homeModel:
                                              HomeModel(firstText: 'Bên nhau'));
                                      Navigator.pop(context);
                                    },
                                    onTapConfirm: () {
                                      Navigator.pop(context);
                                    });
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 5),
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 18, vertical: 5),
                                decoration: BoxDecoration(
                                    color: const Color(0xFFC2CEDB),
                                    borderRadius: BorderRadius.circular(12)),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Flexible(
                                      child: Text(
                                        (state.homeModel?.firstText?.isEmpty ??
                                                true)
                                            ? 'Bên nhau'
                                            : state.homeModel?.firstText ?? '',
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontSize: 17.sp,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ),
                                    SizedBox(width: 5.w),
                                    Image.asset(AppPath.icEdit,
                                        height: 16, width: 16)
                                  ],
                                ),
                              ),
                            )
                          : Text(
                              (state.homeModel?.firstText?.isEmpty ?? true)
                                  ? 'Bên nhau'
                                  : state.homeModel?.firstText ?? '',
                              style: TextStyle(
                                  fontSize: 17.sp, fontWeight: FontWeight.w400),
                            ),
                      SizedBox(height: state.editing ? 5.h : 20.h),
                      ValueListenableBuilder<Box<dynamic>>(
                        valueListenable:
                            CacheManager.instance.cacheBox.listenable(),
                        builder: (context, box, widget) {
                          return Text(
                            ((box.get('love_count')) ?? 0).toString(),
                            style: TextStyle(
                                fontSize: 32.sp,
                                fontWeight: FontWeight.w600,
                                color: const Color(0xFFF44336)),
                          );
                        },
                      ),
                      SizedBox(height: state.editing ? 5.h : 20.h),
                      state.editing
                          ? GestureDetector(
                              onTap: () {
                                showPopup(
                                    context: context,
                                    title: 'Tiêu đề dưới',
                                    onChanged: (value) {
                                      _homePageCubit.updateData(
                                          homeModel:
                                              HomeModel(secondText: value));
                                    },
                                    onTapCancel: () {
                                      _homePageCubit.updateData(
                                          homeModel:
                                              HomeModel(secondText: 'Ngày'));
                                      Navigator.pop(context);
                                    },
                                    onTapConfirm: () {
                                      Navigator.pop(context);
                                    });
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 5),
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 25, vertical: 5),
                                decoration: BoxDecoration(
                                    color: const Color(0xFFC2CEDB),
                                    borderRadius: BorderRadius.circular(12)),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Flexible(
                                      child: Text(
                                        (state.homeModel?.secondText?.isEmpty ??
                                                true)
                                            ? 'Ngày'
                                            : state.homeModel?.secondText ?? '',
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontSize: 17.sp,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ),
                                    SizedBox(width: 5.w),
                                    Image.asset(AppPath.icEdit,
                                        height: 16, width: 16)
                                  ],
                                ),
                              ),
                            )
                          : Text(
                              (state.homeModel?.secondText?.isEmpty ?? true)
                                  ? 'Ngày'
                                  : state.homeModel?.secondText ?? '',
                              style: TextStyle(
                                  fontSize: 17.sp, fontWeight: FontWeight.w400),
                            ),
                    ],
                  ),
                ),
              ],
            ));
      },
    );
  }
}
