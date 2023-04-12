import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mubaha/data/model/review/review_model.dart';
import 'package:mubaha/ui/shared/widget/divider/divider_widget.dart';
import 'package:mubaha/ui/theme/constant.dart';
import 'package:mubaha/ui/theme/theme.dart';

class ReviewWidget extends StatelessWidget {
  ReviewWidget({Key? key, required this.reviews}) : super(key: key);
  List<ReviewModel> reviews;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(kDefaultPaddingWidthWidget),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Đánh giá(${reviews.length.toString()})',
                style: subHeadingStyle.copyWith(color: titleColor),
              ),
              Text(
                'Xem tất cả',
                style: subTitleStyle.copyWith(color: primaryColor),
              ),
            ],
          ),
          Column(
            children: List.generate(2, (index) {
              return ReviewItem(
                isLast: index == 1,
                // review: reviews[index],
              );
            }),
          )
        ]));
  }
}

class ReviewItem extends StatelessWidget {
  final bool isLast;
  // final ReviewModel review;
  const ReviewItem({Key? key, this.isLast = false
      // , required this.review
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Row(
        //   children: [
        //     Container(
        //       margin: EdgeInsets.only(
        //           right: kDefaultPaddingWidthScreen,
        //           top: kDefaultPaddingHeightWidget,
        //           bottom: kDefaultPaddingHeightWidget),
        //       height: 45.h,
        //       width: 45.h,
        //       decoration: BoxDecoration(
        //           shape: BoxShape.circle,
        //           image: DecorationImage(
        //               image:
        //                   NetworkImage(review.reviewer.profile.avatar ?? ''))),
        //     ),
        //     Column(
        //       crossAxisAlignment: CrossAxisAlignment.start,
        //       mainAxisAlignment: MainAxisAlignment.center,
        //       children: [
        //         RichText(
        //             text: TextSpan(children: [
        //           TextSpan(
        //               text: review.reviewer.profile.fullName,
        //               style: subHeadingStyle.copyWith(color: titleColor)),
        //           TextSpan(
        //               text: ' | ',
        //               style: subHeadingStyle.copyWith(color: titleColor)),
        //           TextSpan(
        //               text: review.createAtFormat,
        //               style: subHeadingStyle.copyWith(color: titleColor))
        //         ])),
        //         SizedBox(
        //           height: 5.h,
        //         ),
        //         Row(
        //           children: List.generate(5, (index) {
        //             return Icon(
        //               Icons.star,
        //               size: 18.h,
        //               color: index >= review.rating
        //                   ? secondaryColor
        //                   : primaryColor,
        //             );
        //           }),
        //         ),
        //       ],
        //     )
        //   ],
        // ),
        // Text(
        //   review.content,
        //   style: subHeadingStyle.copyWith(
        //     color: contentColor,
        //     fontWeight: FontWeight.w400,
        //     height: 1.3,
        //   ),
        //   overflow: TextOverflow.ellipsis,
        //   maxLines: 2,
        // ),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin:
                  EdgeInsets.symmetric(vertical: kDefaultPaddingHeightScreen),
              padding: EdgeInsets.all(5.h),
              decoration: BoxDecoration(
                  color: secondaryColor45,
                  borderRadius: BorderRadius.circular(3.r)),
              child: Center(
                child: Text(
                  'Phân loại: Trắng, S',
                  style: subTitleStyle,
                ),
              ),
            ),
            // Row(
            //   children: [
            //     Icon(
            //       Ionicons.ios_heart_outline,
            //       size: 15.sp,
            //     ),
            //     SizedBox(
            //       width: 5.w,
            //     ),
            //     Text(
            //       '20',
            //       textAlign: TextAlign.end,
            //       style: TextStyle(fontSize: 10.sp),
            //     ),
            //     SizedBox(
            //       width: kDefaultPaddingWidthWidget,
            //     ),
            //     Icon(
            //       Ionicons.ios_heart_dislike_outline,
            //       size: 15.sp,
            //     ),
            //     SizedBox(
            //       width: 5.w,
            //     ),
            //     Text(
            //       '2',
            //       textAlign: TextAlign.end,
            //       style: TextStyle(fontSize: 10.sp),
            //     ),
            //   ],
            // ),
          ],
        ),
        isLast
            ? const SizedBox()
            : const DividerWidget(
                isSmall: true,
              )
      ],
    );
  }
}
