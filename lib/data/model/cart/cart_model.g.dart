// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CartResponse _$CartResponseFromJson(Map<String, dynamic> json) => CartResponse(
      data: json['data'] == null
          ? null
          : CartData.fromJson(json['data'] as Map<String, dynamic>),
      status: json['status'] as int?,
      message: json['message'] as String?,
      errors: json['errors'] as String?,
    );

Map<String, dynamic> _$CartResponseToJson(CartResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'status': instance.status,
      'message': instance.message,
      'errors': instance.errors,
    };

CartPaginateResponse _$CartPaginateResponseFromJson(
        Map<String, dynamic> json) =>
    CartPaginateResponse(
      data: json['data'] == null
          ? null
          : CartItems.fromJson(json['data'] as Map<String, dynamic>),
      status: json['status'] as int,
      message: json['message'] as String,
      errors: json['errors'] as String?,
    );

Map<String, dynamic> _$CartPaginateResponseToJson(
        CartPaginateResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'status': instance.status,
      'message': instance.message,
      'errors': instance.errors,
    };

CartData _$CartDataFromJson(Map<String, dynamic> json) => CartData(
      cartItems: json['cartItems'] == null
          ? null
          : CartItems.fromJson(json['cartItems'] as Map<String, dynamic>),
      relatedProducts: (json['relatedProducts'] as List<dynamic>)
          .map((e) => Product2.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CartDataToJson(CartData instance) => <String, dynamic>{
      'relatedProducts': instance.relatedProducts,
      'cartItems': instance.cartItems,
    };

CartItems _$CartItemsFromJson(Map<String, dynamic> json) => CartItems(
      totalDocs: json['totalDocs'] as int,
      limit: json['limit'] as int,
      totalPages: json['totalPages'] as int,
      page: json['page'] as int,
      pagingCounter: json['pagingCounter'] as int,
      hasPrevPage: json['hasPrevPage'] as bool,
      hasNextPage: json['hasNextPage'] as bool,
      prevPage: json['prevPage'] as int?,
      nextPage: json['nextPage'] as int?,
      grouped: (json['grouped'] as List<dynamic>)
          .map((e) => CartGrouped.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CartItemsToJson(CartItems instance) => <String, dynamic>{
      'totalDocs': instance.totalDocs,
      'limit': instance.limit,
      'totalPages': instance.totalPages,
      'page': instance.page,
      'pagingCounter': instance.pagingCounter,
      'hasPrevPage': instance.hasPrevPage,
      'hasNextPage': instance.hasNextPage,
      'prevPage': instance.prevPage,
      'nextPage': instance.nextPage,
      'grouped': instance.grouped,
    };

CartDocs _$CartDocsFromJson(Map<String, dynamic> json) => CartDocs(
      id: json['_id'] as String?,
      amount: json['amount'] as int,
      owner: json['owner'] as String?,
      product: json['product'] == null
          ? null
          : CartProduct.fromJson(json['product'] as Map<String, dynamic>),
      selectedAttribute: json['selectedAttribute'] == null
          ? null
          : AttributesModel.fromJson(
              json['selectedAttribute'] as Map<String, dynamic>),
      selectedVariant: json['selectedVariant'] == null
          ? null
          : Variant.fromJson(json['selectedVariant'] as Map<String, dynamic>),
      status: json['status'] as String?,
      vendor: json['vendor'] == null
          ? null
          : CartVendor.fromJson(json['vendor'] as Map<String, dynamic>),
      discount: (json['discount'] as num).toDouble(),
      discountedPrice: (json['discountedPrice'] as num).toDouble(),
      lastPrice: (json['lastPrice'] as num).toDouble(),
      price: (json['price'] as num).toDouble(),
      currencySymbol:
          stringToCurrencySymbolsType(json['currencySymbol'] as String),
      isSelect: json['isSelect'] as bool? ?? false,
    );

Map<String, dynamic> _$CartDocsToJson(CartDocs instance) => <String, dynamic>{
      '_id': instance.id,
      'amount': instance.amount,
      'selectedVariant': instance.selectedVariant,
      'selectedAttribute': instance.selectedAttribute,
      'owner': instance.owner,
      'status': instance.status,
      'product': instance.product,
      'vendor': instance.vendor,
      'price': instance.price,
      'discount': instance.discount,
      'discountedPrice': instance.discountedPrice,
      'lastPrice': instance.lastPrice,
      'currencySymbol': currencySymbolsTypeToString(instance.currencySymbol),
      'isSelect': instance.isSelect,
    };

CartGrouped _$CartGroupedFromJson(Map<String, dynamic> json) => CartGrouped(
      products: (json['products'] as List<dynamic>)
          .map((e) => CartDocs.fromJson(e as Map<String, dynamic>))
          .toList(),
      vendor: CartVendor.fromJson(json['vendor'] as Map<String, dynamic>),
      isSelectAll: json['isSelectAll'] as bool? ?? false,
    );

Map<String, dynamic> _$CartGroupedToJson(CartGrouped instance) =>
    <String, dynamic>{
      'vendor': instance.vendor,
      'products': instance.products,
      'isSelectAll': instance.isSelectAll,
    };

CartVendor _$CartVendorFromJson(Map<String, dynamic> json) => CartVendor(
      id: json['_id'] as String,
      brandName: json['brandName'] as String,
      owner: json['owner'] == null
          ? null
          : CartVendorOwner.fromJson(json['owner'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CartVendorToJson(CartVendor instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'brandName': instance.brandName,
      'owner': instance.owner,
    };

CartVendorOwner _$CartVendorOwnerFromJson(Map<String, dynamic> json) =>
    CartVendorOwner(
      profile: json['profile'] == null
          ? null
          : CartVendorProfile.fromJson(json['profile'] as Map<String, dynamic>),
      username: json['username'] as String,
      id: json['_id'] as String,
    );

Map<String, dynamic> _$CartVendorOwnerToJson(CartVendorOwner instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'username': instance.username,
      'profile': instance.profile,
    };

CartVendorProfile _$CartVendorProfileFromJson(Map<String, dynamic> json) =>
    CartVendorProfile(
      avatar: json['avatar'] as String,
    );

Map<String, dynamic> _$CartVendorProfileToJson(CartVendorProfile instance) =>
    <String, dynamic>{
      'avatar': instance.avatar,
    };

CartProduct _$CartProductFromJson(Map<String, dynamic> json) => CartProduct(
      id: json['_id'] as String,
      name: json['name'] as String,
      price: (json['price'] as num?)?.toDouble(),
      currencySymbol: json['currencySymbol'] == null
          ? CurrencySymbolsType.vnd
          : stringToCurrencySymbolsType(json['currencySymbol'] as String),
      stock: json['stock'] == null
          ? null
          : StockModel2.fromJson(json['stock'] as Map<String, dynamic>),
      discount: (json['discount'] as num?)?.toDouble(),
      media: Media.fromJson(json['media'] as Map<String, dynamic>),
      slug: json['slug'] as String?,
      variants: (json['variants'] as List<dynamic>?)
          ?.map((e) => Variant.fromJson(e as Map<String, dynamic>))
          .toList(),
      reviews: (json['reviews'] as List<dynamic>?)
          ?.map((e) => ReviewModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      variantLabel: json['variantLabel'] as String?,
      attributeLabel: json['attributeLabel'] as String?,
      status: json['status'] as String?,
    );

Map<String, dynamic> _$CartProductToJson(CartProduct instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'price': instance.price,
      'currencySymbol': currencySymbolsTypeToString(instance.currencySymbol),
      'stock': instance.stock,
      'discount': instance.discount,
      'media': instance.media,
      'slug': instance.slug,
      'variants': instance.variants,
      'variantLabel': instance.variantLabel,
      'attributeLabel': instance.attributeLabel,
      'status': instance.status,
      'reviews': instance.reviews,
    };

PriceRange _$PriceRangeFromJson(Map<String, dynamic> json) => PriceRange(
      min: json['min'] as num,
      max: json['max'] as num,
    );

Map<String, dynamic> _$PriceRangeToJson(PriceRange instance) =>
    <String, dynamic>{
      'min': instance.min,
      'max': instance.max,
    };

CartDeleteResponse _$CartDeleteResponseFromJson(Map<String, dynamic> json) =>
    CartDeleteResponse(
      status: json['status'] as int,
      message: json['message'] as String,
      error: json['error'] as String?,
      data: json['data'] == null
          ? null
          : CartDocs.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CartDeleteResponseToJson(CartDeleteResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'status': instance.status,
      'message': instance.message,
      'error': instance.error,
    };

CartUpdateResponse _$CartUpdateResponseFromJson(Map<String, dynamic> json) =>
    CartUpdateResponse(
      data: json['data'] == null
          ? null
          : CartDocs.fromJson(json['data'] as Map<String, dynamic>),
      status: json['status'] as int,
      message: json['message'] as String,
      error: json['error'] as String?,
    );

Map<String, dynamic> _$CartUpdateResponseToJson(CartUpdateResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'status': instance.status,
      'message': instance.message,
      'error': instance.error,
    };

CartModel2 _$CartModel2FromJson(Map<String, dynamic> json) => CartModel2(
      id: json['_id'] as String,
      note: json['note'] as String?,
      carts: CartItem2.fromJson(json['carts'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CartModel2ToJson(CartModel2 instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'note': instance.note,
      'carts': instance.carts,
    };

CartItem2 _$CartItem2FromJson(Map<String, dynamic> json) => CartItem2(
      vendor: Account.fromJson(json['vendor'] as Map<String, dynamic>),
      product: (json['product'] as List<dynamic>?)
          ?.map((e) => Product.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CartItem2ToJson(CartItem2 instance) => <String, dynamic>{
      'vendor': instance.vendor,
      'product': instance.product,
    };

CartTotal _$CartTotalFromJson(Map<String, dynamic> json) => CartTotal(
      status: json['status'] as int,
      message: json['message'] as String,
      error: json['error'] as String?,
      data: json['data'] == null
          ? null
          : CartTotalData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CartTotalToJson(CartTotal instance) => <String, dynamic>{
      'data': instance.data,
      'status': instance.status,
      'message': instance.message,
      'error': instance.error,
    };

CartTotalData _$CartTotalDataFromJson(Map<String, dynamic> json) =>
    CartTotalData(
      total: json['total'] as int,
    );

Map<String, dynamic> _$CartTotalDataToJson(CartTotalData instance) =>
    <String, dynamic>{
      'total': instance.total,
    };
