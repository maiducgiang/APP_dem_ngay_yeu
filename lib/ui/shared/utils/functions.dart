import 'package:flutter/material.dart';
import 'package:mubaha/data/model/product_detail_screen/product_detail_response.dart';
import 'package:provider/src/provider.dart';

unfocus(BuildContext context) {
  FocusScope.of(context).unfocus();
  TextEditingController().clear();
}

addToCart(
    {required BuildContext context,
    required ProductDetail productDetail,
    required int amount,
    required int variantIndex,
    required int attributeIndex}) {
  // context.read<VariantCubit>().selectVariant(
  //     productId: productDetail.id,
  //     amount: amount,
  //     selectedVariant: productDetail.variants![variantIndex].id,
  //     enableAdd: true,
  //     variantIndex: attributeIndex);
}
