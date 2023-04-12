import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mubaha/data/model/product_detail_screen/product_detail_response.dart';
import 'package:mubaha/ui/screen/main/product_detail/cubit/variant_cubit.dart';
import 'package:mubaha/ui/screen/main/product_detail/cubit/variant_state.dart';
import 'package:mubaha/ui/theme/constant.dart';
import 'package:mubaha/ui/theme/theme.dart';

class MainInforWidget extends StatefulWidget {
  MainInforWidget({Key? key, required this.productDetail}) : super(key: key);
  final ProductDetail productDetail;

  @override
  State<MainInforWidget> createState() => _MainInforWidgetState();
}

class _MainInforWidgetState extends State<MainInforWidget> {
  final ValueNotifier<int> _currentSlide = ValueNotifier(0);

  ProductDetail get productDetail => widget.productDetail;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return BlocBuilder<VariantCubit, VariantState>(
      builder: (context, state) {
        // if (state is VariantFailed) {
        //   return ErrorOutput(message: state.message);
        // }
        if (!state.isLoading) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CarouselSlider(
                  items: productDetail.media.data!
                      .map((e) => Container(
                            color: secondaryColor,
                            child: Image.network(e.path),
                          ))
                      .toList(),
                  options: CarouselOptions(
                      height: size.width,
                      viewportFraction: 1,
                      enableInfiniteScroll: false,
                      onPageChanged: (index, reason) {
                        _currentSlide.value = index;
                      })),
              SizedBox(
                height: 12.h,
              ),
              ValueListenableBuilder(
                  valueListenable: _currentSlide,
                  builder: (context, value, _) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: productDetail.media.data!
                          .asMap()
                          .entries
                          .map((entry) {
                        return Container(
                          width:
                              _currentSlide.value == entry.key ? 30.w : 5.5.h,
                          height: 5.5.h,
                          margin: EdgeInsets.symmetric(horizontal: 2.5.w),
                          decoration: BoxDecoration(
                              color: secondaryColor,
                              borderRadius: BorderRadius.circular(3)),
                        );
                      }).toList(),
                    );
                  }),
              Padding(
                padding: EdgeInsets.all(kDefaultPaddingWidthWidget),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      productDetail.name,
                      style: headingStyle,
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Text(
                      productDetail.shortDescription!,
                      style: subTitleStyle.copyWith(height: 1.2.h),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.h),
                      child: Row(
                        children: List.generate(6, (index) {
                          // final int rateInt = productDetail.rate!.toInt();
                          final int rateInt = 0;
                          return index < 5
                              ? ShaderMask(
                                  blendMode: BlendMode.srcATop,
                                  shaderCallback: (Rect rect) {
                                    return LinearGradient(
                                      stops: index <= productDetail.rate!
                                          ? index < rateInt
                                              ? [0, 1, 1]
                                              : (productDetail.rate! -
                                                          rateInt) >=
                                                      0.5
                                                  ? [0, 0.5, 0.5]
                                                  : [0, 0, 0]
                                          : [0, 0, 0],
                                      colors: const [
                                        primaryColor,
                                        primaryColor,
                                        secondaryColor
                                      ],
                                    ).createShader(rect);
                                  },
                                  child: Icon(Icons.star, size: 20.h),
                                )
                              : Text(
                                  '(${productDetail.reviews!.length.toString()} đánh giá)',
                                  style: subTitleStyle,
                                );
                        }),
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          state.attributeIndex != null
                              ? productDetail
                                  .variants![state.variantIndex!]
                                  .attributes[state.attributeIndex!]
                                  .getCurrentPriceVariant
                                  .toString()
                              : productDetail.variants!.isEmpty
                                  ? productDetail.getCurrentPrice.toString()
                                  : state.variantIndex != null &&
                                          productDetail
                                              .variants![state.variantIndex!]
                                              .attributes
                                              .isEmpty
                                      ? productDetail
                                          .variants![state.variantIndex ?? 0]
                                          .getCurrentPriceVariant
                                          .toString()
                                      : productDetail.getCurrentPriceMin
                                              .toString() +
                                          '-' +
                                          productDetail.getCurrentPriceMax
                                              .toString(),
                          style: titleStyle.copyWith(
                              fontSize: 15.sp, fontWeight: FontWeight.w400),
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Text(' ${(productDetail.discount * 100).toInt()}%',
                            style: titleStyle.copyWith(
                                fontSize: 15.sp,
                                color: primaryColor,
                                fontWeight: FontWeight.w400)),
                      ],
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Text(
                        state.attributeIndex != null
                            ? productDetail
                                .variants![state.variantIndex!]
                                .attributes[state.attributeIndex!]
                                .getPriceVariant
                                .toString()
                            : productDetail.variants!.isEmpty
                                ? productDetail.getPrice.toString()
                                : state.variantIndex != null &&
                                        productDetail
                                            .variants![state.variantIndex!]
                                            .attributes
                                            .isEmpty
                                    ? productDetail
                                        .variants![state.variantIndex ?? 0]
                                        .getPriceVariant
                                        .toString()
                                    : productDetail.getPriceMin.toString() +
                                        '-' +
                                        productDetail.getPriceMax.toString(),
                        style: subTitleStyle.copyWith(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w400,
                            decoration: TextDecoration.lineThrough)),
                    SizedBox(
                      height: 5.h,
                    ),
                    Text(
                      'Đã bao gồm VAT',
                      style: subTitleStyle.copyWith(color: Colors.green),
                    )
                  ],
                ),
              ),
            ],
          );
        }
        return Container();
      },
    );
  }
}
