import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mubaha/data/repository/customer/customer_repository.dart';
import 'package:mubaha/ui/screen/main/product_detail/cubit/variant_state.dart';

class VariantCubit extends Cubit<VariantState> {
  final CustomerRepository _customerRepository;
  VariantCubit(this._customerRepository) : super(VariantState.initial());
  Future<void> selectVariant(
      {String? productId,
      String? selectedVariant,
      String? selectedAttribute,
      int? amount,
      bool? enableAdd,
      int? variantIndex,
      int? attributeIndex}) async {
    emit(VariantState(
        isLoading: false,
        amount: amount,
        productId: productId,
        selectedVariant: selectedVariant,
        selectedAttribute: selectedAttribute,
        enableAdd: enableAdd ?? false,
        variantIndex: variantIndex,
        attributeIndex: attributeIndex));
  }
}
