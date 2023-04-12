import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mubaha/ui/theme/constant.dart';
import 'package:mubaha/ui/theme/theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mubaha/data/model/language/language_app.dart';

class CountryItem extends StatelessWidget {
  const CountryItem({Key? key, required this.item, required this.index})
      : super(key: key);
  final LanguageAppModel item;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(left: index > 0 ? kDefaultPaddingScreen.w : 2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.zero,
              width: 46.w,
              height: 46.w,
              child: CachedNetworkImage(
                imageUrl: item.langFlag,
                imageBuilder: (context, image) => CircleAvatar(
                  backgroundImage: image,
                  radius: 23.r,
                ),
              ),
            ),
            SizedBox(
              height: kDefaultPaddingScreen.h - 6.h,
            ),
            Container(
              padding: EdgeInsets.zero,
              width: 60.w,
              child: Text(
                item.country,
                maxLines: 2,
                textAlign: TextAlign.center,
                style: textCategoryNameStyle.copyWith(height: 1.2),
              ),
            )
          ],
        ));
  }
}
