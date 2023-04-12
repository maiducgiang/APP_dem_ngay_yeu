import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:mubaha/ui/shared/widget/button/primary_button.dart';
import 'package:mubaha/ui/shared/widget/divider/divider_widget.dart';
import 'package:mubaha/ui/theme/constant.dart';
import 'package:mubaha/ui/theme/theme.dart';

class ReasonDeleteWidget extends StatefulWidget {
  final Function(String reason)? onBack;
  const ReasonDeleteWidget({Key? key, this.onBack}) : super(key: key);

  @override
  State<ReasonDeleteWidget> createState() => _ReasonDeleteWidgetState();
}

class _ReasonDeleteWidgetState extends State<ReasonDeleteWidget> {
  List<String> reasonList = [
    'Muốn nhập/thay đổi mã Voucher',
    'Muốn thay đổi sản phẩm trong đơn hàng(size, màu sắc, số lượng...)',
    'Thủ tục thanh toán quá rắc rối',
    'Tìm thấy giá rẻ hơn ở chỗ khác',
    'Đổi ý, không muốn mua nữa',
    'Khác'
  ];
  int val = -1;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: <Widget>[
          Container(
            height: 40.h,
            padding: EdgeInsets.symmetric(
              horizontal: 8.h,
            ),
            child: Center(
              child: Stack(
                children: [
                  Align(
                      alignment: Alignment.centerRight,
                      child: InkWell(
                          onTap: () {
                            context.router.pop();
                          },
                          child: Icon(Ionicons.close))),
                  Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Chọn lý do huỷ",
                        style: subHeadingStyle.copyWith(color: titleColor),
                        textAlign: TextAlign.center,
                      ))
                ],
              ),
            ),
          ),
          const DividerWidget(
            isSmall: true,
          ),
          Expanded(
              child: ListView.builder(
                  itemCount: reasonList.length,
                  itemBuilder: ((context, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          val = index;
                        });
                      },
                      child: ListTile(
                        title: Text(
                          reasonList[index],
                          style: TextStyle(height: 1.3.h),
                        ),
                        leading: Radio(
                          focusColor: primaryColor,
                          hoverColor: primaryColor,
                          value: index,
                          groupValue: val,
                          onChanged: (value) {
                            setState(() {
                              val = value as int;
                            });
                          },
                          activeColor: primaryColor,
                        ),
                      ),
                    );
                  }))),
          const DividerWidget(
            isSmall: true,
          ),
          Padding(
            padding: EdgeInsets.only(
                left: kDefaultPaddingWidthWidget,
                right: kDefaultPaddingWidthWidget,
                top: 8.h,
                bottom: kDefaultPaddingHeightWidget),
            child: PrimaryButton(
              label: 'Đồng ý',
              backgroundColor: val > -1 ? primaryColor : Colors.grey.shade400,
              onPressed: () {
                if (val > -1) {
                  context.router.pop();
                  widget.onBack!.call(reasonList[val]);
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
