import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mubaha/ui/screen/main/profile/cubit/profile_cubit.dart';
import 'package:mubaha/ui/screen/main/profile/cubit/profile_state.dart';
import 'package:mubaha/ui/screen/main/profile/widget/item_profile.dart';
import 'package:mubaha/ui/screen/main/profile/widget/pick_color.dart';

import 'package:mubaha/ui/shared/widget/divider/divider_widget.dart';
import 'package:mubaha/ui/shared/widget/header/header.dart';
import 'package:mubaha/ui/theme/constant.dart';
import 'package:mubaha/ui/theme/theme.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileCubit()..init(),
      child: BlocConsumer<ProfileCubit, ProfileState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return Scaffold(
              backgroundColor: secondaryColor75,
              body: SafeArea(
                child: Column(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Header(
                              title: "Cài đặt ",
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 14.w),
                              margin: EdgeInsets.symmetric(horizontal: 14.w),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8.r)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 18.h,
                                  ),
                                  Container(
                                    //height: 46.h,
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      "Xin chào!",
                                      style: subHeadingStyle.copyWith(
                                          color: const Color(0xff2C3F55)),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 8.h,
                                  ),
                                  state.userLocal != null
                                      ? Container(
                                          //height: 46.h,
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            state.userLocal!.name,
                                            style: subHeadingStyle.copyWith(
                                                color: const Color(0xff2C3F55),
                                                fontSize: 17.sp),
                                          ),
                                        )
                                      : Container(),
                                  SizedBox(
                                    height: 18.h,
                                  ),
                                ],
                              ),
                            ),
                            const DividerWidget(),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 14.w),
                              margin: EdgeInsets.symmetric(horizontal: 14.w),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8.r)),
                              child: Column(
                                children: [
                                  ItemProfile(
                                    onPress: () {
                                      showToast();
                                    },
                                    title: 'Mật khẩu ứng dụng',
                                  ),
                                  ItemProfile(
                                    onPress: () {
                                      showToast();
                                    },
                                    title: 'Đổi mật khẩu',
                                  ),
                                ],
                              ),
                            ),
                            const DividerWidget(),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 12.w),
                              margin: EdgeInsets.symmetric(horizontal: 16.w),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8.r)),
                              child: Column(
                                children: [
                                  ItemProfile(
                                    onPress: () {
                                      showPickerModalPopup(
                                        context: context,
                                      ).then((value) => showToast());
                                    },
                                    title: 'Màu sắc ứng dụng',
                                    itemColor: const Color(0xff8686),
                                  ),
                                  ItemProfile(
                                    onPress: () {
                                      showToast();
                                    },
                                    title: 'Phông chữ',
                                    subtitle: "Be Viet Nam Pro",
                                  ),
                                  ItemProfile(
                                    onPress: () {
                                      showToast();
                                    },
                                    title: 'Ngôn ngữ',
                                    subtitle: "Tiếng Việt",
                                  ),
                                ],
                              ),
                            ),
                            const DividerWidget(),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 14.w),
                              margin: EdgeInsets.symmetric(horizontal: 14.w),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8.r)),
                              child: Column(
                                children: [
                                  ItemProfile(
                                    onPress: () {
                                      context
                                          .read<ProfileCubit>()
                                          .writeEvaluate();
                                    },
                                    title: 'Viết đánh giá',
                                  ),
                                  ItemProfile(
                                    onPress: () {
                                      context.read<ProfileCubit>().shareApp();
                                    },
                                    title: 'Chia sẻ ứng dụng',
                                  ),
                                  ItemProfile(
                                    onPress: () {
                                      context
                                          .read<ProfileCubit>()
                                          .seeOtherApps();
                                    },
                                    title: 'Xem ứng dụng khác',
                                  ),
                                  ItemProfile(
                                    onPress: () {
                                      context.read<ProfileCubit>().contactUs();
                                    },
                                    title: 'Liên hệ với chúng tôi ',
                                  ),
                                ],
                              ),
                            ),
                            const DividerWidget(),
                            Container(
                              alignment: Alignment.center,
                              margin: EdgeInsets.symmetric(vertical: 12.h),
                              child: Text(
                                "Phiên bản 1.0",
                                style: subTitleStyle.copyWith(
                                    color: greyPrymaryColor, fontSize: 13.sp),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ));
        },
      ),
    );
  }

  void showToast({String mess = "Tính năng đang cập nhật"}) {
    Fluttertoast.showToast(msg: mess);
  }
}
