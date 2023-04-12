import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mubaha/ui/shared/widget/button/primary_button.dart';
import 'package:mubaha/ui/theme/constant.dart';
import 'package:mubaha/ui/theme/theme.dart';

class DealWidget extends StatelessWidget {
  const DealWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(kDefaultPaddingWidthWidget),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Deals for you',
              style: subHeadingStyle.copyWith(color: titleColor),
            ),
            SizedBox(
              height: kDefaultPaddingHeightWidget,
            ),
            Text(
              'Enter code MULTIKART10 for 10% off',
              style: subTitlePrimaryColorStyle.copyWith(color: titleColor),
            ),
            SizedBox(
              height: 5.h,
            ),
            Text(
              'Enter MULTIKART10 to get 10% off the minimum order from 200,000 VND. Apply for the first order',
              style: subTitleStyle.copyWith(height: 1.3),
            ),
            SizedBox(
              height: kDefaultPaddingHeightWidget,
            ),
            Row(
              children: [
                Container(
                    width: 120,
                    margin: EdgeInsets.only(right: kDefaultPaddingWidthScreen),
                    child: PrimaryButton.outlineColor(
                      label: 'MULTIKART10',
                      textColor: titleColor,
                      backgroundColor: primaryColor5,
                    )),
                Text(
                  'Tap to copy',
                  style: subTitleStyle,
                )
              ],
            )
          ],
        ));
  }
}
