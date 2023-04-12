import 'package:dio/dio.dart';
import 'package:mubaha/data/model/address/address_model.dart';
import 'package:mubaha/data/model/cart/cart_model.dart';
import 'package:mubaha/data/model/category/categorypage_response.dart';
import 'package:mubaha/data/model/checkout/checkout.dart';
import 'package:mubaha/data/model/homepage/homepage_response.dart';
import 'package:mubaha/data/model/location/location_model.dart';
import 'package:mubaha/data/model/login/login_response.dart';
import 'package:mubaha/data/model/no_data/no_data_response.dart';
import 'package:mubaha/data/model/order/order.dart';
import 'package:mubaha/data/model/product_detail_screen/product_detail_response.dart';
import 'package:mubaha/data/model/products_list/get_filter_options_response.dart';
import 'package:mubaha/data/model/products_list/get_products_list_response.dart';
import 'package:mubaha/data/model/shipment/shipment.dart';
import 'package:mubaha/data/model/user/get_user_response.dart';
import 'package:mubaha/data/model/vendor/vendor.dart';
import 'package:mubaha/data/model/voucher/voucher.dart';
import 'package:retrofit/http.dart';

import '../../model/category/category_product_list.dart';
import 'endpoint.dart' as endpoint;

part 'customer_repository.g.dart';

@RestApi()
abstract class CustomerRepository {
  factory CustomerRepository(
    Dio dio, {
    String baseUrl,
  }) = _CustomerRepository;

  @GET(endpoint.getCategories)
  Future<CategoryPageResponse> getCategories();

  @GET(endpoint.getCategorieProductList)
  Future<CategoryProductList> getCategorieProductList({
    @Path('id') required String id,
    @Path('limit') required int limit,
    @Path('page') required int page,
    @Path('minPrice') required String minPrice,
    @Path('maxPrice') required String maxPrice,
    @Path('location') required String location,
    @Path('brands') required String brands,
    @Path('rating') required int rating,
    @Path('order') required String order,
    @Path('sortBy') required String sortBy,
  });
//location={location}&brands={branch}&rating={rating}&order={order}&sortBy={sortBy}";
  @GET(endpoint.getAccountMe)
  Future<GetUserResponse> getAccountInfo();

  @GET(endpoint.getHomepage)
  Future<HomePageResponse2> getHomepage();

  @GET(endpoint.getProductDetail)
  Future<ProductDetailResponse> getProductDetail(@Path('id') String id);

  @GET(endpoint.getVendorDetail)
  Future<VendorResponse> getVendorDetail(@Path('id') String id);

  @POST(endpoint.getCart)
  Future<AddToCartResponse> addToCart(@Body() AddToCartRequest request);

  @GET(endpoint.getCart)
  Future<CartResponse> getCart(
      @Path('page') int page, @Path('limit') int limit);

  @GET(endpoint.getPaginateCart)
  Future<CartPaginateResponse> getPaginateCart(
      @Path('page') int page, @Path('limit') int limit);

  @DELETE(endpoint.deleteCart)
  Future<CartDeleteResponse> deleteCart(@Path('id') String id);

  @PUT(endpoint.deleteCart)
  Future<CartUpdateResponse> updateCart(
      @Path('id') String id, @Body() AddToCartRequest request);

  @POST(endpoint.login)
  Future<LoginResponse> login(@Body() LoginRequest request);

  @GET(endpoint.locationProvince)
  Future<LocationModel> getLocationProvince();

  @GET(endpoint.locationDistrict)
  Future<LocationModel> getLocationDistrict(@Path('id') String id);

  @GET(endpoint.locationWard)
  Future<LocationModel> getLocationWard(@Path('id') String id);

  @POST(endpoint.address)
  Future<AddressResponseRequest> addAddress(@Body() AddressRequest request);

  @GET(endpoint.address)
  Future<AddressResponseModel> getAddress();

  @DELETE(endpoint.deleteAddress)
  Future<AddressResponseDelete> deleteAddress(@Path('id') String id);

  @PUT(endpoint.deleteAddress)
  Future<AddressResponseRequest> updateAddress(
      @Path('id') String id, @Body() AddressRequest request);

  @POST(endpoint.checkout)
  Future<CheckoutResponse> getCheckoutQuery(@Body() CheckoutRequest request);

  @GET(endpoint.getCheckout)
  Future<CheckoutModel> getCheckout(@Path('s') String s, @Path('f') String f);

  @GET(endpoint.vouchers)
  Future<Voucher> getVouchers(
      {@Path('page') required String page,
      @Path('limit') required String limit,
      @Path('type') required String type,
      @Path('vendorId') required String vendorId});

  @POST(endpoint.preVoucher)
  Future<CheckoutModel> preVoucher(
      {@Path() required String s,
      @Path() required String f,
      @Body() required PreVoucherRequest request});

  @POST(endpoint.order)
  Future<AddressResponseDelete> createCheckout(
      @Path('s') String s, @Path('f') String f, @Body() CheckoutCreate request);

  @GET(endpoint.listingOrder)
  Future<OrderModel> listingOrder(
      {@Path('page') required String page,
      @Path('limit') required String limit,
      @Path('status') required String status});
  @GET(endpoint.getProductsList)
  Future<GetProductsListResponse> getProductsList({
    @Path('page') required int page,
    @Path('limit') required int limit,
    @Path('priceMax') required String priceMax,
    @Path('priceMin') required String priceMin,
    @Path('location') required String location,
    @Path('brands') required String brands,
    @Path('text') required String text,
    @Path('cat') required String cat,
    @Path('rating') required String rating,
  });

  @GET(endpoint.getFilterOptions)
  Future<GetFilterOptionsResponse> getFilterOptions({
    @Path('text') required String text,
  });

  @GET(endpoint.totalCart)
  Future<CartTotal> getTotalCart();

  @POST(endpoint.register)
  Future<LoginResponse> register(@Body() LoginRequest request);

  @POST(endpoint.registerOtp)
  Future<LoginResponse> registerOtp(@Body() LoginRequest request);

  @POST(endpoint.verifyRegisterOtp)
  Future<LoginResponse> verifyRegisterOtp(@Body() LoginRequest request);

  @POST(endpoint.loginOtp)
  Future<LoginResponse> loginOtp(@Body() LoginRequest request);

  @POST(endpoint.verifyLoginOtp)
  Future<LoginResponse> verifyLoginOtp(@Body() LoginRequest request);

  @PUT(endpoint.createPass)
  Future<LoginResponse> createPass(
      @Path('phone') String phone, @Body() LoginRequest request);

  @GET(endpoint.logout)
  Future<LogoutResponse> logout();

  @PUT(endpoint.cancelOrder)
  Future<OrderDeleteResponse> cancelOrder(
      @Path('id') String id, @Body() OrderDeleteRequest request);

  @POST(endpoint.buyNow)
  Future<CheckoutResponse> buyNow(@Body() AddToCartRequest request);

  @GET(endpoint.orderDetail)
  Future<OrderDetail> getOrderDetail(@Path('orderId') String orderId);

  @GET(endpoint.shipmentDetails)
  Future<ShipmentModel> getShipmentDetails(@Path('orderId') String orderId);
}

extension ApiClientHandleError on CustomerRepository {
  String mapDioErrorToMessage(DioError error) {
    switch (error.type) {
      case DioErrorType.connectTimeout:
      case DioErrorType.sendTimeout:
      case DioErrorType.receiveTimeout:
        return 'Connection timeout';
      case DioErrorType.response:
        // Parsing error response to string error
        if (error.response != null) {
          final res = error.response;
          if (res?.data != null) {
            try {
              final response = NoDataResponse.fromJson(res?.data);
              return response.message;
            } catch (e) {
              return 'Common error (${res?.statusCode ?? ''})';
            }
          }
          return 'Common error (${res?.statusCode ?? ''})';
        }
        return 'Common error (${error.toString()})';
      case DioErrorType.cancel:
        return 'Request was cancelled unexpectedly';
      case DioErrorType.other:
        return error.message;
    }
  }
}
