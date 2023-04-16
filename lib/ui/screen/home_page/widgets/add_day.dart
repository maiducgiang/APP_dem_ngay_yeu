import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mubaha/data/cache_manager.dart';
import 'package:mubaha/ui/screen/home_page/cubit/home_page_cubit.dart';
import 'package:mubaha/ui/screen/home_page/entity/home_model.dart';
import 'package:mubaha/ui/shared/utils/functions.dart';
import 'package:mubaha/ui/shared/widget/edit_popup.dart';
import 'package:mubaha/ui/theme/app_path.dart';

class AddDay extends StatefulWidget {
  const AddDay({Key? key}) : super(key: key);

  @override
  State<AddDay> createState() => _AddDayState();
}

class _AddDayState extends State<AddDay> {
  late final HomePageCubit _homePageCubit;

  @override
  void initState() {
    _homePageCubit = context.read<HomePageCubit>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomePageCubit, HomePageState>(
      builder: (context, state) {
        return state.editing
            ? GestureDetector(
                onTap: () {
                  showPopup(
                      context: context,
                      title: 'Điểm danh',
                      onChanged: (value) {
                        _homePageCubit.updateData(
                            homeModel: HomeModel(addMoreDayText: value));
                      },
                      onTapCancel: () {
                        _homePageCubit.updateData(
                            homeModel:
                                HomeModel(addMoreDayText: 'Yêu thêm ngày nữa'));
                        Navigator.pop(context);
                      },
                      onTapConfirm: () {
                        Navigator.pop(context);
                      });
                },
                child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 10),
                    margin: EdgeInsets.only(top: 19.h, left: 24.w, right: 24.w),
                    decoration: BoxDecoration(
                        color: const Color(0xFFC2CEDB),
                        borderRadius: BorderRadius.circular(16)),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Flexible(
                          child: Text(
                            (state.homeModel?.addMoreDayText?.isEmpty ?? true)
                                ? 'Yêu thêm ngày nữa'
                                : state.homeModel?.addMoreDayText ?? '',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                            style:
                                TextStyle(color: Colors.black, fontSize: 17.sp),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Image.asset(AppPath.icEdit, height: 16, width: 16)
                      ],
                    )),
              )
            : GestureDetector(
                onTap: () {
                  CacheManager.instance.cacheBox.put(
                      'love_count',
                      (CacheManager.instance.cacheBox.get('love_count') ?? 0) +
                          1);
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                  margin: EdgeInsets.only(top: 19.h, left: 24.w, right: 24.w),
                  decoration: BoxDecoration(
                      color: const Color(0xFFED5564),
                      borderRadius: BorderRadius.circular(16)),
                  child: Text(
                    (state.homeModel?.addMoreDayText?.isEmpty ?? true)
                        ? 'Yêu thêm ngày nữa'
                        : state.homeModel?.addMoreDayText ?? '',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 17.sp),
                  ),
                ),
              );
      },
    );
  }
}
