import 'dart:typed_data';
import 'package:auto_route/auto_route.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mubaha/ui/theme/constant.dart';
import 'package:mubaha/ui/theme/theme.dart';

class ShowImageScreen extends StatefulWidget {
  const ShowImageScreen({Key? key, required this.image}) : super(key: key);
  final List<Uint8List> image;
  @override
  State<ShowImageScreen> createState() => _ShowImageScreenState();
}

class _ShowImageScreenState extends State<ShowImageScreen> {
  final CarouselController _slideController = CarouselController();
  final ValueNotifier<int> _currentSlide = ValueNotifier(0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColorSecond,
      appBar: AppBar(
          elevation: 0,
          backgroundColor: backgroundColorSecond,
          leading: Container(
            alignment: Alignment.center,
            child: GestureDetector(
              onTap: () {
                context.router.pop();
              },
              child: Icon(
                Icons.close_sharp,
                size: 24.sp,
                color: Colors.white,
              ),
            ),
          )),
      body: SafeArea(
          child: Column(
        //mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 50.h,
          ),
          Container(
            height: 400.h,
            width: double.infinity,
            //color: Colors.white,
            child: CarouselSlider(
              items: widget.image
                  .map(
                    (e) => Image.memory(e),
                  )
                  .toList(),
              carouselController: _slideController,
              options: CarouselOptions(
                  height: double.infinity,
                  enableInfiniteScroll: false,
                  enlargeCenterPage: true,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _currentSlide.value = index;
                    });
                  }),
            ),
          ),
          Expanded(
              child: Container(
            alignment: Alignment.center,
            child: Text(
              "${_currentSlide.value + 1}/${widget.image.length}",
              style: titleStyle.copyWith(color: Colors.white),
            ),
          ))
        ],
      )),
    );
  }
}
