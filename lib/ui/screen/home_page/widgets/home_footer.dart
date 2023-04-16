import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';
import 'package:mubaha/data/cache_manager.dart';
import 'package:mubaha/ui/screen/home_page/cubit/home_page_cubit.dart';
import 'package:mubaha/ui/screen/home_page/entity/zodiac_model.dart';
import 'package:mubaha/ui/shared/utils/functions.dart';

import '../../../theme/app_path.dart';

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
                                    final ImagePicker picker = ImagePicker();
                                    final XFile? file = await picker.pickImage(
                                        source: ImageSource.gallery);
                                    if (file != null) {
                                      final Uint8List avatar =
                                          File(file.path).readAsBytesSync();

                                      box.put('my_avatar', avatar);
                                    }
                                  }
                                },
                                child: Container(
                                    height: 96.w,
                                    width: 96.w,
                                    decoration: ((box.get('my_avatar')) ==
                                                null ||
                                            (box.get('my_avatar'))
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
                                            (box.get('my_avatar'))
                                                .isEmpty),
                                            child: const Icon(Icons.add,
                                                color: Color(0xFFC2CEDB))))),
                              ),
                              SizedBox(width: 17.w),
                              GestureDetector(
                                onTap: () async {
                                  if (state.editing) {
                                    final ImagePicker picker = ImagePicker();
                                    final XFile? file = await picker.pickImage(
                                        source: ImageSource.gallery);
                                    if (file != null) {
                                      final Uint8List avatar =
                                          File(file.path).readAsBytesSync();

                                      box.put('my_lover_avatar', avatar);
                                    }
                                  }
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
                                            child: const Icon(Icons.add,
                                                color: Color(0xFFC2CEDB))))),
                              ),
                            ],
                          );
                        },
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: 16.w, right: 16.w, top: 20.h, bottom: 13.h),
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
          state.editing
              ? GestureDetector(
                  onTap: () {
                    showPopup(
                        context: context,
                        title: 'Tên của bạn',
                        onChanged: (value) {
                          CacheManager.instance.cacheBox.put('my_name', value);
                        },
                        onTapCancel: () {
                          CacheManager.instance.cacheBox.put('my_name', 'Tôi');
                          Navigator.pop(context);
                        },
                        onTapConfirm: () {
                          Navigator.pop(context);
                        });
                  },
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
                    decoration: BoxDecoration(
                        color: const Color(0xFFC2CEDB),
                        borderRadius: BorderRadius.circular(12)),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          child: ValueListenableBuilder<Box<dynamic>>(
                              valueListenable:
                                  CacheManager.instance.cacheBox.listenable(),
                              builder: (context, box, widget) {
                                return Text(
                                  box.get('my_name') ?? 'Tôi',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.w400),
                                );
                              }),
                        ),
                        SizedBox(width: 5.w),
                        Image.asset(AppPath.icEdit, height: 16, width: 16)
                      ],
                    ),
                  ),
                )
              : Text(
                  CacheManager.instance.cacheBox.get('my_name') ?? 'Tôi',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style:
                      TextStyle(fontWeight: FontWeight.w400, fontSize: 17.sp),
                ),
          SizedBox(height: 5.h),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  if (state.editing) {
                    showPopup(
                        context: context,
                        chooseGender: true,
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
                    return ((box.get('my_gender') as int?) ?? 0) == 0
                        ? Container(
                            padding: const EdgeInsets.all(3),
                            decoration: BoxDecoration(
                                color: const Color(0xFF00A7E5),
                                borderRadius: BorderRadius.circular(20)),
                            child: Row(
                              children: [
                                const Icon(Icons.male, color: Colors.white),
                                SizedBox(width: state.editing ? 5 : 0),
                                Visibility(
                                    visible: state.editing,
                                    child: Image.asset(AppPath.icEdit,
                                        height: 16, width: 16))
                              ],
                            ))
                        : Container(
                            padding: const EdgeInsets.all(3),
                            decoration: BoxDecoration(
                                color: const Color(0xFFF44336),
                                borderRadius: BorderRadius.circular(20)),
                            child: Row(
                              children: [
                                const Icon(Icons.female, color: Colors.white),
                                SizedBox(width: state.editing ? 5 : 0),
                                Visibility(
                                    visible: state.editing,
                                    child: Image.asset(AppPath.icEdit,
                                        height: 16, width: 16))
                              ],
                            ));
                  },
                ),
              ),
              SizedBox(width: 3.w),
              state.editing
                  ? Flexible(
                      child: ValueListenableBuilder<Box<dynamic>>(
                      valueListenable: CacheManager.instance.cacheBox.listenable(),
                      builder: (context, box, widget) {
                        return GestureDetector(
                          onTap: () {
                            _pickBirthday(context, pickMyBirthday: true);
                          },
                          child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 18, vertical: 8),
                          decoration: BoxDecoration(
                              color: const Color(0xFFC2CEDB),
                              borderRadius: BorderRadius.circular(12)),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                          children: [
                            Flexible(
                              child: FittedBox(
                                child: Text(
                                  ((box.get('my_zodiac') as Zodiac?)?.name??'').isEmpty ?
                                  'Chòm sao':(box.get('my_zodiac') as Zodiac?)?.name?? '',
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400
                                  ),
                                  maxLines: 1,
                                  textAlign: TextAlign.center,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                            const SizedBox(width: 5),
                            Image.asset(AppPath.icEdit, height: 16, width: 16)
                          ],
                        )
                      ),
                        );
                      },
                      ),
                    )
                  : ValueListenableBuilder<Box<dynamic>>(
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
                                visible: ((box.get('my_zodiac') as Zodiac?)?.name??'').isNotEmpty,
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
                                  ((box.get('my_zodiac') as Zodiac?)?.name??'').isEmpty ?
                                  'Chòm sao':(box.get('my_zodiac') as Zodiac?)?.name?? '',
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
                          )
                        ),
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
          state.editing
              ? GestureDetector(
                  onTap: () {
                    showPopup(
                        context: context,
                        title: 'Tên của người ấy',
                        onChanged: (value) {
                          CacheManager.instance.cacheBox
                              .put('my_lover_name', value);
                        },
                        onTapCancel: () {
                          CacheManager.instance.cacheBox
                              .put('my_lover_name', 'Người ấy');
                          Navigator.pop(context);
                        },
                        onTapConfirm: () {
                          Navigator.pop(context);
                        });
                  },
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
                    decoration: BoxDecoration(
                        color: const Color(0xFFC2CEDB),
                        borderRadius: BorderRadius.circular(12)),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          child: ValueListenableBuilder<Box<dynamic>>(
                              valueListenable:
                                  CacheManager.instance.cacheBox.listenable(),
                              builder: (context, box, widget) {
                                return Text(
                                  box.get('my_lover_name') ?? 'Người ấy',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.w400),
                                );
                              }),
                        ),
                        SizedBox(width: 5.w),
                        Image.asset(AppPath.icEdit, height: 16, width: 16)
                      ],
                    ),
                  ),
                )
              : Text(
                  CacheManager.instance.cacheBox.get('my_lover_name') ??
                      'Người ấy',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.end,
                  style:
                      TextStyle(fontWeight: FontWeight.w400, fontSize: 17.sp),
                ),
          SizedBox(height: 5.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              state.editing
                  ? Flexible(
                      child: ValueListenableBuilder<Box<dynamic>>(
                        valueListenable: CacheManager.instance.cacheBox.listenable(),
                        builder: (context, box, widget) {
                          return GestureDetector(
                            onTap: () {
                              _pickBirthday(context, pickMyBirthday: false);
                            },
                            child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 18, vertical: 8),
                            decoration: BoxDecoration(
                                color: const Color(0xFFC2CEDB),
                                borderRadius: BorderRadius.circular(12)),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                            children: [
                              Flexible(
                                child: FittedBox(
                                  child: Text(
                                    ((box.get('my_lover_zodiac') as Zodiac?)?.name??'').isEmpty ?
                                    'Chòm sao':(box.get('my_lover_zodiac') as Zodiac?)?.name?? '',
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 13,
                                        fontWeight: FontWeight.w400
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 5),
                              Image.asset(AppPath.icEdit, height: 16, width: 16)
                            ],
                          )
                        ),
                          );
                        },
                      ),
                    )
                  : ValueListenableBuilder<Box<dynamic>>(
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
                                  ((box.get('my_lover_zodiac') as Zodiac?)?.name??'').isEmpty ?
                                  'Chòm sao':(box.get('my_lover_zodiac') as Zodiac?)?.name?? '',
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
                                visible: ((box.get('my_lover_zodiac') as Zodiac?)?.name??'').isNotEmpty,
                                child: Image.asset(
                                  (box.get('my_lover_zodiac') as Zodiac?)?.icon ?? '',
                                  height: 16,
                                  width: 16,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          )
                        ),
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
                            child: Row(
                              children: [
                                const Icon(Icons.male, color: Colors.white),
                                SizedBox(width: state.editing ? 5 : 0),
                                Visibility(
                                    visible: state.editing,
                                    child: Image.asset(AppPath.icEdit,
                                        height: 16, width: 16))
                              ],
                            ))
                        : Container(
                            padding: const EdgeInsets.all(3),
                            decoration: BoxDecoration(
                                color: const Color(0xFFF44336),
                                borderRadius: BorderRadius.circular(20)),
                            child: Row(
                              children: [
                                const Icon(Icons.female, color: Colors.white),
                                SizedBox(width: state.editing ? 5 : 0),
                                Visibility(
                                    visible: state.editing,
                                    child: Image.asset(AppPath.icEdit,
                                        height: 16, width: 16))
                              ],
                            ));
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
                              CacheManager.instance.cacheBox.put(
                                  pickMyBirthday? 'my_zodiac' : 'my_lover_zodiac',
                                  zodiac
                              );
                            }),
                      ),
                    ),
                  ],
                )),
          );
        });
  }
}
