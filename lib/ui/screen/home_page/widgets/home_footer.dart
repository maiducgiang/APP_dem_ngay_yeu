import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:mubaha/data/cache_manager.dart';
import 'package:mubaha/ui/screen/home_page/cubit/home_page_cubit.dart';
import 'package:mubaha/ui/screen/home_page/entity/zodiac_model.dart';
import 'package:mubaha/ui/shared/utils/functions.dart';
import 'package:screenshot/screenshot.dart';

import '../../../theme/app_path.dart';
import '../../../theme/constant.dart';
import '../../main/review/widget/media_button_widget.dart';

class HomeFooter extends StatefulWidget {
  const HomeFooter({Key? key}) : super(key: key);

  @override
  State<HomeFooter> createState() => _HomeFooterState();
}

class _HomeFooterState extends State<HomeFooter> {
  late final HomePageCubit _homePageCubit;

  @override
  void initState() {
    _homePageCubit = context.read<HomePageCubit>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Image.asset(
              AppPath.cloud,
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 150, top: 50),
            child: Center(
              child: Lottie.asset(AppPath.lottieHeart,
                  fit: BoxFit.cover, width: 100),
            ),
          ),
          BlocBuilder<HomePageCubit, HomePageState>(
            builder: (context, state) {
              return Align(
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ValueListenableBuilder<Box<dynamic>>(
                        valueListenable:
                            CacheManager.instance.cacheBox.listenable(),
                        builder: (context, box, widget) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () async {
                                  if (state.editing) {
                                    _showModelBottomSheet(isMe: true);
                                  }
                                },
                                child: Container(
                                    height: 96.w,
                                    width: 96.w,
                                    decoration: ((box.get('my_avatar')) ==
                                                null ||
                                            (box.get('my_avatar')).isEmpty)
                                        ? BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: const Color(0xFFEFF2F7),
                                            border: Border.all(
                                                color: const Color(0xFFFF8686),
                                                width: 3.w),
                                          )
                                        : BoxDecoration(
                                            image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: MemoryImage(
                                                  box.get('my_avatar'),
                                                )),
                                            shape: BoxShape.circle,
                                            color: const Color(0xFFEFF2F7),
                                            border: Border.all(
                                                color: const Color(0xFFFF8686),
                                                width: 3.w),
                                          ),
                                    child: Center(
                                        child: Visibility(
                                            visible: ((box.get('my_avatar')) ==
                                                    null ||
                                                (box.get('my_avatar')).isEmpty),
                                            child: state.editing
                                                ? Image.asset(AppPath.icEdit,
                                                    height: 24, width: 24, color: Colors.grey)
                                                : const Icon(Icons.add,
                                                    color:
                                                        Color(0xFFC2CEDB))))),
                              ),
                              SizedBox(width: 17.w),
                              GestureDetector(
                                onTap: () async {
                                  _showModelBottomSheet(isMe: false);
                                },
                                child: Container(
                                    height: 96.w,
                                    width: 96.w,
                                    decoration: ((box.get('my_lover_avatar')) ==
                                                null ||
                                            (box.get('my_lover_avatar'))
                                                .isEmpty)
                                        ? BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: const Color(0xFFEFF2F7),
                                            border: Border.all(
                                                color: const Color(0xFFFF8686),
                                                width: 3.w),
                                          )
                                        : BoxDecoration(
                                            image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: MemoryImage(
                                                  box.get('my_lover_avatar'),
                                                )),
                                            shape: BoxShape.circle,
                                            color: const Color(0xFFEFF2F7),
                                            border: Border.all(
                                                color: const Color(0xFFFF8686),
                                                width: 3.w),
                                          ),
                                    child: Center(
                                        child: Visibility(
                                            visible:
                                                (box.get('my_lover_avatar')) ==
                                                        null ||
                                                    (box.get('my_lover_avatar'))
                                                        .isEmpty,
                                            child: state.editing
                                                ? Image.asset(AppPath.icEdit,
                                                    height: 24, width: 24, color: Colors.grey)
                                                :const Icon(Icons.add,
                                                color: Color(0xFFC2CEDB))))),
                              ),
                            ],
                          );
                        },
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: 16.w, right: 16.w, top: 20.h, bottom: 20.h),
                        child: Row(
                          children: [
                            _me(state),
                            SizedBox(width: 30.w),
                            _myLover(state)
                          ],
                        ),
                      )
                    ],
                  ));
            },
          ),
        ],
      ),
    );
  }

  Widget _me(HomePageState state) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            CacheManager.instance.cacheBox.get('my_name') ?? 'Tôi',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontWeight: FontWeight.w400, fontSize: 17.sp),
          ),
          SizedBox(height: 5.h),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {},
                child: ValueListenableBuilder<Box<dynamic>>(
                  valueListenable: CacheManager.instance.cacheBox.listenable(),
                  builder: (context, box, widget) {
                    return ((box.get('my_gender') as int?) ?? 0) == 0
                        ? Container(
                            padding: const EdgeInsets.all(3),
                            decoration: BoxDecoration(
                                color: const Color(0xFF00A7E5),
                                borderRadius: BorderRadius.circular(20)),
                            child: const Icon(Icons.male, color: Colors.white))
                        : Container(
                            padding: const EdgeInsets.all(3),
                            decoration: BoxDecoration(
                                color: const Color(0xFFF44336),
                                borderRadius: BorderRadius.circular(20)),
                            child:
                                const Icon(Icons.female, color: Colors.white));
                  },
                ),
              ),
              SizedBox(width: 3.w),
              ValueListenableBuilder<Box<dynamic>>(
                valueListenable: CacheManager.instance.cacheBox.listenable(),
                builder: (context, box, widget) {
                  return Flexible(
                    child: Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 8.h, horizontal: 12.w),
                        decoration: BoxDecoration(
                            color: const Color(0xFFFF8686),
                            borderRadius: BorderRadius.circular(45)),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Visibility(
                              visible:
                                  ((box.get('my_zodiac') as Zodiac?)?.name ??
                                          '')
                                      .isNotEmpty,
                              child: Image.asset(
                                (box.get('my_zodiac') as Zodiac?)?.icon ?? '',
                                height: 16,
                                width: 16,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(width: 5),
                            Flexible(
                              child: Text(
                                ((box.get('my_zodiac') as Zodiac?)?.name ?? '')
                                        .isEmpty
                                    ? 'Chòm sao'
                                    : (box.get('my_zodiac') as Zodiac?)?.name ??
                                        '',
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        )),
                  );
                },
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _myLover(HomePageState state) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            CacheManager.instance.cacheBox.get('my_lover_name') ?? 'Người ấy',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.end,
            style: TextStyle(fontWeight: FontWeight.w400, fontSize: 17.sp),
          ),
          SizedBox(height: 5.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ValueListenableBuilder<Box<dynamic>>(
                valueListenable: CacheManager.instance.cacheBox.listenable(),
                builder: (context, box, widget) {
                  return Flexible(
                    child: Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 8.h, horizontal: 12.w),
                        decoration: BoxDecoration(
                            color: const Color(0xFFFF8686),
                            borderRadius: BorderRadius.circular(45)),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Flexible(
                              child: Text(
                                ((box.get('my_lover_zodiac') as Zodiac?)
                                                ?.name ??
                                            '')
                                        .isEmpty
                                    ? 'Chòm sao'
                                    : (box.get('my_lover_zodiac') as Zodiac?)
                                            ?.name ??
                                        '',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                            const SizedBox(width: 5),
                            Visibility(
                              visible: ((box.get('my_lover_zodiac') as Zodiac?)
                                          ?.name ??
                                      '')
                                  .isNotEmpty,
                              child: Image.asset(
                                (box.get('my_lover_zodiac') as Zodiac?)?.icon ??
                                    '',
                                height: 16,
                                width: 16,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        )),
                  );
                },
              ),
              SizedBox(width: 3.w),
              GestureDetector(
                onTap: () {
                  if (state.editing) {
                    showPopup(
                        context: context,
                        chooseGender: true,
                        chooseMyGender: false,
                        onTapCancel: () {
                          Navigator.pop(context);
                        },
                        onTapConfirm: () {
                          Navigator.pop(context);
                        });
                  }
                },
                child: ValueListenableBuilder<Box<dynamic>>(
                  valueListenable: CacheManager.instance.cacheBox.listenable(),
                  builder: (context, box, widget) {
                    return ((box.get('my_lover_gender') as int?) ?? 1) == 0
                        ? Container(
                            padding: const EdgeInsets.all(3),
                            decoration: BoxDecoration(
                                color: const Color(0xFF00A7E5),
                                borderRadius: BorderRadius.circular(20)),
                            child: const Icon(Icons.male, color: Colors.white))
                        : Container(
                            padding: const EdgeInsets.all(3),
                            decoration: BoxDecoration(
                                color: const Color(0xFFF44336),
                                borderRadius: BorderRadius.circular(20)),
                            child:
                                const Icon(Icons.female, color: Colors.white));
                  },
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  _pickBirthday(BuildContext context, {bool pickMyBirthday = true}) {
    showCupertinoModalPopup(
        context: context,
        builder: (context) {
          return Material(
            child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.3,
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(
                          top: 16, bottom: 10, left: 16, right: 16),
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(12),
                            topLeft: Radius.circular(12),
                          )),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: const Text(
                              'Huỷ',
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xFFFF8686)),
                            ),
                          ),
                          const Text(
                            'Ngày sinh',
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF2C3F55)),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: const Text(
                              'Xong',
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xFFFF8686)),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: DecoratedBox(
                        decoration:
                            BoxDecoration(color: Colors.grey.withOpacity(0.2)),
                        child: CupertinoDatePicker(
                            mode: CupertinoDatePickerMode.date,
                            onDateTimeChanged: (value) {
                              ZodiacSign zodiacSign = getZodiacSign(value);
                              Zodiac? zodiac = getZodiac(zodiacSign);
                              String birthday =
                                  '${value.day}-${value.month}-${value.year}';
                              CacheManager.instance.cacheBox.put(
                                  pickMyBirthday
                                      ? 'my_zodiac'
                                      : 'my_lover_zodiac',
                                  zodiac);
                              CacheManager.instance.cacheBox.put(
                                  pickMyBirthday
                                      ? 'my_birthday'
                                      : 'my_lover_birthday',
                                  birthday);
                            }),
                      ),
                    ),
                  ],
                )),
          );
        });
  }

  Future<void> _pickAvatar(
      {required String key,
      required Box box,
      required ImageSource imageSource}) async {
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
        final Uint8List avatar = await croppedFile.readAsBytes();
        box.put(key, avatar);
      }
    }
  }

  Future<void> _showPickerModalPopup(BuildContext context,
      {required String key, required Box box}) {
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
                  onTap: () {
                    _pickAvatar(
                        key: key, box: box, imageSource: ImageSource.gallery);
                    Navigator.pop(context);
                  }),
              SizedBox(
                width: kDefaultPaddingWidthScreen,
              ),
              MediaButtonWidget(
                  icon: Icons.camera_alt_rounded,
                  title: 'Chụp ảnh',
                  onTap: () {
                    _pickAvatar(
                        key: key, box: box, imageSource: ImageSource.camera);
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

  Future<void> _showModelBottomSheet({required bool isMe}) async {
    String avatarKey = isMe ? 'my_avatar' : 'my_lover_avatar';
    String nameKey = isMe ? 'my_name' : 'my_lover_name';
    String genderKey = isMe ? 'my_gender' : 'my_lover_gender';
    String birthdayKey = isMe ? 'my_birthday' : 'my_lover_birthday';
    // String zodiacKey = isMe ? 'my_zodiac' : 'my_lover_zodiac';

    showModalBottomSheet(
        context: context,
        backgroundColor: Colors.white,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        builder: (context) {
          return FractionallySizedBox(
            heightFactor: 0.8,
            child: Column(
              children: [
                const SizedBox(height: 14),
                const Text(
                  'Sửa thông tin',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 34),
                ValueListenableBuilder<Box<dynamic>>(
                  valueListenable: CacheManager.instance.cacheBox.listenable(),
                  builder: (context, box, child) {
                    return GestureDetector(
                      onTap: () {
                        _showPickerModalPopup(context,
                            key: avatarKey, box: box);
                      },
                      child: Container(
                          height: 96.w,
                          width: 96.w,
                          decoration: ((box.get(avatarKey)) == null ||
                                  (box.get(avatarKey)).isEmpty)
                              ? BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: const Color(0xFFEFF2F7),
                                  border: Border.all(
                                      color: const Color(0xFFFF8686),
                                      width: 3.w),
                                )
                              : BoxDecoration(
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: MemoryImage(
                                        box.get(avatarKey),
                                      )),
                                  shape: BoxShape.circle,
                                  color: const Color(0xFFEFF2F7),
                                  border: Border.all(
                                      color: const Color(0xFFFF8686),
                                      width: 3.w),
                                ),
                          child: Center(
                              child: Visibility(
                                  visible: ((box.get(avatarKey)) == null ||
                                      (box.get(avatarKey)).isEmpty),
                                  child: Image.asset(AppPath.icEdit,
                                      height: 24, width: 24, color: Colors.grey)))),
                    );
                  },
                ),
                const SizedBox(height: 34),
                Expanded(
                    child: ListView(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  children: [
                    InkWell(
                      onTap: () {
                        showPopup(
                            context: context,
                            title: isMe ? 'Tên của bạn' : 'Tên người ấy',
                            onChanged: (value) {
                              CacheManager.instance.cacheBox
                                  .put(nameKey, value);
                            },
                            onTapCancel: () {
                              CacheManager.instance.cacheBox
                                  .put(nameKey, isMe ? 'Tôi' : 'Người ấy');
                              Navigator.pop(context);
                            },
                            onTapConfirm: () {
                              Navigator.pop(context);
                            });
                      },
                      child: Row(
                        children: [
                          const Text(
                            'Tên',
                            style: TextStyle(
                                fontWeight: FontWeight.w400, fontSize: 15),
                          ),
                          const SizedBox(width: 30),
                          Expanded(
                            child: ValueListenableBuilder<Box<dynamic>>(
                              valueListenable:
                                  CacheManager.instance.cacheBox.listenable(),
                              builder: (context, box, child) {
                                return Text(
                                  ((box.get(nameKey) as String?) ?? '').isEmpty
                                      ? isMe
                                          ? 'Tôi'
                                          : 'Người ấy'
                                      : (box.get(nameKey)) as String,
                                  maxLines: 3,
                                  textAlign: TextAlign.end,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 15),
                                );
                              },
                            ),
                          ),
                          const SizedBox(width: 10),
                          const Icon(Icons.arrow_forward_ios_sharp, size: 15)
                        ],
                      ),
                    ),
                    const SizedBox(height: 30),
                    InkWell(
                      onTap: () {
                        _pickBirthday(context, pickMyBirthday: isMe);
                      },
                      child: Row(
                        children: [
                          const Text(
                            'Ngày sinh',
                            style: TextStyle(
                                fontWeight: FontWeight.w400, fontSize: 15),
                          ),
                          const SizedBox(width: 30),
                          Expanded(
                            child: ValueListenableBuilder<Box<dynamic>>(
                              valueListenable:
                                  CacheManager.instance.cacheBox.listenable(),
                              builder: (context, box, child) {
                                return Text(
                                  ((box.get(birthdayKey) as String?) ?? '')
                                          .isEmpty
                                      ? 'Chọn'
                                      : (box.get(birthdayKey)) as String,
                                  textAlign: TextAlign.end,
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 15),
                                );
                              },
                            ),
                          ),
                          const SizedBox(width: 10),
                          const Icon(Icons.arrow_forward_ios_sharp, size: 15)
                        ],
                      ),
                    ),
                    const SizedBox(height: 30),
                    InkWell(
                      onTap: () {
                        showPopup(
                            context: context,
                            chooseGender: true,
                            chooseMyGender: isMe,
                            title: 'Giới tính',
                            onTapCancel: () {
                              Navigator.pop(context);
                            },
                            onTapConfirm: () {
                              Navigator.pop(context);
                            });
                      },
                      child: Row(
                        children: [
                          const Text(
                            'Giới tính',
                            style: TextStyle(
                                fontWeight: FontWeight.w400, fontSize: 15),
                          ),
                          const SizedBox(width: 30),
                          Expanded(
                            child: ValueListenableBuilder<Box<dynamic>>(
                              valueListenable:
                                  CacheManager.instance.cacheBox.listenable(),
                              builder: (context, box, child) {
                                return Text(
                                  ((box.get('my_gender') as int?) ?? 0) == 0
                                      ? 'Nam'
                                      : 'Nữ',
                                  maxLines: 3,
                                  textAlign: TextAlign.end,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 15),
                                );
                              },
                            ),
                          ),
                          const SizedBox(width: 10),
                          const Icon(Icons.arrow_forward_ios_sharp, size: 15)
                        ],
                      ),
                    ),
                  ],
                )),
                Padding(
                  padding:
                      const EdgeInsets.only(bottom: 32, left: 40, right: 40),
                  child: Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                            _homePageCubit.changeEditing(editing: false);
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 13.h),
                            decoration: BoxDecoration(
                                color: const Color(0xFFFF8686),
                                borderRadius: BorderRadius.circular(12)),
                            child: const Center(
                              child: Text(
                                'Huỷ',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 12.w),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                            _homePageCubit.changeEditing(editing: false);
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 13.h),
                            decoration: BoxDecoration(
                                color: const Color(0xFFFFF0F0),
                                borderRadius: BorderRadius.circular(12)),
                            child: const Center(
                              child: Text(
                                'Lưu',
                                style: TextStyle(
                                    color: Color(0xFFFF8686),
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        });
  }
}
