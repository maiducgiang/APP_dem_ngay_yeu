import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mubaha/data/model/brand/brand.dart';
import 'package:mubaha/ui/screen/main/home/widget/banner/banner_item.dart';
import 'package:mubaha/ui/theme/app_path.dart';
import 'package:mubaha/ui/theme/constant.dart';

class ListBanner extends StatefulWidget {
  ListBanner({Key? key, required this.brand}) : super(key: key);
  final List<Brand> brand;

  @override
  ListBannerState createState() => ListBannerState();
}

class ListBannerState extends State<ListBanner> {
  int indexPage = 0;
  List<String> banners = [AppPath.banner1, AppPath.banner2, AppPath.banner3];
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: kDefaultPaddingScreen.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CarouselSlider(
                options: CarouselOptions(
                    height: 210.0,
                    autoPlay: true,
                    viewportFraction: 0.92,
                    reverse: false,
                    initialPage: indexPage,
                    onPageChanged: (index, item) {
                      setState(() {
                        indexPage = index;
                      });
                    },
                    enableInfiniteScroll: false
                    // enlargeCenterPage: true,
                    ),
                items: [0, 1, 2].map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return BannerItem(index: 1, bannerImage: banners[i]
                          // widget.brand[0].media!.featuredImage,
                          );
                    },
                  );
                }).toList()),
            SizedBox(
              height: kDefaultPaddingScreen.h,
            ),
            Container(
                alignment: Alignment.center,
                height: 5.h,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: 3,
                  itemBuilder: (ctx, index) {
                    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 2),
                      height: 6.h,
                      width: index == indexPage ? 26.w : 6.w,
                      decoration: BoxDecoration(
                          color: secondaryColor75,
                          borderRadius: BorderRadius.circular(3.r)),
                    );
                  },
                ))
          ],
        ));
  }
}
