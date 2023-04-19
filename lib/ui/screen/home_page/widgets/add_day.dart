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
  final Function()? onTap;
  final bool enable;
  const AddDay({Key? key, this.onTap, this.enable = false}) : super(key: key);

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
        return GestureDetector(
                onTap: widget.onTap,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                  margin: EdgeInsets.only(top: 19.h, left: 24.w, right: 24.w),
                  decoration: BoxDecoration(
                      color: widget.enable ? Color(0xFFED5564): Colors.grey,
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
