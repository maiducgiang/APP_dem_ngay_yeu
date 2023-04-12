import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mubaha/data/model/cart/cart_model.dart';
import 'package:mubaha/data/model/checkout/checkout.dart';
import 'package:mubaha/data/model/product_detail_screen/product_detail_response.dart';
import 'package:mubaha/data/repository/customer/customer_repository.dart';
import 'package:mubaha/ui/screen/main/cart/cubit/cart_cubit/cart_state.dart';

const cartPageAssets = "assets/data/cartpage.json";

class CartCubit extends Cubit<CartState> {
  // final CustomerRepository _apiClient;
  // CartCubit(this._apiClient) : super(CartState.initial());

  // Future<void> getDataCartScreen() async {
  //   emit(state.copyWith(isLoading: true));
  //   // final json = await rootBundle.loadString(cartPageAssets);
  //   // final res = await jsonDecode(json);
  //   // final favoriteResponse =
  //   //     CartPageResponse.fromJson(res as Map<String, dynamic>);
  //   final response = await _apiClient.getCart(1, 20);
  //   if (response.status == 200) {
  //     emit(state.copyWith(isLoading: false, data: response.data));
  //   }
  //   try {} on DioError catch (e) {
  //     final errorMessage = _apiClient.mapDioErrorToMessage(e);
  //     emit(state.copyWith(isLoading: false, error: errorMessage));
  //   }
  // }

  // Future<void> getNextCart() async {
  //   emit(state.copyWith(isLoading: true));
  //   final response = await _apiClient.getPaginateCart(2, 20);
  //   print(response);
  // }

  // Future<void> deleteCart(String cartId) async {
  //   emit(state.copyWith(isLoading: true));
  //   final response = await _apiClient.deleteCart(cartId);
  //   if (response.status == 200) {
  //     emit(state.copyWith(isLoading: false));
  //   }
  //   try {} on DioError catch (e) {
  //     final errorMessage = _apiClient.mapDioErrorToMessage(e);
  //     emit(state.copyWith(isLoading: false, error: errorMessage));
  //   }
  // }
  late int page_loading = 1;
  final CustomerRepository _apiClient;
  CartCubit(this._apiClient) : super(CartStateInitial());

  Future<void> getCart() async {
    try {
      if (!((state is CartStateSuccess) &&
          (state as CartStateSuccess).hasReachedEnd)) {
        if (state is CartStateInitial) {
          emit(CartStateLoading());
          List<CartDocs> products = [];
          List<CartGrouped> cartGrouped = [];
          int page = 1;
          final response = await _apiClient.getCart(page, 20);
          if (response.status == 200) {
            if (response.data!.cartItems != null) {
              cartGrouped = response.data!.cartItems!.grouped;

              page = response.data!.cartItems!.page;
              int total = 0;
              for (int i = 0; i < cartGrouped.length; i++) {
                total += cartGrouped[i].products.length;
              }
              emit(CartStateSuccess(
                  hasReachedEnd: total < 20 ? true : false,
                  page: page,
                  relatedProducts: response.data!.relatedProducts,
                  cartGrouped: cartGrouped));
            } else {
              emit(CartStateSuccess(
                  cartGrouped: cartGrouped,
                  hasReachedEnd: true,
                  page: page,
                  relatedProducts: []));
            }
          } else {
            emit(CartStateFailure());
          }
        } else if (state is CartStateSuccess) {
          List<CartDocs> products = [];
          List<CartGrouped> cartGrouped = [];

          final currenState = state as CartStateSuccess;
          int page = currenState.page;
          print("Page cart" + page.toString());
          final response =
              await _apiClient.getPaginateCart(currenState.page + 1, 20);
          cartGrouped = response.data!.grouped;
          if (cartGrouped.isNotEmpty &&
              cartGrouped.first.vendor.id ==
                  currenState.cartGrouped.last.vendor.id) {
            currenState.cartGrouped.last.products
                .addAll(cartGrouped.first.products);
            cartGrouped.remove(cartGrouped.first);
          }

          page = response.data!.page;
          currenState.page += 1;

          if (products.isEmpty) {
            emit(currenState.cloneWith(hasReachedEnd: true));
          } else {
            emit(CartStateSuccess(
                relatedProducts: currenState.relatedProducts,
                hasReachedEnd: false,
                page: page,
                cartGrouped: currenState.cartGrouped + cartGrouped));
          }
        }
      }
    } on DioError catch (e) {
      final errorMessage = _apiClient.mapDioErrorToMessage(e);
      emit(CartStateFailure());
    }
    // try {
    //   if (!((state is CartStateSuccess) &&
    //       (state as CartStateSuccess).hasReachedEnd)) {
    //     if (state is CartStateInitial) {
    //       emit(CartStateLoading());
    //       List<CartDocs> products = [];
    //       int page = 1;
    //       final response = await _apiClient.getCart(page, 20);
    //       products = response.data!.cartItems.docs;
    //       page = response.data!.cartItems.page;
    //       final groupMap = groupBy(products, (CartDocs doc) => doc.vendor!.id);
    //       final List<GroupVendorItem> groupVendor = [];
    //       groupMap.forEach((key, value) =>
    //           groupVendor.add(GroupVendorItem(key: key, value: value)));
    //       emit(CartStateSuccess(
    //           products: products,
    //           hasReachedEnd: false,
    //           page: page,
    //           relatedProducts: response.data!.relatedProducts,
    //           groupVendor: groupVendor));
    //     } else if (state is CartStateSuccess) {
    //       List<CartDocs> products = [];
    //       final currenState = state as CartStateSuccess;
    //       int page = currenState.page;
    //       final response =
    //           await _apiClient.getPaginateCart(currenState.page + 1, 20);
    //       products = response.data!.docs;
    //       page = response.data!.page;
    //       final vendors = currenState.products + products;
    //       final groupMap = groupBy(vendors, (CartDocs doc) => doc.vendor!.id);
    //       final List<GroupVendorItem> groupVendor = [];

    //       groupMap.forEach((key, value) =>
    //           groupVendor.add(GroupVendorItem(key: key, value: value)));

    //       if (products.isEmpty) {
    //         emit(currenState.cloneWith(hasReachedEnd: true));
    //       } else {
    //         emit(CartStateSuccess(
    //             relatedProducts: currenState.relatedProducts,
    //             products: currenState.products + products,
    //             hasReachedEnd: false,
    //             page: page,
    //             groupVendor: groupVendor));
    //       }
    //     }
    //   }
    // } on DioError catch (e) {
    //   final errorMessage = _apiClient.mapDioErrorToMessage(e);
    //   emit(CartStateFailure());
    // }
  }
  Future<void> getCartRefresh() async {
    emit(CartStateLoading());
    List<CartDocs> products = [];
    List<CartGrouped> cartGrouped = [];
    int page = 1;
    final response = await _apiClient.getCart(page, 20);
    if (response.status == 200) {
      if (response.data!.cartItems != null) {
        cartGrouped = response.data!.cartItems!.grouped;

        page = response.data!.cartItems!.page;
        int total = 0;
        for (int i = 0; i < cartGrouped.length; i++) {
          total += cartGrouped[i].products.length;
        }
        emit(CartStateSuccess(
            hasReachedEnd: total < 20 ? true : false,
            page: page,
            relatedProducts: response.data!.relatedProducts,
            cartGrouped: cartGrouped));
      } else {
        emit(CartStateSuccess(
            cartGrouped: cartGrouped,
            hasReachedEnd: true,
            page: page,
            relatedProducts: []));
      }
    } else {
      emit(CartStateFailure());
    }
  }
  Future<void> getCartPage() async {
    try {
          List<CartDocs> products = [];
          List<CartGrouped> cartGrouped = [];
          final currenState = state as CartStateSuccess;
          int page = currenState.page;
          print("Page cart" + page.toString());
          final response = await _apiClient.getPaginateCart(page + 1, 20);
          cartGrouped = response.data!.grouped;
          for(int i = 0; i < cartGrouped.length; i++){
            if(currenState.cartGrouped[currenState.cartGrouped.length-1].vendor.id == cartGrouped[i].vendor.id){
              currenState.cartGrouped[currenState.cartGrouped.length-1].products.addAll(cartGrouped[i].products);
            }
            else currenState.cartGrouped.add(cartGrouped[i]);
          }
          emit(CartStateSuccess(
              relatedProducts: currenState.relatedProducts,
              hasReachedEnd: response.data!.hasPrevPage,
              page: page+1,
              cartGrouped: currenState.cartGrouped ));

    } on DioError catch (e) {
      final errorMessage = _apiClient.mapDioErrorToMessage(e);
      emit(CartStateFailure());
    }
    // try {
    //   if (!((state is CartStateSuccess) &&
    //       (state as CartStateSuccess).hasReachedEnd)) {
    //     if (state is CartStateInitial) {
    //       emit(CartStateLoading());
    //       List<CartDocs> products = [];
    //       int page = 1;
    //       final response = await _apiClient.getCart(page, 20);
    //       products = response.data!.cartItems.docs;
    //       page = response.data!.cartItems.page;
    //       final groupMap = groupBy(products, (CartDocs doc) => doc.vendor!.id);
    //       final List<GroupVendorItem> groupVendor = [];
    //       groupMap.forEach((key, value) =>
    //           groupVendor.add(GroupVendorItem(key: key, value: value)));
    //       emit(CartStateSuccess(
    //           products: products,
    //           hasReachedEnd: false,
    //           page: page,
    //           relatedProducts: response.data!.relatedProducts,
    //           groupVendor: groupVendor));
    //     } else if (state is CartStateSuccess) {
    //       List<CartDocs> products = [];
    //       final currenState = state as CartStateSuccess;
    //       int page = currenState.page;
    //       final response =
    //           await _apiClient.getPaginateCart(currenState.page + 1, 20);
    //       products = response.data!.docs;
    //       page = response.data!.page;
    //       final vendors = currenState.products + products;
    //       final groupMap = groupBy(vendors, (CartDocs doc) => doc.vendor!.id);
    //       final List<GroupVendorItem> groupVendor = [];

    //       groupMap.forEach((key, value) =>
    //           groupVendor.add(GroupVendorItem(key: key, value: value)));

    //       if (products.isEmpty) {
    //         emit(currenState.cloneWith(hasReachedEnd: true));
    //       } else {
    //         emit(CartStateSuccess(
    //             relatedProducts: currenState.relatedProducts,
    //             products: currenState.products + products,
    //             hasReachedEnd: false,
    //             page: page,
    //             groupVendor: groupVendor));
    //       }
    //     }
    //   }
    // } on DioError catch (e) {
    //   final errorMessage = _apiClient.mapDioErrorToMessage(e);
    //   emit(CartStateFailure());
    // }
  }
  Future<void> deleteCart(String cartId) async {
    emit((state as CartStateSuccess).cloneWith(isUpdate: true));
    await Future.delayed(const Duration(microseconds: 100));
    final response = await _apiClient.deleteCart(cartId);
    final currenState = state as CartStateSuccess;

    if (response.status == 200) {
      // final newList = (state as CartStateSuccess)
      //     .products
      //     .where((element) => element.id != cartId)
      //     .toList();
      final newList = currenState.cartGrouped.map((item) {
        if (item.vendor.id == response.data!.vendor!.id) {
          final newProducts =
              item.products.where((element) => element.id != cartId).toList();
          item.products = newProducts;
          return item;
        }
        return item;
      }).toList();
      // final groupMap = groupBy(newList, (CartDocs doc) => doc.vendor!.id);
      // final List<GroupVendorItem> groupVendor = [];
      // groupMap.forEach((key, value) =>
      //     groupVendor.add(GroupVendorItem(key: key, value: value)));
      final totalPrice = getTotalPrice(newList);
      emit((state as CartStateSuccess).cloneWith(
          cartGrouped: newList, isUpdate: false, totalPrice: totalPrice));
    }
    try {} on DioError catch (e) {
      final errorMessage = _apiClient.mapDioErrorToMessage(e);
      emit((state as CartStateSuccess).cloneWith(deleteSuccess: true));
    }
  }

  Future<void> updateCart(
      {required String id, required AddToCartRequest request}) async {
    emit((state as CartStateSuccess).cloneWith(isUpdate: true));
    await Future.delayed(const Duration(microseconds: 100));
    final response = await _apiClient.updateCart(id, request);
    final data = response.data;
    final currenState = state as CartStateSuccess;
    if (response.status == 200) {
      final newList = currenState.cartGrouped.map((item) {
        if (item.vendor.id == data!.vendor!.id) {
          final newProducts = item.products.map((e) {
            if (e.id == data.id) {
              data.isSelect = e.isSelect;
              return data;
            }
            return e;
          }).toList();
          item.products = newProducts;
          return item;
        }
        return item;
      }).toList();
      final totalPrice = getTotalPrice(newList);
      emit(currenState.cloneWith(
          cartGrouped: newList, isUpdate: false, totalPrice: totalPrice));
    } else {
      log(response.message);
    }
  }

  Future<void> selectCart(
      {required String idVendor, required String idProduct}) async {
    emit((state as CartStateSuccess).cloneWith(isUpdate: true));
    await Future.delayed(const Duration(microseconds: 100));
    final currentState = state as CartStateSuccess;
    final newList = currentState.cartGrouped.map((item) {
      if (item.vendor.id == idVendor) {
        item.products.map((e) {
          if (e.id == idProduct) {
            e.isSelect = !e.isSelect;
            return e;
          }
          return e;
        }).toList();
        final unSelectedItem =
            item.products.indexWhere((element) => element.isSelect == false);
        if (unSelectedItem == -1) {
          item.isSelectAll = true;
        } else {
          item.isSelectAll = false;
        }
      }
      return item;
    }).toList();
    final totalPrice = getTotalPrice(newList);
    final selectedProductId = getListSelectedProductId(newList);
    emit(currentState.cloneWith(
        cartGrouped: newList,
        isUpdate: false,
        totalPrice: totalPrice,
        selectedProductId: selectedProductId));
  }

  Future<void> selectVendor(
      {required String idVendor, required bool isSelectAll}) async {
    emit((state as CartStateSuccess).cloneWith(isUpdate: true));
    await Future.delayed(const Duration(microseconds: 100));
    final currentState = state as CartStateSuccess;
    final newList = currentState.cartGrouped.map((item) {
      if (item.vendor.id == idVendor) {
        item.isSelectAll = !item.isSelectAll;
        item.products.map((e) {
          e.isSelect = isSelectAll ? false : true;
          return e;
        }).toList();
        return item;
      }
      return item;
    }).toList();
    final totalPrice = getTotalPrice(newList);
    final selectedProductId = getListSelectedProductId(newList);
    emit(currentState.cloneWith(
        cartGrouped: newList,
        isUpdate: false,
        totalPrice: totalPrice,
        selectedProductId: selectedProductId));
  }

  Future<CheckoutResponse?> getCheckoutQuery(
      {required List<String> cartItemIds}) async {
    final currentState = state as CartStateSuccess;

    try {
      final response = await _apiClient
          .getCheckoutQuery(CheckoutRequest(cartItemIds: cartItemIds));
      if (response.status == 200) {
        final data = response.data;
        emit(currentState.cloneWith(
          responseCheckout: data,
        ));
      }
      return response;
    } on DioError catch (e) {
      final errorMessage = _apiClient.mapDioErrorToMessage(e);
      return null;
    }
  }

  String getTotalPrice(List<CartGrouped> cartGrouped) {
    var totalPrice = 0;
    cartGrouped.map((item) {
      item.products.map((e) {
        if (e.isSelect == true) {
          totalPrice =
              totalPrice + (e.product!.getPriceDicount!.toInt() * e.amount);
        }
      }).toList();
    }).toList();
    final totalPriceFinal = getPrice(totalPrice);
    return totalPriceFinal;
  }

  List<String> getListSelectedProductId(List<CartGrouped> cartGrouped) {
    List<String> listSelectedId = [];
    cartGrouped.map((item) {
      item.products.map((e) {
        if (e.isSelect == true) {
          listSelectedId.add(e.id!);
        }
      }).toList();
    }).toList();

    return listSelectedId;
  }

  String getPrice(int price) {
    final currencyFormatter = NumberFormat('₫#,##0', 'ID');
    return currencyFormatter.format(price);
  }
}
