import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:mubaha/ui/shared/widget/button/primary_button.dart';
import 'package:mubaha/ui/theme/constant.dart';
import 'package:mubaha/ui/theme/theme.dart';

Future<void> showPickerModalPopup(
    {required BuildContext context, List<Color>? listColor}) {
  List<Color> colors = [
    const Color(0xffE1E628),
    const Color(0xffB7BF1E),
    const Color(0xffF5BB2C),
    const Color(0xffF2A201),
    const Color(0xff78D78A),
    const Color(0xff54D6BE),
    const Color(0xff7597EF),
    const Color(0xffA259CF),
    const Color(0xffBD5297),
    const Color(0xffF65B59),
    const Color(0xff40A3C3),
    const Color(0xffE494D9),
  ];
  return showBarModalBottomSheet(
    context: context,
    //expand: true,
    builder: (BuildContext context1) {
      return Container(
        margin: EdgeInsets.symmetric(vertical: 8.h),
        padding: EdgeInsets.symmetric(horizontal: 12.h),
        height: 320.h,
        color: Colors.white,
        child: Column(
          children: [
            Container(
              height: 50.h,
              child: AppBar(
                centerTitle: true,
                automaticallyImplyLeading: false,
                backgroundColor: Colors.white,
                elevation: 0,
                actions: [
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(right: 18.w),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.close_sharp,
                        size: 24.sp,
                        color: greyPrymaryColor,
                      ),
                    ),
                  )
                ],
                title: Text(
                  "Chọn màu săc",
                  style: titleStyle.copyWith(
                    fontSize: 17.sp,
                  ),
                ),
              ),
            ),
            Divider(
              thickness: 0.5.h,
              color: greyPrymaryColor,
            ),
            Container(
                height: 200.h,
                child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 5,
                    childAspectRatio: 3 / 3,
                    mainAxisSpacing: kDefaultPaddingScreen.w,
                    crossAxisSpacing: kDefaultPaddingScreen.w,
                  ),
                  itemCount: colors.length,
                  itemBuilder: (context, index) {
                    return Container(
                      height: 30.h,
                      width: 30.h,
                      decoration: BoxDecoration(
                          color: colors[index], shape: BoxShape.circle),
                    );
                  },
                )),
            PrimaryButton(
              label: "Xong",
              borderRadius: BorderRadius.circular(12.r),
              onPressed: () {
                Navigator.pop(context);
              },
              style: titleStyle.copyWith(fontSize: 15.sp, color: Colors.white),
            ),
            SizedBox(
              height: 12.h,
            )
          ],
        ),
      );
    },
  );
}
