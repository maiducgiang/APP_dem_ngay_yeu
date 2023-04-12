import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mubaha/ui/theme/app_path.dart';
import 'package:mubaha/ui/theme/constant.dart';

class SearchWidget extends StatelessWidget {
  final TextEditingController? searchController;
  final Function(String)? onFieldSubmitted;
  const SearchWidget(
      {Key? key,
      this.searchController,
      this.onFieldSubmitted,
      this.autoFocus = false})
      : super(key: key);
  final bool autoFocus;
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: SizedBox(
      height: 35.h,
      child: TextFormField(
          autofocus: autoFocus,
          onFieldSubmitted: onFieldSubmitted,
          controller: searchController,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.only(top: 18.h),
            enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.transparent),
                borderRadius: BorderRadius.circular(3)),
            focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.transparent),
                borderRadius: BorderRadius.circular(3)),
            hintText: 'Search',
            filled: true,
            fillColor: secondaryColor45,
            prefixIcon: Padding(
              padding: EdgeInsets.all(12.w),
              child: SvgPicture.asset(AppPath.searchIcon),
            ),
          )),
    ));
  }
}
