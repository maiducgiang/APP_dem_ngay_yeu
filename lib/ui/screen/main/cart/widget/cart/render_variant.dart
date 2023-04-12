import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mubaha/data/model/cart/cart_model.dart';
import 'package:mubaha/data/model/product_detail_screen/product_detail_response.dart';
import 'package:mubaha/data/model/variant/variant.dart';
import 'package:mubaha/ui/screen/main/cart/cubit/cart_cubit/cart_cubit.dart';
import 'package:mubaha/ui/theme/constant.dart';
import 'package:provider/src/provider.dart';

class RenderVariant extends StatelessWidget {
  const RenderVariant(
      {Key? key,
      this.isAttribute = false,
      this.variantLabel,
      this.attributeLable,
      this.variants,
      required this.item,
      required this.indexVariant,
      this.attributes,
      this.indexAttribute})
      : super(key: key);
  final bool isAttribute;
  final String? variantLabel;
  final String? attributeLable;
  final List<Variant>? variants;
  final List<AttributesModel>? attributes;
  final CartDocs item;
  final int indexVariant;
  final int? indexAttribute;
  @override
  Widget build(BuildContext context) {
    final selectItem =
        isAttribute ? attributes![indexAttribute!] : variants![indexVariant];

    return Container(
      height: 25.h,
      padding: EdgeInsets.only(left: 10.w, right: 5.w),
      decoration: BoxDecoration(
          color: secondaryColor, borderRadius: BorderRadius.circular(6.r)),
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
          value: selectItem,
          items: isAttribute
              ? attributes!
                  .map((e) => DropdownMenuItem<AttributesModel>(
                      value: e,
                      child: Text(
                        attributeLable! + ': ' + e.name,
                        style: DefaultTextStyle.of(context).style,
                      )))
                  .toList()
              : variants!
                  .map((e) => DropdownMenuItem<Variant>(
                      value: e,
                      child: Text(
                        variantLabel! + ': ' + e.name,
                        style: DefaultTextStyle.of(context).style,
                      )))
                  .toList(),
          onChanged: (i) {
            final selectVariant =
                !isAttribute ? i as Variant : variants![indexVariant];
            final selectAttribute = isAttribute
                ? i as AttributesModel
                : attributes == null || attributes!.isEmpty
                    ? null
                    : attributes![indexAttribute == -1 ? 0 : indexAttribute!];
            context.read<CartCubit>().updateCart(
                id: item.id!,
                request: AddToCartRequest(
                    productId: item.product!.id,
                    selectedVariant: selectVariant.id,
                    selectedAttribute: isAttribute
                        ? selectAttribute!.id
                        : attributes != null
                            ? attributes![0].id
                            : null,
                    amount: 1));
          },
        ),
      ),
    );
  }
}
