import 'package:auto_route/src/router/auto_router_x.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:mubaha/ui/shared/widget/search_bar/search_widget.dart';
import 'package:mubaha/ui/theme/constant.dart';

class SearchScreen extends StatelessWidget {
  final Function(String text)? onBack;
  TextEditingController _searchController = TextEditingController(text: '');
  SearchScreen({Key? key, this.onBack}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding:
              const EdgeInsets.symmetric(horizontal: kDefaultPaddingScreen),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  context.router.pop();
                },
                child: Container(
                  height: 35.h,
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.zero,
                  child: Icon(
                    Ionicons.chevron_back_outline,
                    size: 20.sp,
                  ),
                ),
              ),
              Expanded(
                  child: SearchWidget(
                autoFocus: true,
                searchController: _searchController,
                onFieldSubmitted: (text) {
                  onBack!.call(text);
                  context.router.pop();
                },
              )),
              //     Container(
              //   alignment: Alignment.center,
              //   margin: EdgeInsets.only(
              //       left: kDefaultPaddingScreen.w,
              //       right: kDefaultPaddingScreen.w,
              //       top: 3.h),
              //   padding: EdgeInsets.symmetric(horizontal: kDefaultPaddingScreen.w),
              //   height: 26.h,
              //   width: double.infinity,
              //   decoration: BoxDecoration(color: Colors.grey[100]),
              //   child: Row(
              //     crossAxisAlignment: CrossAxisAlignment.center,
              //     children: [
              //       Icon(
              //         Ionicons.search_outline,
              //         size: 16.sp,
              //         color: Colors.grey,
              //       )
              //     ],
              //   ),
              // )),
            ],
          ),
        ),
      ),
    );
  }
}
