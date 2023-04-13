import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:mubaha/ui/shared/widget/divider/divider_widget.dart';
import 'package:mubaha/ui/shared/widget/header/header.dart';
import 'package:mubaha/ui/theme/constant.dart';
import 'package:mubaha/ui/theme/theme.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                        padding: EdgeInsets.symmetric(horizontal: 12.w),
                        margin: EdgeInsets.symmetric(horizontal: 16.w),
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
                            Container(
                              //height: 46.h,
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Giang",
                                style: subHeadingStyle.copyWith(
                                    color: const Color(0xff2C3F55),
                                    fontSize: 17.sp),
                              ),
                            ),
                            SizedBox(
                              height: 18.h,
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
                              onPress: () {},
                              title: 'Mật khẩu ứng dụng',
                            ),
                            ItemProfile(
                              onPress: () {},
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
                              onPress: () {},
                              title: 'Màu sắc ứng dụng',
                              itemColor: const Color(0xff8686),
                            ),
                            ItemProfile(
                              onPress: () {},
                              title: 'Phông chữ',
                              subtitle: "Be Viet Nam Pro",
                            ),
                            ItemProfile(
                              onPress: () {},
                              title: 'Ngôn ngữ',
                              subtitle: "Tiếng Việt",
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
                              onPress: () {},
                              title: 'Viết đánh giá',
                            ),
                            ItemProfile(
                              onPress: () {},
                              title: 'Chia sẻ ứng dụng',
                            ),
                            ItemProfile(
                              onPress: () {},
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
                          style: TextStyle(
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
  }
}

class ItemProfile extends StatelessWidget {
  final bool? isBottomLine;
  final String title;
  final String? subtitle;
  final IconData? icon;
  final Function()? onPress;
  final Color? itemColor;
  const ItemProfile(
      {Key? key,
      this.isBottomLine = true,
      required this.title,
      this.subtitle,
      this.icon,
      this.itemColor,
      this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        height: 52.h,
        decoration: BoxDecoration(
            border: Border(
                bottom: isBottomLine!
                    ? BorderSide(color: secondaryColor60, width: 1)
                    : const BorderSide(color: Colors.transparent))),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 14.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: titleStyle.copyWith(
                          fontSize: 15.sp, color: titleColor),
                    ),
                  ],
                ),
              ),
            ),
            subtitle != null
                ? Container(
                    margin: EdgeInsets.symmetric(horizontal: 6.w),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          subtitle ?? "",
                          style: titleStyle.copyWith(
                              fontSize: 15.sp, color: greyPrymaryColor),
                        ),
                      ],
                    ),
                  )
                : Container(),
            itemColor != null
                ? Container(
                    width: 18.h,
                    height: 18.h,
                    margin: EdgeInsets.symmetric(horizontal: 6.w),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.amber),
                  )
                : Container(),
            Container(
              alignment: Alignment.center,
              child: Icon(
                Icons.arrow_forward_ios_rounded,
                size: 16.sp,
                color: greyPrymaryColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}
