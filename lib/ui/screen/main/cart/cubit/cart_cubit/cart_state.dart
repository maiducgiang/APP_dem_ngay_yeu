// import 'package:freezed_annotation/freezed_annotation.dart';
// import 'package:mubaha/data/model/cart/cart_model.dart';

// part 'cart_state.freezed.dart';

// @freezed
// class CartState with _$CartState {
//   const factory CartState(
//       {required bool isLoading,
//       CartData? data,
//       List<CartDocs> cartDocs,
//       String? message,
//       String? error,
//       bool? hasReachedEnd}) = _CartState;

//   factory CartState.initial() => const CartState(isLoading: false);
//   factory CartState.demo({List<CartDocs>? products, bool? hasReachedEnd})=>CartState(isLoading: false, cartDocs: products??ca)

//   CartState cloneWith({List<CartDocs>? products, bool? hasReachedEnd}) {
//     return CartState(
//       isLoading: isLoading,
//       cartDocs: products??cartDocs
//     );
//   }
// }

import 'package:equatable/equatable.dart';
import 'package:mubaha/data/model/cart/cart_model.dart';
import 'package:mubaha/data/model/checkout/checkout.dart';
import 'package:mubaha/data/model/group_vendor/group_vendor.dart';
import 'package:mubaha/data/model/product/product2.dart';

class CartState extends Equatable {
  @override
  List<Object> get props => [];
}

class CartStateInitial extends CartState {}

class CartStateLoading extends CartState {}

class CartStateNextLoading extends CartState {}

class CartStateSuccess extends CartState {
  // final List<CartDocs> products;
  final List<CartGrouped> cartGrouped;
  final List<Product2> relatedProducts;
  // final List<GroupVendorItem> groupVendor;
  final bool hasReachedEnd;
  late final int page;
  final bool deleteSuccess;
  final bool isUpdate;
  final String totalPrice;
  final List<String> selectedProductId;
  final CheckoutResponseData? responseCheckout;
  CartStateSuccess(
      {required this.cartGrouped,
      required this.hasReachedEnd,
      required this.page,
      required this.relatedProducts,
      this.deleteSuccess = false,
      this.isUpdate = false,
      this.totalPrice = '₫0',
      this.selectedProductId = const [],
      this.responseCheckout});
  @override
  List<Object> get props =>
      [hasReachedEnd, deleteSuccess, isUpdate, totalPrice];
  CartStateSuccess cloneWith(
      {List<CartDocs>? products,
      bool? hasReachedEnd,
      int? page,
      List<Product2>? relatedProducts,
      bool? deleteSuccess,
      List<GroupVendorItem>? groupVendor,
      bool? isUpdate,
      String? totalPrice,
      List<String>? selectedProductId,
      CheckoutResponseData? responseCheckout,
      List<CartGrouped>? cartGrouped}) {
    return CartStateSuccess(
        hasReachedEnd: hasReachedEnd ?? this.hasReachedEnd,
        page: page ?? this.page,
        relatedProducts: relatedProducts ?? this.relatedProducts,
        deleteSuccess: deleteSuccess ?? this.deleteSuccess,
        isUpdate: isUpdate ?? this.isUpdate,
        totalPrice: totalPrice ?? this.totalPrice,
        selectedProductId: selectedProductId ?? this.selectedProductId,
        responseCheckout: responseCheckout ?? this.responseCheckout,
        cartGrouped: cartGrouped ?? this.cartGrouped);
  }
}

class CartStateFailure extends CartState {}
