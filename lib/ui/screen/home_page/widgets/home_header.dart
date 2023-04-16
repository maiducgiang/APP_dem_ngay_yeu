import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:mubaha/data/cache_manager.dart';

import '../../../theme/app_path.dart';
import '../../../theme/constant.dart';
import '../../main/review/widget/media_button_widget.dart';
import '../cubit/home_page_cubit.dart';

class HomeHeader extends StatefulWidget {
  final Function()? onTapSaveImage;
  const HomeHeader({Key? key, this.onTapSaveImage}) : super(key: key);

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
                padding: const EdgeInsets.only(
                    top: 16, bottom: 10, left: 16, right: 16),
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
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
              InkWell(
                onTap: () async {
                  _showPickerModalPopup(context,
                      box: CacheManager.instance.cacheBox);
                },
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
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
                padding: const EdgeInsets.only(
                    top: 16, bottom: 10, left: 16, right: 16),
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
                onTap: widget.onTapSaveImage,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
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

  Future<void> _showPickerModalPopup(BuildContext context, {required Box box}) {
    return showBarModalBottomSheet(
      context: context,
      //expand: true,
      builder: (BuildContext context1) {
        return Container(
          margin: EdgeInsets.symmetric(vertical: 8.h),
          height: 100.h,
          color: Colors.white,
          child: Row(
            children: [
              SizedBox(
                width: kDefaultPaddingWidthScreen,
              ),
              MediaButtonWidget(
                  icon: Icons.photo,
                  title: 'Thêm hình ảnh',
                  onTap: () async {
                    _pickBackground(imageSource: ImageSource.gallery);
                    Navigator.pop(context);
                  }),
              SizedBox(
                width: kDefaultPaddingWidthScreen,
              ),
              MediaButtonWidget(
                  icon: Icons.camera_alt_rounded,
                  title: 'Chụp ảnh',
                  onTap: () {
                    _pickBackground(imageSource: ImageSource.camera);
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

  _pickBackground({required ImageSource imageSource}) async {
    Navigator.pop(context);
    final ImagePicker picker = ImagePicker();
    final XFile? file = await picker.pickImage(source: imageSource);
    if (file != null) {
      CroppedFile? croppedFile = await ImageCropper().cropImage(
        sourcePath: file.path,
        aspectRatioPresets: [
          CropAspectRatioPreset.square,
          CropAspectRatioPreset.ratio3x2,
          CropAspectRatioPreset.original,
          CropAspectRatioPreset.ratio4x3,
          CropAspectRatioPreset.ratio16x9
        ],
        uiSettings: [
          AndroidUiSettings(
              toolbarTitle: 'Chỉnh sửa ảnh',
              toolbarColor: Colors.deepOrange,
              toolbarWidgetColor: Colors.white,
              initAspectRatio: CropAspectRatioPreset.original,
              lockAspectRatio: false),
          IOSUiSettings(
            title: 'Chỉnh sửa ảnh',
          ),
        ],
      );
      if (croppedFile != null) {
        final Uint8List background = await croppedFile.readAsBytes();
        CacheManager.instance.cacheBox.put('background_img', background);
      }
    }
  }
}
