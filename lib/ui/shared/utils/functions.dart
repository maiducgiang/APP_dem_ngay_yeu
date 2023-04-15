import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';

unfocus(BuildContext context) {
  FocusScope.of(context).unfocus();
  TextEditingController().clear();
}

addToCart(
    {required BuildContext context,
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
