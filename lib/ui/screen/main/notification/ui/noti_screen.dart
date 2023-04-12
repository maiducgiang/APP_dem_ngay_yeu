import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mubaha/ui/screen/main/notification/ui/widget/noti_item_widget.dart';
import 'package:mubaha/ui/shared/widget/header/header.dart';
import 'package:mubaha/ui/theme/constant.dart';
import 'package:mubaha/ui/theme/theme.dart';

class NotiScreen extends StatelessWidget {
  const NotiScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          const Header(
            title: 'Thông báo',
            isBack: true,
          ),
          Expanded(
              child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 32.h,
                  margin: EdgeInsets.only(bottom: kDefaultPaddingHeightWidget),
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return NotiTypeItem(
                        isFirst: index == 0,
                        isSelect: index == 0,
                      );
                    },
                    itemCount: 6,
                  ),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return NotiItemWidget(
                      isLast: index == 9,
                    );
                  },
                  itemCount: 10,
                )
              ],
            ),
          ))
        ],
      )),
    );
  }
}

class NotiTypeItem extends StatelessWidget {
  final bool isSelect;
  final bool isFirst;
  const NotiTypeItem({Key? key, this.isSelect = false, this.isFirst = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          right: kDefaultPaddingWidthWidget,
          left: isFirst ? kDefaultPaddingWidthWidget : 0),
      padding: EdgeInsets.symmetric(horizontal: kDefaultPaddingWidthScreen),
      decoration: BoxDecoration(
          color: isSelect ? primaryColor : secondaryColor45,
          borderRadius: BorderRadius.circular(3)),
      child: Center(
        child: Text(
          'Tất cả',
          style: subTitleStyle.copyWith(
              color: isSelect ? Colors.white : Colors.black),
        ),
      ),
    );
  }
}
