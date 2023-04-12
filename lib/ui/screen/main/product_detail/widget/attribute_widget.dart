import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:mubaha/data/model/product_detail_screen/product_detail_response.dart';
import 'package:mubaha/translations/locale_keys.g.dart';
import 'package:mubaha/ui/screen/main/product_detail/cubit/variant_cubit.dart';
import 'package:mubaha/ui/shared/widget/amount_widget.dart';
import 'package:mubaha/ui/theme/constant.dart';
import 'package:mubaha/ui/theme/theme.dart';
import 'package:provider/src/provider.dart';

class AttributeWidget extends StatefulWidget {
  AttributeWidget({Key? key, required this.productDetail}) : super(key: key);
  final ProductDetail productDetail;

  @override
  State<AttributeWidget> createState() => _AttributeWidgetState();
}

class _AttributeWidgetState extends State<AttributeWidget> {
  int colorIndex = -1;
  int sizeIndex = -1;
  int amount = 1;
  ProductDetail get productDetail => widget.productDetail;

  selectVariant() {
    context.read<VariantCubit>().selectVariant(
        productId: productDetail.id,
        amount: amount,
        selectedVariant: productDetail.variants!.isNotEmpty
            ? productDetail.variants![colorIndex].id
            : null,
        selectedAttribute: sizeIndex > -1
            ? productDetail.variants![colorIndex].attributes[sizeIndex].id
            : null,
        variantIndex: colorIndex > -1 ? colorIndex : null,
        attributeIndex: sizeIndex > -1 ? sizeIndex : null,
        enableAdd: true);
  }

  amountIndex({bool isIncrease = true}) {
    setState(() {
      isIncrease
          ? amount++
          : amount > 1
              ? amount--
              : null;
    });
  }

  conditionVariant({bool isIncrease = true, required Function() chooseItem}) {
    productDetail.variants!.isNotEmpty
        ? productDetail.variants![0].attributes.isNotEmpty
            ? sizeIndex > -1
                ? chooseItem()
                : null
            : colorIndex > -1
                ? chooseItem()
                : null
        : chooseItem();
  }

  Widget variantWidget() {
    return Visibility(
      visible: productDetail.variants!.isNotEmpty,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            productDetail.variantLabel + ':',
            style: subTitleStyle.copyWith(
                color: titleColor, fontWeight: FontWeight.w600),
          ),
          Padding(
              padding: EdgeInsets.only(top: 5.h, bottom: 10.h),
              child: Row(
                children:
                    List.generate(productDetail.variants!.length, (index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        colorIndex = index;
                        sizeIndex = -1;
                        amount = 1;
                      });
                      productDetail.variants![colorIndex].attributes.isEmpty
                          ? selectVariant()
                          : context.read<VariantCubit>().selectVariant(
                              enableAdd: false, variantIndex: colorIndex);
                    },
                    child: Container(
                        margin:
                            EdgeInsets.only(right: kDefaultPaddingWidthScreen),
                        height: 20.h,
                        width: 60.w,
                        decoration: BoxDecoration(
                            border: colorIndex == index
                                ? Border.all(color: primaryColor)
                                : null,
                            borderRadius: BorderRadius.circular(5.r),
                            color: secondaryColor45),
                        child: Center(
                          child: Text(
                            widget.productDetail.variants![index].name,
                            style: TextStyle(fontSize: 11.sp),
                          ),
                        )),
                  );
                }),
              )),
        ],
      ),
    );
  }

  Widget attributeWidget() {
    return Visibility(
      visible: productDetail.variants!.isNotEmpty &&
              productDetail.variants!.isNotEmpty
          ? productDetail.variants![0].attributes.isNotEmpty
          : false,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            productDetail.attributeLabel + ':',
            style: subTitleStyle.copyWith(
                color: titleColor, fontWeight: FontWeight.w600),
          ),
          Padding(
            padding: EdgeInsets.only(top: 5.h, bottom: 10.h),
            child: Row(
              children: List.generate(
                  productDetail.variants!.isNotEmpty
                      ? widget
                          .productDetail
                          .variants![colorIndex > -1 ? colorIndex : 0]
                          .attributes
                          .length
                      : 0, (index) {
                return GestureDetector(
                  onTap: () {
                    colorIndex > -1
                        ? setState(() {
                            sizeIndex = index;
                            amount = 1;
                          })
                        : null;
                    colorIndex > -1 ? selectVariant() : null;
                  },
                  child: Container(
                      margin: EdgeInsets.only(right: 10.w),
                      height: 25.h,
                      width: 25.h,
                      decoration: BoxDecoration(
                          color: secondaryColor45,
                          borderRadius: BorderRadius.circular(5.r),
                          border: sizeIndex == index
                              ? Border.all(color: primaryColor)
                              : null),
                      child: Center(
                          child: Text(
                              widget
                                  .productDetail
                                  .variants![colorIndex > -1 ? colorIndex : 0]
                                  .attributes[index]
                                  .name,
                              style: subHeadingStyle.copyWith(
                                fontWeight: FontWeight.w400,
                                color:
                                    colorIndex > -1 ? titleColor : borderColor,
                              )))),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }

  Widget amountWidget(Color amountColor) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          LocaleKeys.amount.tr() + ':',
          style: subTitleStyle.copyWith(
              color: titleColor, fontWeight: FontWeight.w600),
        ),
        Padding(
            padding: EdgeInsets.only(top: 10.h),
            child: Container(
              width: 100.w,
              padding: EdgeInsets.all(5.h),
              decoration: BoxDecoration(
                  color: secondaryColor45,
                  borderRadius: BorderRadius.circular(5.r)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                      onTap: () {
                        conditionVariant(
                            isIncrease: false,
                            chooseItem: () => amountIndex(isIncrease: false));
                        conditionVariant(chooseItem: () => selectVariant());
                      },
                      child: Icon(
                        MdiIcons.minusBoxOutline,
                        color: amount > 1 ? amountColor : borderColor,
                        size: 15.sp,
                      )),
                  Text(
                    amount.toString(),
                    style: subHeadingStyle.copyWith(color: amountColor),
                  ),
                  GestureDetector(
                      onTap: () {
                        conditionVariant(chooseItem: () => amountIndex());
                        conditionVariant(chooseItem: () => selectVariant());
                      },
                      child: Icon(
                        MdiIcons.plusBoxOutline,
                        color: amountColor,
                        size: 15.sp,
                      ))
                ],
              ),
            ))
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    Color amountColor = productDetail.variants!.isNotEmpty
        ? colorIndex == -1
            ? borderColor
            : productDetail.variants![colorIndex].attributes.isNotEmpty
                ? sizeIndex > -1
                    ? titleColor
                    : borderColor
                : colorIndex > -1
                    ? titleColor
                    : borderColor
        : titleColor;
    return Padding(
      padding: EdgeInsets.all(kDefaultPaddingWidthWidget),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              variantWidget(),
              attributeWidget(),
              AmountWidget(
                  amount: amount,
                  onPressDecrease: () {
                    conditionVariant(
                        isIncrease: false,
                        chooseItem: () => amountIndex(isIncrease: false));
                    conditionVariant(chooseItem: () => selectVariant());
                  },
                  onPressIncrease: () {
                    conditionVariant(chooseItem: () => amountIndex());
                    conditionVariant(chooseItem: () => selectVariant());
                  },
                  amountColor: amountColor),
              // amountWidget(amountColor)
            ],
          ),
          Visibility(
            visible: productDetail.variants!.isNotEmpty,
            child: Container(
              height: 100.h,
              width: 100.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.r),
                  image: colorIndex > -1
                      ? DecorationImage(
                          image: NetworkImage(
                              productDetail.variants![colorIndex].image),
                          fit: BoxFit.cover)
                      : null),
            ),
          )
        ],
      ),
    );
  }
}
