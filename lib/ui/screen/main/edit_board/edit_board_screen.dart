import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mubaha/ui/theme/constant.dart';
import 'package:mubaha/ui/theme/theme.dart';

class EditBoardScreen extends StatefulWidget {
  const EditBoardScreen({Key? key}) : super(key: key);

  @override
  State<EditBoardScreen> createState() => _EditBoardScreenState();
}

class _EditBoardScreenState extends State<EditBoardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _appBar(context),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 72.h,
              alignment: Alignment.center,
              width: double.infinity,
              child: Row(children: [
                for (int i = 1; i <= 3; i = i + 1)
                  Container(
                    height: 64.h,
                    width: 64.h,
                  )
              ]),
            )
          ],
        ),
      )),
    );
  }

  AppBar _appBar(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      centerTitle: true,
      backgroundColor: Colors.white,
      elevation: 0,
      actions: [
        Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.r), color: primaryColor),
          padding: EdgeInsets.symmetric(
            horizontal: 15.w,
          ),
          margin: EdgeInsets.symmetric(vertical: 8.h, horizontal: 12.w),
          child: Text("Lưu",
              style: TextStyle(color: Colors.white, fontSize: 13.sp)),
        )
      ],
      leading: InkWell(
        onTap: () => Navigator.pop(context),
        child: const Icon(
          Icons.arrow_back_ios_new_rounded,
          color: Colors.black,
        ),
      ),
      title: Text(
        "Thêm Kỷ niệm",
        style: titleStyle.copyWith(
          fontSize: 17.sp,
        ),
      ),
    );
  }
}
