import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mubaha/data/model/cart/cart_model.dart';
import 'package:mubaha/data/model/product_detail_screen/product_detail_response.dart';
import 'package:mubaha/ui/router/router.gr.dart';
import 'package:mubaha/ui/screen/main/cart/cubit/cart_cubit/cart_cubit.dart';
import 'package:mubaha/ui/screen/main/cart/widget/cart/render_variant.dart';
import 'package:mubaha/ui/shared/widget/amount_widget.dart';
import 'package:mubaha/ui/shared/widget/checkbox/checkbox_widget.dart';
import 'package:mubaha/ui/theme/constant.dart';
import 'package:mubaha/ui/theme/theme.dart';

class CartItemWidget extends StatelessWidget {
  const CartItemWidget(
      {Key? key,
      required this.index,
      this.item,
      this.isCheckout = false,
      this.isListingOrder = false,
      this.isToDetail = true})
      : super(key: key);
  final int index;
  final CartDocs? item;
  final bool isCheckout;
  final bool isListingOrder;
  final bool isToDetail;

  @override
  Widget build(BuildContext context) {
    final CartProduct product = item!.product!;
    int amount = item!.amount;

    int variantIndex = product.variants != null && product.variants!.isNotEmpty
        ? product.variants!
            .indexWhere((element) => element.id == item!.selectedVariant!.id)
        : -1;
    int attributeIndex = product.variants != null &&
            product.variants!.isNotEmpty &&
            product.variants![variantIndex].attributes.isNotEmpty
        ? product.variants![variantIndex].attributes.indexWhere(
                    (element) => element.id == item!.selectedAttribute!.id) ==
                -1
            ? 0
            : product.variants![variantIndex].attributes.indexWhere(
                (element) => element.id == item!.selectedAttribute!.id)
        : -1;
    bool isSelect = item!.isSelect;

    return GestureDetector(
      onTap: isToDetail
          ? () => context.router.push(ProductDetailPage(id: product.id))
          : null,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(kDefaultBorderRadius.r),
        ),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(10.w),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  !isCheckout && !isListingOrder
                      ? CheckboxWidget(
                          onPress: () {
                            context.read<CartCubit>().selectCart(
                                idVendor: item!.vendor!.id,
                                idProduct: item!.id!);
                          },
                          isCircle: false,
                          isSelect: isSelect,
                        )
                      : Container(),
                  Container(
                    margin: EdgeInsets.only(left: kDefaultPaddingScreen.w),
                    padding: EdgeInsets.zero,
                    width: 86.w,
                    height: 86.w,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: CachedNetworkImageProvider(
                              product.media.featuredImage,
                            ),
                            fit: BoxFit.cover),
                        borderRadius:
                            BorderRadius.circular(kDefaultBorderRadius.r)),
                  ),
                  SizedBox(width: kDefaultPaddingScreen.w),
                  Expanded(
                      child: Container(
                    padding: EdgeInsets.zero,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          product.name,
                          style: titleStyle.copyWith(fontSize: 15.sp),
                          maxLines: 1,
                        ),
                        Visibility(
                            visible: (isCheckout || isListingOrder) &&
                                item!.selectedVariant != null,
                            child: SizedBox(
                              height: 6.h,
                            )),
                        Visibility(
                          visible: (isCheckout || isListingOrder) &&
                              item!.selectedVariant != null,
                          child: Text('Phân loại: ' +
                              (item!.selectedVariant != null
                                  ? item!.selectedVariant!.name
                                  : '') +
                              (item!.selectedAttribute != null
                                  ? ', ' + item!.selectedAttribute!.name
                                  : '')),
                        ),
                        SizedBox(
                          height: 6.h,
                        ),
                        Visibility(
                            visible: item!.discount == 0.0,
                            child: Text(
                              item!.getPrice ?? "",
                              style: titleStyle.copyWith(
                                  fontSize: 15.sp, fontWeight: FontWeight.w400),
                            )),
                        Visibility(
                            visible: item!.discount != 0.0,
                            child: RichText(
                              text: TextSpan(
                                text: item!.getPriceDiscount ?? "",
                                style: titleStyle.copyWith(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w400),
                                children: <TextSpan>[
                                  const TextSpan(text: "  "),
                                  TextSpan(
                                      text:
                                          isCheckout ? '' : '${item!.getPrice}',
                                      style: subTitleStyle.copyWith(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w400,
                                          decoration:
                                              TextDecoration.lineThrough)),
                                ],
                              ),
                            )),
                        SizedBox(height: 5.h),
                        Visibility(
                          visible: !isCheckout && !isListingOrder,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              product.variants != null &&
                                      product.variants!.isNotEmpty &&
                                      variantIndex != -1
                                  ? RenderVariant(
                                      variants: product.variants!,
                                      variantLabel: product.variantLabel,
                                      item: item!,
                                      indexVariant: variantIndex,
                                      attributes: product
                                          .variants![variantIndex].attributes,
                                      indexAttribute: attributeIndex,
                                    )
                                  : Container(),
                              product.variants != null &&
                                      product.variants!.isNotEmpty &&
                                      variantIndex != -1
                                  ? SizedBox(
                                      height: 10.w,
                                    )
                                  : Container(),
                              product.variants != null &&
                                      product.variants!.isNotEmpty &&
                                      variantIndex != -1 &&
                                      product.variants![variantIndex].attributes
                                          .isNotEmpty &&
                                      attributeIndex != -1
                                  ? RenderVariant(
                                      isAttribute: true,
                                      variants: product.variants!,
                                      attributes: product
                                          .variants![variantIndex].attributes,
                                      attributeLable: product.attributeLabel,
                                      item: item!,
                                      indexVariant: variantIndex,
                                      indexAttribute: attributeIndex,
                                    )
                                  : Container(),
                            ],
                          ),
                        ),
                        isCheckout || isListingOrder
                            ? Text('x' + item!.amount.toString())
                            : AmountWidget(
                                isTitle: false,
                                amount: amount,
                                onPressDecrease: () {
                                  context.read<CartCubit>().updateCart(
                                      id: item!.id!,
                                      request: AddToCartRequest(
                                          productId: product.id,
                                          amount: amount - 1));
                                },
                                onPressIncrease: () {
                                  context.read<CartCubit>().updateCart(
                                      id: item!.id!,
                                      request: AddToCartRequest(
                                          productId: product.id,
                                          amount: amount + 1));
                                },
                                amountColor: titleColor)
                      ],
                    ),
                  )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
