import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:mubaha/ui/theme/constant.dart';
import 'package:mubaha/ui/theme/theme.dart';

class CheckWidget extends StatelessWidget {
  const CheckWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(kDefaultPaddingWidthWidget),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            'Check your order',
            style: subHeadingStyle.copyWith(color: titleColor),
          ),
          Text(
            'Enter the code to check order information',
            style: subTitleStyle.copyWith(height: 2),
          ),
          SizedBox(
            height: kDefaultPaddingHeight,
          ),
          TextFormField(
            decoration: InputDecoration(
                isDense: true,
                contentPadding: EdgeInsets.all(kDefaultPaddingWidthScreen),
                filled: true,
                fillColor: secondaryColor45,
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      5.r,
                    ),
                    borderSide: const BorderSide(
                      color: Colors.transparent,
                    )),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      5.r,
                    ),
                    borderSide: const BorderSide(
                      color: Colors.transparent,
                    )),
                hintText: 'Code',
                hintStyle: subHeadingStyle,
                suffix: Text(
                  'Check',
                  style: subTitleStyle.copyWith(color: primaryColor),
                )),
          ),
          const CheckItem(
            icon: Icons.local_shipping_outlined,
            title: 'Free delivery for orders from 200,000 VND',
          ),
          const CheckItem(icon: Icons.payment, title: 'Payment on delivery'),
          const CheckItem(
              icon: Icons.change_circle_outlined,
              title: 'Exchange and refund within 21 days')
        ]));
  }
}

class CheckItem extends StatelessWidget {
  final IconData icon;
  final String title;
  const CheckItem({Key? key, required this.icon, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: kDefaultPaddingHeightScreen),
      child: Row(
        children: [
          Icon(
            icon,
            color: contentColor,
          ),
          SizedBox(
            width: kDefaultPaddingWidthScreen,
          ),
          Text(
            title,
            style: subHeadingStyle.copyWith(fontWeight: FontWeight.w400),
          )
        ],
      ),
    );
  }
}
