import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mubaha/ui/theme/constant.dart';
import 'package:mubaha/ui/theme/theme.dart';

class DetailItemWidget extends StatelessWidget {
  final bool isLast;
  final bool isFirst;
  final bool isDone;
  final String label;
  final String schedule;
  const DetailItemWidget(
      {Key? key,
      this.isFirst = false,
      this.isLast = false,
      this.isDone = true,
      required this.label,
      required this.schedule})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30.w),
      height: 64.h,
      child: Row(
        children: [
          Column(
            children: [
              Expanded(
                  child: VerticalDivider(
                color: isLast ? Colors.transparent : primaryColor,
                thickness: 1.5.w,
              )),
              Container(
                height: 20.w,
                width: 20.w,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: isDone ? primaryColor : null,
                    border: isDone ? null : Border.all(color: secondaryColor)),
                child: isDone
                    ? Icon(
                        Icons.done,
                        color: Colors.white,
                        size: 15.w,
                      )
                    : Container(),
              ),
              Expanded(
                  child: VerticalDivider(
                color: isFirst
                    ? Colors.transparent
                    : isDone
                        ? primaryColor
                        : secondaryColor,
                thickness: 1.5.w,
              )),
            ],
          ),
          SizedBox(
            width: 20.w,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                    color: secondaryColor,
                    borderRadius: BorderRadius.circular(50)),
                child: Center(
                  child: Text(
                    label,
                    style: isDone
                        ? titleStyle
                        : titleStyle.copyWith(color: Colors.black38),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                child: Center(
                  child: Text(
                    schedule,
                    style: subTitleStyle,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
