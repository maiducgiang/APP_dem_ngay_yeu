import 'package:flutter/material.dart';
import 'package:mubaha/ui/screen/main/home/widget/country/country_item.dart';
import 'package:mubaha/ui/theme/constant.dart';
import 'package:mubaha/ui/theme/translation_service.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mubaha/data/model/language/language_app.dart';

class ListCountry extends StatelessWidget {
  const ListCountry({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final List<LanguageAppModel> listCountry =
        LocalizationService.langCodeWithFlag;
    return Container(
      padding: const EdgeInsets.only(left: kDefaultPaddingScreen),
      margin: EdgeInsets.symmetric(vertical: 10.h),
      height: 70.h,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: listCountry.length,
        itemBuilder: (ctx, index) {
          final LanguageAppModel item = listCountry[index];
          return CountryItem(
            item: item,
            index: index,
          );
        },
      ),
    );
  }
}
