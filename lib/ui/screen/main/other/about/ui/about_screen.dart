import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mubaha/ui/shared/widget/header/header.dart';
import 'package:mubaha/ui/theme/constant.dart';
import 'package:mubaha/ui/theme/theme.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          const Header(title: 'Giới thiệu Mubaha', isBack: true),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: kDefaultPaddingWidthWidget),
                child: Column(
                  children: [
                    Container(
                      height: 146.h,
                      margin:
                          EdgeInsets.only(bottom: kDefaultPaddingHeightWidget),
                      decoration: BoxDecoration(
                          color: secondaryColor,
                          borderRadius: BorderRadius.circular(3)),
                    ),
                    const AboutItem(
                        ruleTitle:
                            'Mubaha là điểm đến thời trang hàng đầu với những xu hướng mới nhất và phong cách hot nhất.',
                        ruleContent:
                            'Phân đoạn tiêu chuẩn của Lorem Ipsum được sử dụng từ những năm 1500 được tái tạo bên dưới cho những người quan tâm. Các phần 1.10.32 và 1.10.33 từ "de Finibus Bonorum et Malorum" của Cicero cũng được biên tập lại ở dạng nguyên bản chính xác của chúng.'),
                    Container(
                      margin: EdgeInsets.symmetric(
                          vertical: kDefaultPaddingHeightWidget),
                      child: GridView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisSpacing: kDefaultPaddingWidthWidget,
                            mainAxisSpacing: kDefaultPaddingWidthWidget,
                            childAspectRatio:
                                (MediaQuery.of(context).size.width -
                                        kDefaultPaddingWidthWidget * 2) /
                                    (MediaQuery.of(context).size.height / 4),
                            crossAxisCount: 2),
                        itemBuilder: (context, index) {
                          return AchievementItem();
                        },
                        itemCount: 4,
                      ),
                    ),
                    const AboutItem(
                        ruleTitle: 'Thương hiệu',
                        ruleContent:
                            'Mỗi thương hiệu có một cá tính độc đáo và thiết kế độc quyền. Họ có quyền tự do phát triển các phong cách và hàng may mặc tạo ra sự hấp dẫn đúng đắn - và tất cả các thương hiệu của chúng tôi đều thống nhất'),
                    GridView.builder(
                      padding: EdgeInsets.only(top: kDefaultPaddingScreen.h),
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        childAspectRatio: 3,
                        mainAxisSpacing: kDefaultPaddingScreen.w,
                        crossAxisSpacing: kDefaultPaddingScreen.w,
                      ),
                      itemCount: 6,
                      itemBuilder: (context, index) {
                        return Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: secondaryColor,
                              border:
                                  Border.all(color: secondaryColor, width: 1.w),
                              borderRadius: BorderRadius.circular(3.r)),
                          child: Text(
                            'Logo',
                            style: titleStyle,
                          ),
                        );
                      },
                    ),
                    SizedBox(
                      height: kDefaultPaddingHeightWidget,
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      )),
    );
  }
}

class AboutItem extends StatelessWidget {
  final String ruleTitle;
  final String ruleContent;
  const AboutItem(
      {Key? key, required this.ruleTitle, required this.ruleContent})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          ruleTitle,
          style: titleStyle.copyWith(fontWeight: FontWeight.w600),
        ),
        SizedBox(
          height: kDefaultPaddingHeightScreen,
        ),
        Text(ruleContent,
            style: titleStyle.copyWith(
                fontWeight: FontWeight.w400, color: contentColor, height: 1.h))
      ],
    );
  }
}

class AchievementItem extends StatelessWidget {
  const AchievementItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(kDefaultPaddingWidthScreen),
      decoration: BoxDecoration(
          color: secondaryColor45, borderRadius: BorderRadius.circular(3)),
      child: Column(
        children: [
          Row(
            children: [
              Icon(
                Icons.group,
                size: 40,
              ),
              SizedBox(
                width: kDefaultPaddingWidthScreen,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '3000+',
                    style: titleStyle,
                  ),
                  Text(
                    'Người dùng',
                    style: titleStyle,
                  )
                ],
              )
            ],
          ),
          Text(
            'Mubaha có hơn 150 người đăng ký cửa hàng trực tuyến',
            style: subTitleStyle,
          )
        ],
      ),
    );
  }
}
