import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mubaha/data/model/product_detail_screen/product_detail_response.dart';
import 'package:mubaha/data/repository/customer/customer_repository.dart';
import 'package:mubaha/ui/screen/main/product_detail/cubit/product_detail_state.dart';

const listProduct = "assets/data/favorite.json";

class ProductDetailCubit extends Cubit<ProductDetailState> {
  final CustomerRepository customerRepository;
  final String? id;
  ProductDetailCubit({required this.customerRepository, this.id})
      : super(ProductDetailState.initial(id: id));

  Future<void> getProductDetail(String id) async {
    emit(state.copyWith(isLoading: true));

    try {
      final response = await customerRepository.getProductDetail(id);
      if (response.status == 200) {
        final data = response.data;
        emit(state.copyWith(
          isLoading: false,
          detailProduct: data!.detailProduct,
          relatedProducts: data.relatedProducts,
          // newProducts: data.newProducts
        ));
      }
    } on DioError catch (e) {
      final errorMessage = customerRepository.mapDioErrorToMessage(e);
      emit(state.copyWith(isLoading: false, error: errorMessage));
    }
  }

  Future<void> addToCart(AddToCartRequest request) async {
    emit(state.copyWith(addedToCart: false, isAddingtoCart: true));
    try {
      final resposne = await customerRepository.addToCart(request);
      emit(state.copyWith(isAddingtoCart: false, addedToCart: true));
    } on DioError catch (e) {
      final errorMessage = customerRepository.mapDioErrorToMessage(e);
      emit(state.copyWith(isLoading: false, error: errorMessage));
    }
  }

  Future<void> updateAddedToCart() async {
    emit(state.copyWith(addedToCart: false));
  }
}
