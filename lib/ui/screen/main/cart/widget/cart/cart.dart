import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:mubaha/data/model/cart/cart_model.dart';
import 'package:mubaha/data/model/order/order.dart';
import 'package:mubaha/ui/router/router.gr.dart';
import 'package:mubaha/ui/screen/main/cart/cubit/cart_cubit/cart_cubit.dart';
import 'package:mubaha/ui/screen/main/cart/widget/cart/cart_item.dart';
import 'package:mubaha/ui/shared/widget/button/primary_button.dart';
import 'package:mubaha/ui/shared/widget/checkbox/checkbox_widget.dart';
import 'package:mubaha/ui/shared/widget/divider/divider_widget.dart';
import 'package:mubaha/ui/theme/constant.dart';
import 'package:mubaha/ui/theme/theme.dart';

final SlidableController slidableController = SlidableController();

class Cart extends StatefulWidget {
  Cart(
      {Key? key,
      this.item,
      this.orderDocs,
      this.isLastOrder = false,
      this.statusOrder,
      this.isToDetail = true,
      this.isShipDetail = false})
      : super(key: key);
  final int? statusOrder;
  final CartGrouped? item;
  final OrderDocs? orderDocs;
  final bool isLastOrder;
  final bool isToDetail;
  final bool isShipDetail;
  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  bool isSelect = false;

  final List<String> idList = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(
              horizontal: kDefaultPaddingWidthScreen, vertical: 5.h),
          // margin: EdgeInsets.only(
          //     bottom: kDefaultPaddingScreen, top: kDefaultPaddingScreen),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  widget.item != null
                      ? CheckboxWidget(
                          onPress: () {
                            context.read<CartCubit>().selectVendor(
                                idVendor: widget.item!.vendor.id,
                                isSelectAll: widget.item!.isSelectAll);
                          },
                          isCircle: false,
                          isSelect: widget.item!.isSelectAll,
                        )
                      : Container(),
                  GestureDetector(
                    onTap: widget.isToDetail
                        ? () => context.router.push(VendorPage(
                            id: widget.item != null
                                ? widget.item!.vendor.id
                                : widget.orderDocs!.vendor.id))
                        : null,
                    child: Row(
                      children: [
                        Container(
                          margin:
                              EdgeInsets.only(left: kDefaultPaddingScreen.w),
                          padding: EdgeInsets.zero,
                          width: 30.w,
                          height: 30.w,
                          child: CachedNetworkImage(
                            imageUrl: widget.item != null
                                ? widget.item!.vendor.owner!.profile!.avatar
                                : widget
                                    .orderDocs!.vendor.owner!.profile!.avatar,
                            imageBuilder: (context, image) => CircleAvatar(
                              backgroundImage: image,
                              radius: 15.r,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: kDefaultPaddingScreen.w,
                        ),
                        Text(
                          widget.item != null
                              ? widget.item!.vendor.brandName
                              : widget.orderDocs!.vendor.brandName,
                          style: titleStyle,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const DividerWidget(
          isSmall: true,
        ),
        widget.item != null
            ? ListCartWidget(
                products: widget.item != null
                    ? widget.item!.products
                    : widget.orderDocs!.products,
              )
            : ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: widget.orderDocs!.products.length,
                itemBuilder: (context, index) {
                  return CartItemWidget(
                    isToDetail: widget.isToDetail,
                    index: index,
                    item: widget.orderDocs!.products[index],
                    isListingOrder: true,
                  );
                  // productWidget(widget.orderDocs!.products[index]);
                }),
        widget.orderDocs != null
            ? Column(
                children: [
                  const DividerWidget(
                    isSmall: true,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: kDefaultPaddingWidthWidget,
                        vertical: kDefaultPaddingHeightScreen),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Tổng số tiền',
                          style: subHeadingStyle.copyWith(color: titleColor),
                        ),
                        Text(
                          widget.orderDocs!.getTotalPrice!,
                          style: subHeadingStyle.copyWith(color: primaryColor),
                        ),
                      ],
                    ),
                  ),
                  Visibility(
                    visible: !widget.isShipDetail,
                    child: Column(
                      children: [
                        const DividerWidget(
                          isSmall: true,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              margin: EdgeInsets.only(
                                  right: kDefaultPaddingWidthWidget,
                                  bottom: kDefaultPaddingHeightScreen,
                                  top: kDefaultPaddingHeightScreen),
                              height: 25.h,
                              width: 100.w,
                              child: PrimaryButton(
                                label: widget.statusOrder == 0
                                    ? 'Đang xử lý'
                                    : widget.statusOrder == 1
                                        ? 'Đã xác nhận'
                                        : widget.statusOrder == 2
                                            ? 'Đang giao'
                                            : 'Mua lại',
                                backgroundColor: widget.statusOrder == 0
                                    ? Colors.grey.shade400
                                    : primaryColor,
                                style:
                                    subTitleStyle.copyWith(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                        const DividerWidget(
                          isSmall: true,
                        ),
                      ],
                    ),
                  ),
                  widget.isLastOrder ? Container() : const DividerWidget()
                ],
              )
            : Container()
      ],
    );
  }
}

class ListCartWidget extends StatefulWidget {
  final List<CartDocs> products;
  const ListCartWidget({
    Key? key,
    required this.products,
  }) : super(key: key);

  @override
  State<ListCartWidget> createState() => _ListCartWidgetState();
}

class _ListCartWidgetState extends State<ListCartWidget> {
  List<CartDocs> get products => widget.products;
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.zero,
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: products.length,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (ctx, index) {
            final CartDocs item = products[index];
            return Slidable(
              controller: slidableController,
              child: CartItemWidget(index: index, item: item),
              secondaryActions: <Widget>[
                IconSlideAction(
                  caption: 'Xoá',
                  color: Colors.red,
                  icon: Icons.delete,
                  onTap: () async {
                    await context.read<CartCubit>().deleteCart(item.id!);
                  },
                ),
              ],
              actionPane: SlidableDrawerActionPane(),
            );
          },
        ));
  }
}
