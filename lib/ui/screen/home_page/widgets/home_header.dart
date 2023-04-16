import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../theme/app_path.dart';
import '../cubit/home_page_cubit.dart';

class HomeHeader extends StatefulWidget {
  const HomeHeader({Key? key}) : super(key: key);

  @override
  State<HomeHeader> createState() => _HomeHeaderState();
}

class _HomeHeaderState extends State<HomeHeader> {
  late final HomePageCubit _homePageCubit;

  @override
  void initState() {
    _homePageCubit = context.read<HomePageCubit>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding:
            EdgeInsets.only(left: 16.w, right: 16.w, top: 50.h, bottom: 27),
        child: BlocBuilder<HomePageCubit, HomePageState>(
            builder: (context, state) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  if (state.editing) {
                    _homePageCubit.changeEditing(editing: false);
                  } else {
                    _showShare();
                  }
                },
                child: Container(
                  height: 40.h,
                  width: 40.w,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.8),
                      shape: BoxShape.circle),
                  child: Center(
                      child: Image.asset(
                          state.editing ? AppPath.icClose : AppPath.icShare)),
                ),
              ),
              Visibility(
                visible: state.editing,
                child: Padding(
                  padding: EdgeInsets.only(left: 25.w),
                  child: const Text(
                    'Sửa nội dung',
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 17,
                        color: Colors.black),
                  ),
                ),
              ),
              state.editing
                  ? GestureDetector(
                      onTap: () {
                        _homePageCubit.saveData();
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 16.w, vertical: 6.h),
                        decoration: BoxDecoration(
                            color: const Color(0xFFFF8686),
                            borderRadius: BorderRadius.circular(12)),
                        child: const Text(
                          'Lưu',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Colors.white),
                        ),
                      ))
                  : GestureDetector(
                      onTap: () {
                        _showEditSetting();
                      },
                      child: Container(
                        height: 40.h,
                        width: 40.w,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.8),
                            shape: BoxShape.circle),
                        child: Center(child: Image.asset(AppPath.icEdit)),
                      ),
                    ),
            ],
          );
        }));
  }

  _showEditSetting() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Material(
              child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 16, bottom: 10, left: 16, right: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(width: 24),
                    const Text(
                      'Chỉnh sửa',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                          fontWeight: FontWeight.w700),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Image.asset(
                        AppPath.icClose,
                        height: 24,
                        width: 24,
                      ),
                    )
                  ],
                ),
              ),
              const Divider(),
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                  _homePageCubit.changeEditing(editing: true);
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  child: Row(
                    children: [
                      Image.asset(
                        AppPath.icEditContent,
                        width: 24,
                        height: 24,
                      ),
                      const SizedBox(width: 15),
                      const Text(
                        'Sửa nội dung',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.w400),
                      ),
                      const Spacer(),
                      const Icon(Icons.navigate_next_outlined, size: 20)
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: Row(
                  children: [
                    Image.asset(
                      AppPath.icPhone,
                      width: 24,
                      height: 24,
                    ),
                    const SizedBox(width: 15),
                    const Text(
                      'Đổi hình nền',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w400),
                    ),
                    const Spacer(),
                    const Icon(Icons.navigate_next_outlined, size: 20)
                  ],
                ),
              ),
              const SizedBox(height: 50)
            ],
          ));
        });
  }

   _showShare() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Material(
              child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 16, bottom: 10, left: 16, right: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(width: 24),
                    const Text(
                      'Chia sẻ',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                          fontWeight: FontWeight.w700),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Image.asset(
                        AppPath.icClose,
                        height: 24,
                        width: 24,
                      ),
                    )
                  ],
                ),
              ),
              const Divider(),
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  child: Row(
                    children: const [
                      Icon(Icons.download, size: 24),
                      SizedBox(width: 15),
                      Text(
                        'Lưu hình ảnh',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 50)
            ],
          ));
        });
  }
}
