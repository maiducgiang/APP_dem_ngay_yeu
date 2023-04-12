import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../../../data/model/category/category_product_list.dart';
import '../../../../../data/model/product/product2.dart';
import '../../../../../data/model/product/product4.dart';
import '../../../../../data/model/products_list/get_filter_options_response.dart';
import '../../../../../data/repository/customer/customer_repository.dart';

part 'category_product_list_state.dart';

class CategoryProductListCubit extends Cubit<CategoryProductListState> {
  final CustomerRepository _customerRepository;
  CategoryProductListCubit(this._customerRepository)
      : super(CategoryProductListInitial());

  Future<void> getListProduct(int? limit,
      {required String id}) async {
    //emit(CategoryProductListLoading());
    try {
        final response = await _customerRepository.getCategorieProductList(
            id: id,
            limit: 10,
            page: 1,
            minPrice: "0",
            maxPrice: "9999999",
            location: "",
            brands: "",
            rating: 1,
            order: "",
            sortBy: "");
        if (response.status == 200) {
          emit(CategoryProductListLoadSuccess(
            categoryDetail: response.data!.category,
            products: response.data!.products.docs ?? [],
            hasPrevPage: response.data!.products.hasPrevPage,
            hasNextPage: response.data!.products.hasNextPage,
            page: 1,
          ));
        } else {
          emit(CategoryProductListLoadFailure(errol: response.errors.toString()));
        }



    } on DioError catch (e) {
      final errorMessage = _customerRepository.mapDioErrorToMessage(e);
      emit(CategoryProductListLoadFailure(errol: e.toString()));
    }
  }
  Future<void> getListProductPage(int? limit,
      {required String id, required int page}) async {
    final currenState = state as CategoryProductListLoadSuccess;
    List<Product4> products = [];
    try {

      final response = await _customerRepository.getCategorieProductList(
          id: id,
          limit: 10,
          page: page,
          minPrice: "0",
          maxPrice: "9999999",
          location: "",
          brands: "",
          rating: 1,
          order: "",
          sortBy: "");
      if (response.status == 200) {
        products.addAll(response.data!.products.docs ?? []);
        //currenState.products.addAll(response.data!.products.docs ?? []);
        emit(CategoryProductListLoadSuccess(
          categoryDetail: response.data!.category,
          products: currenState.products + products,
          hasPrevPage: response.data!.products.hasPrevPage,
          hasNextPage: response.data!.products.hasNextPage,
          page: page,
        ));
      } else {
        emit(CategoryProductListLoadFailure(errol: response.errors.toString()));
      }

    } on DioError catch (e) {
      final errorMessage = _customerRepository.mapDioErrorToMessage(e);
      emit(CategoryProductListLoadFailure(errol: e.toString()));
    }
  }
}
