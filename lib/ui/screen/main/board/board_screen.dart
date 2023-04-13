import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:mubaha/ui/router/router.gr.dart';
import 'package:mubaha/ui/screen/main/review/widget/media_button_widget.dart';
import 'package:mubaha/ui/shared/widget/header/header.dart';
import 'package:mubaha/ui/theme/constant.dart';
import 'package:mubaha/ui/theme/theme.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:path/path.dart' as p;

class BoardScreen extends StatefulWidget {
  const BoardScreen({Key? key}) : super(key: key);

  @override
  State<BoardScreen> createState() => _BoardScreenState();
}

class _BoardScreenState extends State<BoardScreen> {
  final ImagePicker imagePicker = ImagePicker();
  File? imageFile;
  List<XFile> imageFileList = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: secondaryColor75,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            context.router.push(EditBoardPage());
          },
          backgroundColor: primaryColor,
          elevation: 0,
          child: Icon(
            Icons.add,
            color: Colors.white,
            size: 26.sp,
          ),
        ),
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        height: 70.h,
                        alignment: Alignment.center,
                        child: Row(
                          children: [
                            Container(
                              padding: EdgeInsets.only(left: 16.h),
                              width: 32.sp,
                            ),
                            Expanded(
                              child: Container(
                                alignment: Alignment.center,
                                margin: EdgeInsets.symmetric(vertical: 12.h),
                                child: Text(
                                  "Kỷ niệm ",
                                  style: headerTitleStyle,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(right: 16.h),
                              alignment: Alignment.center,
                              child: SvgPicture.asset(
                                "assets/images/icons/icon_search.svg",
                                color: greyPrymaryColor,
                                width: 24.sp,
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        //margin: EdgeInsets.symmetric(vertical: 8.h),
                        child: Text(
                          "Bạn có 3 kỷ niệm",
                          style: TextStyle(
                              color: greyPrymaryColor, fontSize: 13.sp),
                        ),
                      ),
                      ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: 5,
                          itemBuilder: (context, index) {
                            return ItemBoard(
                                title: "Trời đổ mưa sao em còn chưa đổ anh ",
                                image: imageFileList,
                                time: DateTime.now());
                            // productWidget(widget.orderDocs!.products[index]);
                          }),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  Widget ItemBoard(
      {required String title,
      DateTime? time,
      Function()? onPress,
      List<XFile>? image}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: GestureDetector(
        onTap: onPress,
        child: Container(
          //height: 52.h,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            //mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.center,
                width: 72.w,
                child: Column(
                  children: [
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      "Thg4/Thứ 3 \n 2023",
                      textAlign: TextAlign.center,
                      style: subTitleStyle.copyWith(
                          fontSize: 11.sp, color: greyPrymaryColor),
                    ),
                    SizedBox(
                      height: 6.h,
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
                      decoration: BoxDecoration(
                          color: greyPrymaryColor,
                          borderRadius: BorderRadius.circular(20.w)),
                      child: Text(
                        "2 ngày",
                        textAlign: TextAlign.center,
                        style: subTitleStyle.copyWith(
                            fontSize: 11.sp, color: Colors.white),
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12.r)),
                  padding: EdgeInsets.all(14.w),
                  //padding: ,
                  margin: EdgeInsets.only(right: 12.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: titleStyle.copyWith(
                            height: 1.h,
                            wordSpacing: 0.2.w,
                            letterSpacing: 0.5.w,
                            fontSize: 15.sp,
                            color: Color(0xff1C2433)),
                      ),
                      image != null && image.isNotEmpty
                          ? Container(
                              height: 60.h,
                              margin: EdgeInsets.symmetric(vertical: 14.h),
                              child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: image.length,
                                  itemBuilder: (context, index) {
                                    return Container(
                                      width: 60.h,
                                      margin: EdgeInsets.only(right: 10.w),
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        child: Image.file(
                                          File(image[index].path),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    );
                                  }),
                            )
                          : Container(
                              height: 20.h,
                            ),
                      Container(
                        //margin: EdgeInsets.symmetric(vertical: 12.h),
                        child: Text(
                          "14:23 Thứ 3",
                          style: subTitleStyle.copyWith(
                              fontSize: 11.sp, color: greyPrymaryColor),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  handlePickImage(ImageSource source) async {
    // isLoadingUpdateImage(true);
    final permission =
        source == ImageSource.camera ? Permission.camera : ImageSource.gallery;

    final pickedFile = await imagePicker.pickImage(
      source: source,
    );
    if (pickedFile == null) {
      return;
    }

    final fileExtension = p.extension(pickedFile.path).replaceAll('.', '');
    if (fileExtension != 'png' &&
        fileExtension != 'jpg' &&
        fileExtension != 'jpeg') {
      setState(() {
        if (pickedFile != null) imageFileList.add(pickedFile);
      });
    }
  }

  _getFromCamera() async {
    final XFile? pickedFile = await imagePicker.pickImage(
      source: ImageSource.camera,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    setState(() {
      if (pickedFile != null) imageFileList.add(pickedFile);
    });
  }

  Widget imageItem() {
    ImagePicker picker = ImagePicker();
    XFile? image;
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: 32.h,
        height: 32.h,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(12.r)),
        child: Container(),
      ),
    );
  }

  Future<void> _showPickerModalPopup() {
    return showBarModalBottomSheet(
      context: context,
      expand: true,
      builder: (BuildContext context1) {
        return Container(
          margin: EdgeInsets.symmetric(vertical: 8.h),
          height: 50.h,
          color: Colors.white,
          child: Row(
            children: [
              MediaButtonWidget(
                  icon: Icons.photo,
                  title: 'Thêm hình ảnh',
                  onTap: () {
                    handlePickImage(ImageSource.gallery);
                  }),
              SizedBox(
                width: kDefaultPaddingWidthScreen,
              ),
              MediaButtonWidget(
                  icon: Icons.camera_alt_rounded,
                  title: 'Chụp ảnh',
                  onTap: () {
                    _getFromCamera();
                  }),
            ],
          ),
        );
      },
    );
  }
}
