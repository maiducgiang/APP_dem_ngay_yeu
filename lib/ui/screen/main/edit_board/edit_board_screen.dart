import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:mubaha/ui/screen/main/edit_board/cubit/edit_board_cubit.dart';
import 'package:mubaha/ui/screen/main/edit_board/cubit/edit_board_state.dart';
import 'package:mubaha/ui/screen/main/review/widget/media_button_widget.dart';
import 'package:mubaha/ui/shared/extension/format_date.dart';
import 'package:mubaha/ui/shared/widget/textfield/custome_textfield.dart';
import 'package:mubaha/ui/theme/constant.dart';
import 'package:mubaha/ui/theme/theme.dart';
import 'package:badges/badges.dart' as badges;

class EditBoardScreen extends StatefulWidget {
  const EditBoardScreen({Key? key}) : super(key: key);

  @override
  State<EditBoardScreen> createState() => _EditBoardScreenState();
}

class _EditBoardScreenState extends State<EditBoardScreen> {
  final TextEditingController dayController =
      TextEditingController(text: FormatDayShip(DateTime.now()).format());
  final TextEditingController contentController = TextEditingController();
  late DateTime day = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EditBoardCubit(),
      child: BlocConsumer<EditBoardCubit, EditBoardState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: _appBar(context),
            body: SafeArea(
                child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.h),
                child: Column(
                  children: [
                    widgetListImage(context, state),
                    CustomeTextField(
                      title: 'Ngày kỷ niệm',
                      colorBorder: greyPrymaryColor,
                      controller: dayController,
                      prefixIcon: Container(
                        padding: EdgeInsets.all(8.sp),
                        child: SvgPicture.asset(
                          "assets/images/icons/calendar.svg",
                          color: greyPrymaryColor,
                          width: 16,
                        ),
                      ),
                      isEnable: false,
                      onTapPrefixIcon: () async {
                        _dayPicker(day);
                      },
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    CustomeTextField(
                      colorBorder: greyPrymaryColor,
                      controller: contentController,
                      maxLines: 10,
                    )
                  ],
                ),
              ),
            )),
          );
        },
      ),
    );
  }

  Widget widgetListImage(BuildContext context, EditBoardState state) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 24.h,
      ),
      alignment: Alignment.center,
      width: double.infinity,
      child: Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
        for (int i = 0; i < 3; i = i + 1)
          state.imageFileList.length > i
              ? Padding(
                  padding: EdgeInsets.only(right: 16.w),
                  // padding: const EdgeInsets.all(8.0),
                  child: badges.Badge(
                    // padding: EdgeInsets.symmetric(
                    //     horizontal: 2.w, vertical: 1.h),
                    // shape: BadgeShape.square,
                    // borderRadius: BorderRadius.circular(10.r),
                    // badgeContent: Text("1",
                    //     style: TextStyle(
                    //         color: Colors.white,
                    //         fontSize: 9.sp)),
                    position: badges.BadgePosition.topEnd(top: 0, end: 0),
                    showBadge: true,
                    ignorePointer: false,
                    onTap: () {
                      context.read<EditBoardCubit>().deleteImage(i);
                    },

                    badgeContent:
                        const Icon(Icons.close, color: Colors.white, size: 15),

                    badgeStyle: badges.BadgeStyle(
                      shape: badges.BadgeShape.circle,
                      badgeColor: primaryColor,
                      padding:
                          EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h),
                      borderRadius: BorderRadius.circular(15.r),
                      borderSide:
                          const BorderSide(color: primaryColor, width: 3),
                      elevation: 0,
                    ),
                    child: Container(
                      height: 64.h,
                      width: 64.h,

                      // margin: EdgeInsets.only(right: 10.w),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Image.file(
                          File(state.imageFileList[i].path),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                )
              : InkWell(
                  onTap: () {
                    _showPickerModalPopup(context);
                  },
                  child: Container(
                    height: 64.h,
                    width: 64.h,
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(right: 16.w),
                    decoration: BoxDecoration(
                        color: greyPrymarySecondColor,
                        borderRadius: BorderRadius.circular(12.r)),
                    child: Icon(
                      Icons.add,
                      color: greyPrymaryColor,
                      size: 28.sp,
                    ),
                  ),
                ),
        Container(
          alignment: Alignment.bottomLeft,
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          child: Text(
            "${state.imageFileList.length}/3",
            style: TextStyle(color: greyPrymaryColor, fontSize: 12.sp),
          ),
        )
      ]),
    );
  }

  _dayPicker(DateTime dateTime) {
    showModalBottomSheet(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        context: context,
        builder: (context) {
          return CalendarDatePicker(
            initialDate: dateTime,
            firstDate: DateTime(1990),
            lastDate: DateTime(2050),
            onDateChanged: (DateTime newDate) {
              setState(() {
                day = newDate;
                dayController.text = FormatDayShip(day).format();
              });
              Navigator.pop(context);
            },
          );
        });
  }

  AppBar _appBar(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      centerTitle: true,
      backgroundColor: Colors.white,
      elevation: 0,
      actions: [
        InkWell(
          onTap: () {
            context
                .read<EditBoardCubit>()
                .save(title: contentController.text, time: day);
            context.router.pop();
          },
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r), color: primaryColor),
            padding: EdgeInsets.symmetric(
              horizontal: 15.w,
            ),
            margin: EdgeInsets.symmetric(vertical: 8.h, horizontal: 12.w),
            child: Text("Lưu",
                style: TextStyle(color: Colors.white, fontSize: 13.sp)),
          ),
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

  Future<void> _showPickerModalPopup(BuildContext context) {
    return showBarModalBottomSheet(
      context: context,
      //expand: true,
      builder: (BuildContext context1) {
        return Container(
          margin: EdgeInsets.symmetric(vertical: 8.h),
          height: 70.h,
          color: Colors.white,
          child: Row(
            children: [
              SizedBox(
                width: kDefaultPaddingWidthScreen,
              ),
              MediaButtonWidget(
                  icon: Icons.photo,
                  title: 'Thêm hình ảnh',
                  onTap: () {
                    context
                        .read<EditBoardCubit>()
                        .handlePickImage(ImageSource.gallery);
                    Navigator.pop(context);
                  }),
              SizedBox(
                width: kDefaultPaddingWidthScreen,
              ),
              MediaButtonWidget(
                  icon: Icons.camera_alt_rounded,
                  title: 'Chụp ảnh',
                  onTap: () {
                    context.read<EditBoardCubit>().getFromCamera();
                    Navigator.pop(context);
                  }),
              SizedBox(
                width: kDefaultPaddingWidthScreen,
              ),
            ],
          ),
        );
      },
    );
  }
}
