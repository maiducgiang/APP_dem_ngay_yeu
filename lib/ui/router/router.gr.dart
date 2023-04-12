// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i36;
import 'package:flutter/material.dart' as _i37;

import '../../data/model/address/address_model.dart' as _i41;
import '../../data/model/cart/cart_model.dart' as _i39;
import '../../data/model/checkout/checkout.dart' as _i40;
import '../../data/model/product/product2.dart' as _i42;
import '../../data/model/product_detail_screen/product_detail_response.dart'
    as _i43;
import '../screen/auth/siginin/signin_screen.dart' as _i9;
import '../screen/auth/signup/forgot_pass_screen.dart' as _i12;
import '../screen/auth/signup/otp_screen.dart' as _i14;
import '../screen/auth/signup/reset_pass_screen.dart' as _i13;
import '../screen/auth/signup/siginup_screen.dart' as _i10;
import '../screen/main/address/ui/address_screen.dart' as _i20;
import '../screen/main/card/ui/card_screen.dart' as _i15;
import '../screen/main/cart/cart_screen.dart' as _i7;
import '../screen/main/cart/widget/payment/payment_cart_screen.dart' as _i22;
import '../screen/main/category/category_screen.dart' as _i5;
import '../screen/main/category_list_product/category_list_products_screen.dart'
    as _i11;
import '../screen/main/deal_of_the_day_list/deal_of_the_day_screen.dart'
    as _i24;
import '../screen/main/favorite/favorite_screen.dart' as _i6;
import '../screen/main/fill_profile/ui/fill_profile_screen.dart' as _i16;
import '../screen/main/home/home_screen.dart' as _i4;
import '../screen/main/main_screen.dart' as _i3;
import '../screen/main/new_address/ui/new_address_screen.dart' as _i21;
import '../screen/main/notification/ui/noti_screen.dart' as _i29;
import '../screen/main/order_detail/ui/order_detail_screen.dart' as _i18;
import '../screen/main/order_success/ui/order_success_screen.dart' as _i26;
import '../screen/main/other/about/ui/about_screen.dart' as _i30;
import '../screen/main/other/help/ui/help_screen.dart' as _i28;
import '../screen/main/other/rule/ui/rule_screen.dart' as _i27;
import '../screen/main/payment/payment_screen.dart' as _i32;
import '../screen/main/product_detail/product_detail_screen.dart' as _i25;
import '../screen/main/products_list/products_list_screen.dart' as _i23;
import '../screen/main/profile/profile_screen.dart' as _i8;
import '../screen/main/review/review_screen.dart' as _i35;
import '../screen/main/shiping_status/shiping_status_screen.dart' as _i34;
import '../screen/main/status_order/ui/status_order_screen.dart' as _i17;
import '../screen/main/vendor/vendor_screen.dart' as _i31;
import '../screen/main/voucher/ui/voucher_screen.dart' as _i19;
import '../screen/splash/splash_screen.dart' as _i1;
import '../screen/welcome/welcome_screen.dart' as _i2;
import '../shared/widget/search/search_screen.dart' as _i33;
import 'router.dart' as _i38;

class AppRouter extends _i36.RootStackRouter {
  AppRouter([_i37.GlobalKey<_i37.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i36.PageFactory> pagesMap = {
    SplashPage.name: (routeData) {
      return _i36.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.SplashScreen());
    },
    WelcomePage.name: (routeData) {
      return _i36.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.WelcomeScreen());
    },
    MainPage.name: (routeData) {
      return _i36.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.MainScreen());
    },
    HomePage.name: (routeData) {
      final args =
          routeData.argsAs<HomePageArgs>(orElse: () => const HomePageArgs());
      return _i36.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i4.HomeScreen(key: args.key, isLogin: args.isLogin));
    },
    CategoryPage.name: (routeData) {
      return _i36.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.CategoryScreen());
    },
    FavoritePage.name: (routeData) {
      return _i36.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i6.FavoriteScreen());
    },
    CartPage.name: (routeData) {
      final args =
          routeData.argsAs<CartPageArgs>(orElse: () => const CartPageArgs());
      return _i36.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i7.CartScreen(key: args.key, isBack: args.isBack));
    },
    ProfilePage.name: (routeData) {
      return _i36.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i8.ProfileScreen());
    },
    SiginPage.name: (routeData) {
      final args =
          routeData.argsAs<SiginPageArgs>(orElse: () => const SiginPageArgs());
      return _i36.MaterialPageX<dynamic>(
          routeData: routeData, child: _i9.SigninScreen(key: args.key));
    },
    SignupPage.name: (routeData) {
      final args = routeData.argsAs<SignupPageArgs>(
          orElse: () => const SignupPageArgs());
      return _i36.MaterialPageX<dynamic>(
          routeData: routeData, child: _i10.SignUpScreen(key: args.key));
    },
    CategoryListProductsScreen.name: (routeData) {
      final args = routeData.argsAs<CategoryListProductsScreenArgs>();
      return _i36.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i11.CategoryListProductsScreen(
              key: args.key, id: args.id, name: args.name));
    },
    ForgotPassPage.name: (routeData) {
      final args = routeData.argsAs<ForgotPassPageArgs>(
          orElse: () => const ForgotPassPageArgs());
      return _i36.MaterialPageX<dynamic>(
          routeData: routeData, child: _i12.ForgotPassScreen(key: args.key));
    },
    ResetPassPage.name: (routeData) {
      final args = routeData.argsAs<ResetPassPageArgs>(
          orElse: () => const ResetPassPageArgs());
      return _i36.MaterialPageX<dynamic>(
          routeData: routeData, child: _i13.ResetPassScreen(key: args.key));
    },
    OtpPage.name: (routeData) {
      final args = routeData.argsAs<OtpPageArgs>();
      return _i36.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i14.OtpScreen(
              key: args.key, phone: args.phone, isLogin: args.isLogin));
    },
    CardPage.name: (routeData) {
      final args =
          routeData.argsAs<CardPageArgs>(orElse: () => const CardPageArgs());
      return _i36.MaterialPageX<dynamic>(
          routeData: routeData, child: _i15.CardScreen(key: args.key));
    },
    FillProfilePage.name: (routeData) {
      final args = routeData.argsAs<FillProfilePageArgs>(
          orElse: () => const FillProfilePageArgs());
      return _i36.MaterialPageX<dynamic>(
          routeData: routeData, child: _i16.FillProfileScreen(key: args.key));
    },
    StatusOrderPage.name: (routeData) {
      return _i36.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i17.StatusOrderScreen());
    },
    OrderDetailPage.name: (routeData) {
      final args = routeData.argsAs<OrderDetailPageArgs>();
      return _i36.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i18.OrderDetailScreen(
              key: args.key,
              orderId: args.orderId,
              isPayment: args.isPayment,
              onBack: args.onBack,
              statusOrder: args.statusOrder,
              cartDocs: args.cartDocs));
    },
    VoucherPage.name: (routeData) {
      final args = routeData.argsAs<VoucherPageArgs>();
      return _i36.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i19.VoucherSreen(
              key: args.key,
              isShop: args.isShop,
              vendorId: args.vendorId,
              s: args.s,
              f: args.f,
              onBack: args.onBack,
              voucherIds: args.voucherIds));
    },
    AddressPage.name: (routeData) {
      final args = routeData.argsAs<AddressPageArgs>(
          orElse: () => const AddressPageArgs());
      return _i36.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i20.AddressScreen(
              key: args.key,
              addressData: args.addressData,
              onBack: args.onBack));
    },
    NewAddressPage.name: (routeData) {
      final args = routeData.argsAs<NewAddressPageArgs>(
          orElse: () => const NewAddressPageArgs());
      return _i36.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i21.NewAddressScreen(
              key: args.key,
              onBack: args.onBack,
              addressData: args.addressData,
              isUpdate: args.isUpdate));
    },
    PaymentCartPage.name: (routeData) {
      final args = routeData.argsAs<PaymentCartPageArgs>(
          orElse: () => const PaymentCartPageArgs());
      return _i36.MaterialPageX<dynamic>(
          routeData: routeData, child: _i22.PaymentCartScreen(key: args.key));
    },
    ProductsListPage.name: (routeData) {
      final args = routeData.argsAs<ProductsListPageArgs>(
          orElse: () => const ProductsListPageArgs());
      return _i36.MaterialPageX<dynamic>(
          routeData: routeData, child: _i23.ProductsListScreen(key: args.key));
    },
    Deal_of_the_day_detail.name: (routeData) {
      final args = routeData.argsAs<Deal_of_the_day_detailArgs>();
      return _i36.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i24.DealOfTheDayListScreen(
              key: args.key,
              listProducts: args.listProducts,
              namePage: args.namePage));
    },
    ProductDetailPage.name: (routeData) {
      final args = routeData.argsAs<ProductDetailPageArgs>();
      return _i36.CustomPage<dynamic>(
          routeData: routeData,
          child: _i25.ProductDetailScreen(key: args.key, id: args.id),
          fullscreenDialog: true,
          transitionsBuilder: _i38.slideBottomToTop,
          opaque: false,
          barrierDismissible: false);
    },
    OrderSuccessPage.name: (routeData) {
      return _i36.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i26.OrderSuccessScreen());
    },
    RulePage.name: (routeData) {
      return _i36.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i27.RuleScreen());
    },
    HelpPage.name: (routeData) {
      return _i36.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i28.HelpScreen());
    },
    NotiPage.name: (routeData) {
      return _i36.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i29.NotiScreen());
    },
    AboutPage.name: (routeData) {
      return _i36.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i30.AboutScreen());
    },
    VendorPage.name: (routeData) {
      final args = routeData.argsAs<VendorPageArgs>();
      return _i36.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i31.VendorScreen(key: args.key, id: args.id));
    },
    PaymentPage.name: (routeData) {
      final args = routeData.argsAs<PaymentPageArgs>(
          orElse: () => const PaymentPageArgs());
      return _i36.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i32.PaymentScreen(
              key: args.key,
              checkoutResponseData: args.checkoutResponseData,
              cartItemIds: args.cartItemIds,
              isBuyNow: args.isBuyNow,
              addToCartRequest: args.addToCartRequest));
    },
    SearchPage.name: (routeData) {
      final args = routeData.argsAs<SearchPageArgs>(
          orElse: () => const SearchPageArgs());
      return _i36.CustomPage<dynamic>(
          routeData: routeData,
          child: _i33.SearchScreen(key: args.key, onBack: args.onBack),
          fullscreenDialog: true,
          transitionsBuilder: _i38.slideBottomToTop,
          opaque: false,
          barrierDismissible: false);
    },
    ShipingStatusPage.name: (routeData) {
      final args = routeData.argsAs<ShipingStatusPageArgs>();
      return _i36.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i34.ShipingStatusScreen(
              key: args.key,
              orderId: args.orderId,
              productImage: args.productImage,
              statusOrder: args.statusOrder));
    },
    ReviewPage.name: (routeData) {
      final args = routeData.argsAs<ReviewPageArgs>();
      return _i36.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i35.ReviewScreen(key: args.key, cartDocs: args.cartDocs));
    }
  };

  @override
  List<_i36.RouteConfig> get routes => [
        _i36.RouteConfig(SplashPage.name, path: '/'),
        _i36.RouteConfig(WelcomePage.name, path: '/welcom_screen'),
        _i36.RouteConfig(MainPage.name, path: '/main'),
        _i36.RouteConfig(HomePage.name, path: '/home'),
        _i36.RouteConfig(CategoryPage.name, path: '/categories'),
        _i36.RouteConfig(FavoritePage.name, path: '/favorite'),
        _i36.RouteConfig(CartPage.name, path: '/cart'),
        _i36.RouteConfig(ProfilePage.name, path: '/profile'),
        _i36.RouteConfig(SiginPage.name, path: '/signin_screen'),
        _i36.RouteConfig(SignupPage.name, path: '/signup_screen'),
        _i36.RouteConfig(CategoryListProductsScreen.name,
            path: '/category_list_products_screen'),
        _i36.RouteConfig(ForgotPassPage.name, path: '/forgot_pass_screen'),
        _i36.RouteConfig(ResetPassPage.name, path: '/reset_pass_page'),
        _i36.RouteConfig(OtpPage.name, path: '/otp_page'),
        _i36.RouteConfig(CardPage.name, path: '/card_page'),
        _i36.RouteConfig(FillProfilePage.name, path: '/fill_profile'),
        _i36.RouteConfig(StatusOrderPage.name, path: '/status_order'),
        _i36.RouteConfig(OrderDetailPage.name, path: '/order_detail'),
        _i36.RouteConfig(VoucherPage.name, path: '/voucher'),
        _i36.RouteConfig(AddressPage.name, path: '/address'),
        _i36.RouteConfig(NewAddressPage.name, path: '/new_address'),
        _i36.RouteConfig(PaymentCartPage.name, path: '/payment_cart'),
        _i36.RouteConfig(ProductsListPage.name, path: '/products_list'),
        _i36.RouteConfig(Deal_of_the_day_detail.name,
            path: '/deal_of_the_day_detail'),
        _i36.RouteConfig(ProductDetailPage.name, path: '/product_detail'),
        _i36.RouteConfig(OrderSuccessPage.name, path: '/order_success'),
        _i36.RouteConfig(RulePage.name, path: '/rule'),
        _i36.RouteConfig(HelpPage.name, path: '/help'),
        _i36.RouteConfig(NotiPage.name, path: '/noti'),
        _i36.RouteConfig(AboutPage.name, path: '/about'),
        _i36.RouteConfig(VendorPage.name, path: '/vendor'),
        _i36.RouteConfig(PaymentPage.name, path: '/payment'),
        _i36.RouteConfig(SearchPage.name, path: '/search'),
        _i36.RouteConfig(ShipingStatusPage.name, path: '/shiping_status'),
        _i36.RouteConfig(ReviewPage.name, path: '/review')
      ];
}

/// generated route for
/// [_i1.SplashScreen]
class SplashPage extends _i36.PageRouteInfo<void> {
  const SplashPage() : super(SplashPage.name, path: '/');

  static const String name = 'SplashPage';
}

/// generated route for
/// [_i2.WelcomeScreen]
class WelcomePage extends _i36.PageRouteInfo<void> {
  const WelcomePage() : super(WelcomePage.name, path: '/welcom_screen');

  static const String name = 'WelcomePage';
}

/// generated route for
/// [_i3.MainScreen]
class MainPage extends _i36.PageRouteInfo<void> {
  const MainPage() : super(MainPage.name, path: '/main');

  static const String name = 'MainPage';
}

/// generated route for
/// [_i4.HomeScreen]
class HomePage extends _i36.PageRouteInfo<HomePageArgs> {
  HomePage({_i37.Key? key, bool? isLogin = false})
      : super(HomePage.name,
            path: '/home', args: HomePageArgs(key: key, isLogin: isLogin));

  static const String name = 'HomePage';
}

class HomePageArgs {
  const HomePageArgs({this.key, this.isLogin = false});

  final _i37.Key? key;

  final bool? isLogin;

  @override
  String toString() {
    return 'HomePageArgs{key: $key, isLogin: $isLogin}';
  }
}

/// generated route for
/// [_i5.CategoryScreen]
class CategoryPage extends _i36.PageRouteInfo<void> {
  const CategoryPage() : super(CategoryPage.name, path: '/categories');

  static const String name = 'CategoryPage';
}

/// generated route for
/// [_i6.FavoriteScreen]
class FavoritePage extends _i36.PageRouteInfo<void> {
  const FavoritePage() : super(FavoritePage.name, path: '/favorite');

  static const String name = 'FavoritePage';
}

/// generated route for
/// [_i7.CartScreen]
class CartPage extends _i36.PageRouteInfo<CartPageArgs> {
  CartPage({_i37.Key? key, bool isBack = true})
      : super(CartPage.name,
            path: '/cart', args: CartPageArgs(key: key, isBack: isBack));

  static const String name = 'CartPage';
}

class CartPageArgs {
  const CartPageArgs({this.key, this.isBack = true});

  final _i37.Key? key;

  final bool isBack;

  @override
  String toString() {
    return 'CartPageArgs{key: $key, isBack: $isBack}';
  }
}

/// generated route for
/// [_i8.ProfileScreen]
class ProfilePage extends _i36.PageRouteInfo<void> {
  const ProfilePage() : super(ProfilePage.name, path: '/profile');

  static const String name = 'ProfilePage';
}

/// generated route for
/// [_i9.SigninScreen]
class SiginPage extends _i36.PageRouteInfo<SiginPageArgs> {
  SiginPage({_i37.Key? key})
      : super(SiginPage.name,
            path: '/signin_screen', args: SiginPageArgs(key: key));

  static const String name = 'SiginPage';
}

class SiginPageArgs {
  const SiginPageArgs({this.key});

  final _i37.Key? key;

  @override
  String toString() {
    return 'SiginPageArgs{key: $key}';
  }
}

/// generated route for
/// [_i10.SignUpScreen]
class SignupPage extends _i36.PageRouteInfo<SignupPageArgs> {
  SignupPage({_i37.Key? key})
      : super(SignupPage.name,
            path: '/signup_screen', args: SignupPageArgs(key: key));

  static const String name = 'SignupPage';
}

class SignupPageArgs {
  const SignupPageArgs({this.key});

  final _i37.Key? key;

  @override
  String toString() {
    return 'SignupPageArgs{key: $key}';
  }
}

/// generated route for
/// [_i11.CategoryListProductsScreen]
class CategoryListProductsScreen
    extends _i36.PageRouteInfo<CategoryListProductsScreenArgs> {
  CategoryListProductsScreen(
      {_i37.Key? key, required String id, required String name})
      : super(CategoryListProductsScreen.name,
            path: '/category_list_products_screen',
            args: CategoryListProductsScreenArgs(key: key, id: id, name: name));

  static const String name = 'CategoryListProductsScreen';
}

class CategoryListProductsScreenArgs {
  const CategoryListProductsScreenArgs(
      {this.key, required this.id, required this.name});

  final _i37.Key? key;

  final String id;

  final String name;

  @override
  String toString() {
    return 'CategoryListProductsScreenArgs{key: $key, id: $id, name: $name}';
  }
}

/// generated route for
/// [_i12.ForgotPassScreen]
class ForgotPassPage extends _i36.PageRouteInfo<ForgotPassPageArgs> {
  ForgotPassPage({_i37.Key? key})
      : super(ForgotPassPage.name,
            path: '/forgot_pass_screen', args: ForgotPassPageArgs(key: key));

  static const String name = 'ForgotPassPage';
}

class ForgotPassPageArgs {
  const ForgotPassPageArgs({this.key});

  final _i37.Key? key;

  @override
  String toString() {
    return 'ForgotPassPageArgs{key: $key}';
  }
}

/// generated route for
/// [_i13.ResetPassScreen]
class ResetPassPage extends _i36.PageRouteInfo<ResetPassPageArgs> {
  ResetPassPage({_i37.Key? key})
      : super(ResetPassPage.name,
            path: '/reset_pass_page', args: ResetPassPageArgs(key: key));

  static const String name = 'ResetPassPage';
}

class ResetPassPageArgs {
  const ResetPassPageArgs({this.key});

  final _i37.Key? key;

  @override
  String toString() {
    return 'ResetPassPageArgs{key: $key}';
  }
}

/// generated route for
/// [_i14.OtpScreen]
class OtpPage extends _i36.PageRouteInfo<OtpPageArgs> {
  OtpPage({_i37.Key? key, required String phone, bool isLogin = true})
      : super(OtpPage.name,
            path: '/otp_page',
            args: OtpPageArgs(key: key, phone: phone, isLogin: isLogin));

  static const String name = 'OtpPage';
}

class OtpPageArgs {
  const OtpPageArgs({this.key, required this.phone, this.isLogin = true});

  final _i37.Key? key;

  final String phone;

  final bool isLogin;

  @override
  String toString() {
    return 'OtpPageArgs{key: $key, phone: $phone, isLogin: $isLogin}';
  }
}

/// generated route for
/// [_i15.CardScreen]
class CardPage extends _i36.PageRouteInfo<CardPageArgs> {
  CardPage({_i37.Key? key})
      : super(CardPage.name, path: '/card_page', args: CardPageArgs(key: key));

  static const String name = 'CardPage';
}

class CardPageArgs {
  const CardPageArgs({this.key});

  final _i37.Key? key;

  @override
  String toString() {
    return 'CardPageArgs{key: $key}';
  }
}

/// generated route for
/// [_i16.FillProfileScreen]
class FillProfilePage extends _i36.PageRouteInfo<FillProfilePageArgs> {
  FillProfilePage({_i37.Key? key})
      : super(FillProfilePage.name,
            path: '/fill_profile', args: FillProfilePageArgs(key: key));

  static const String name = 'FillProfilePage';
}

class FillProfilePageArgs {
  const FillProfilePageArgs({this.key});

  final _i37.Key? key;

  @override
  String toString() {
    return 'FillProfilePageArgs{key: $key}';
  }
}

/// generated route for
/// [_i17.StatusOrderScreen]
class StatusOrderPage extends _i36.PageRouteInfo<void> {
  const StatusOrderPage() : super(StatusOrderPage.name, path: '/status_order');

  static const String name = 'StatusOrderPage';
}

/// generated route for
/// [_i18.OrderDetailScreen]
class OrderDetailPage extends _i36.PageRouteInfo<OrderDetailPageArgs> {
  OrderDetailPage(
      {_i37.Key? key,
      required String orderId,
      bool isPayment = true,
      dynamic Function(String, int)? onBack,
      int? statusOrder,
      required List<_i39.CartDocs> cartDocs})
      : super(OrderDetailPage.name,
            path: '/order_detail',
            args: OrderDetailPageArgs(
                key: key,
                orderId: orderId,
                isPayment: isPayment,
                onBack: onBack,
                statusOrder: statusOrder,
                cartDocs: cartDocs));

  static const String name = 'OrderDetailPage';
}

class OrderDetailPageArgs {
  const OrderDetailPageArgs(
      {this.key,
      required this.orderId,
      this.isPayment = true,
      this.onBack,
      this.statusOrder,
      required this.cartDocs});

  final _i37.Key? key;

  final String orderId;

  final bool isPayment;

  final dynamic Function(String, int)? onBack;

  final int? statusOrder;

  final List<_i39.CartDocs> cartDocs;

  @override
  String toString() {
    return 'OrderDetailPageArgs{key: $key, orderId: $orderId, isPayment: $isPayment, onBack: $onBack, statusOrder: $statusOrder, cartDocs: $cartDocs}';
  }
}

/// generated route for
/// [_i19.VoucherSreen]
class VoucherPage extends _i36.PageRouteInfo<VoucherPageArgs> {
  VoucherPage(
      {_i37.Key? key,
      bool isShop = false,
      required String vendorId,
      required String s,
      required String f,
      dynamic Function(List<String>, _i40.CheckoutData)? onBack,
      required List<String> voucherIds})
      : super(VoucherPage.name,
            path: '/voucher',
            args: VoucherPageArgs(
                key: key,
                isShop: isShop,
                vendorId: vendorId,
                s: s,
                f: f,
                onBack: onBack,
                voucherIds: voucherIds));

  static const String name = 'VoucherPage';
}

class VoucherPageArgs {
  const VoucherPageArgs(
      {this.key,
      this.isShop = false,
      required this.vendorId,
      required this.s,
      required this.f,
      this.onBack,
      required this.voucherIds});

  final _i37.Key? key;

  final bool isShop;

  final String vendorId;

  final String s;

  final String f;

  final dynamic Function(List<String>, _i40.CheckoutData)? onBack;

  final List<String> voucherIds;

  @override
  String toString() {
    return 'VoucherPageArgs{key: $key, isShop: $isShop, vendorId: $vendorId, s: $s, f: $f, onBack: $onBack, voucherIds: $voucherIds}';
  }
}

/// generated route for
/// [_i20.AddressScreen]
class AddressPage extends _i36.PageRouteInfo<AddressPageArgs> {
  AddressPage(
      {_i37.Key? key,
      _i41.AddressDataResponse? addressData,
      dynamic Function(_i41.AddressDataResponse)? onBack})
      : super(AddressPage.name,
            path: '/address',
            args: AddressPageArgs(
                key: key, addressData: addressData, onBack: onBack));

  static const String name = 'AddressPage';
}

class AddressPageArgs {
  const AddressPageArgs({this.key, this.addressData, this.onBack});

  final _i37.Key? key;

  final _i41.AddressDataResponse? addressData;

  final dynamic Function(_i41.AddressDataResponse)? onBack;

  @override
  String toString() {
    return 'AddressPageArgs{key: $key, addressData: $addressData, onBack: $onBack}';
  }
}

/// generated route for
/// [_i21.NewAddressScreen]
class NewAddressPage extends _i36.PageRouteInfo<NewAddressPageArgs> {
  NewAddressPage(
      {_i37.Key? key,
      dynamic Function(_i41.AddressDataResponse, bool)? onBack,
      _i41.AddressDataResponse? addressData,
      bool isUpdate = false})
      : super(NewAddressPage.name,
            path: '/new_address',
            args: NewAddressPageArgs(
                key: key,
                onBack: onBack,
                addressData: addressData,
                isUpdate: isUpdate));

  static const String name = 'NewAddressPage';
}

class NewAddressPageArgs {
  const NewAddressPageArgs(
      {this.key, this.onBack, this.addressData, this.isUpdate = false});

  final _i37.Key? key;

  final dynamic Function(_i41.AddressDataResponse, bool)? onBack;

  final _i41.AddressDataResponse? addressData;

  final bool isUpdate;

  @override
  String toString() {
    return 'NewAddressPageArgs{key: $key, onBack: $onBack, addressData: $addressData, isUpdate: $isUpdate}';
  }
}

/// generated route for
/// [_i22.PaymentCartScreen]
class PaymentCartPage extends _i36.PageRouteInfo<PaymentCartPageArgs> {
  PaymentCartPage({_i37.Key? key})
      : super(PaymentCartPage.name,
            path: '/payment_cart', args: PaymentCartPageArgs(key: key));

  static const String name = 'PaymentCartPage';
}

class PaymentCartPageArgs {
  const PaymentCartPageArgs({this.key});

  final _i37.Key? key;

  @override
  String toString() {
    return 'PaymentCartPageArgs{key: $key}';
  }
}

/// generated route for
/// [_i23.ProductsListScreen]
class ProductsListPage extends _i36.PageRouteInfo<ProductsListPageArgs> {
  ProductsListPage({_i37.Key? key})
      : super(ProductsListPage.name,
            path: '/products_list', args: ProductsListPageArgs(key: key));

  static const String name = 'ProductsListPage';
}

class ProductsListPageArgs {
  const ProductsListPageArgs({this.key});

  final _i37.Key? key;

  @override
  String toString() {
    return 'ProductsListPageArgs{key: $key}';
  }
}

/// generated route for
/// [_i24.DealOfTheDayListScreen]
class Deal_of_the_day_detail
    extends _i36.PageRouteInfo<Deal_of_the_day_detailArgs> {
  Deal_of_the_day_detail(
      {_i37.Key? key,
      required List<_i42.Product2> listProducts,
      required String namePage})
      : super(Deal_of_the_day_detail.name,
            path: '/deal_of_the_day_detail',
            args: Deal_of_the_day_detailArgs(
                key: key, listProducts: listProducts, namePage: namePage));

  static const String name = 'Deal_of_the_day_detail';
}

class Deal_of_the_day_detailArgs {
  const Deal_of_the_day_detailArgs(
      {this.key, required this.listProducts, required this.namePage});

  final _i37.Key? key;

  final List<_i42.Product2> listProducts;

  final String namePage;

  @override
  String toString() {
    return 'Deal_of_the_day_detailArgs{key: $key, listProducts: $listProducts, namePage: $namePage}';
  }
}

/// generated route for
/// [_i25.ProductDetailScreen]
class ProductDetailPage extends _i36.PageRouteInfo<ProductDetailPageArgs> {
  ProductDetailPage({_i37.Key? key, required String id})
      : super(ProductDetailPage.name,
            path: '/product_detail',
            args: ProductDetailPageArgs(key: key, id: id));

  static const String name = 'ProductDetailPage';
}

class ProductDetailPageArgs {
  const ProductDetailPageArgs({this.key, required this.id});

  final _i37.Key? key;

  final String id;

  @override
  String toString() {
    return 'ProductDetailPageArgs{key: $key, id: $id}';
  }
}

/// generated route for
/// [_i26.OrderSuccessScreen]
class OrderSuccessPage extends _i36.PageRouteInfo<void> {
  const OrderSuccessPage()
      : super(OrderSuccessPage.name, path: '/order_success');

  static const String name = 'OrderSuccessPage';
}

/// generated route for
/// [_i27.RuleScreen]
class RulePage extends _i36.PageRouteInfo<void> {
  const RulePage() : super(RulePage.name, path: '/rule');

  static const String name = 'RulePage';
}

/// generated route for
/// [_i28.HelpScreen]
class HelpPage extends _i36.PageRouteInfo<void> {
  const HelpPage() : super(HelpPage.name, path: '/help');

  static const String name = 'HelpPage';
}

/// generated route for
/// [_i29.NotiScreen]
class NotiPage extends _i36.PageRouteInfo<void> {
  const NotiPage() : super(NotiPage.name, path: '/noti');

  static const String name = 'NotiPage';
}

/// generated route for
/// [_i30.AboutScreen]
class AboutPage extends _i36.PageRouteInfo<void> {
  const AboutPage() : super(AboutPage.name, path: '/about');

  static const String name = 'AboutPage';
}

/// generated route for
/// [_i31.VendorScreen]
class VendorPage extends _i36.PageRouteInfo<VendorPageArgs> {
  VendorPage({_i37.Key? key, required String id})
      : super(VendorPage.name,
            path: '/vendor', args: VendorPageArgs(key: key, id: id));

  static const String name = 'VendorPage';
}

class VendorPageArgs {
  const VendorPageArgs({this.key, required this.id});

  final _i37.Key? key;

  final String id;

  @override
  String toString() {
    return 'VendorPageArgs{key: $key, id: $id}';
  }
}

/// generated route for
/// [_i32.PaymentScreen]
class PaymentPage extends _i36.PageRouteInfo<PaymentPageArgs> {
  PaymentPage(
      {_i37.Key? key,
      _i40.CheckoutResponseData? checkoutResponseData,
      List<String>? cartItemIds,
      bool isBuyNow = false,
      _i43.AddToCartRequest? addToCartRequest})
      : super(PaymentPage.name,
            path: '/payment',
            args: PaymentPageArgs(
                key: key,
                checkoutResponseData: checkoutResponseData,
                cartItemIds: cartItemIds,
                isBuyNow: isBuyNow,
                addToCartRequest: addToCartRequest));

  static const String name = 'PaymentPage';
}

class PaymentPageArgs {
  const PaymentPageArgs(
      {this.key,
      this.checkoutResponseData,
      this.cartItemIds,
      this.isBuyNow = false,
      this.addToCartRequest});

  final _i37.Key? key;

  final _i40.CheckoutResponseData? checkoutResponseData;

  final List<String>? cartItemIds;

  final bool isBuyNow;

  final _i43.AddToCartRequest? addToCartRequest;

  @override
  String toString() {
    return 'PaymentPageArgs{key: $key, checkoutResponseData: $checkoutResponseData, cartItemIds: $cartItemIds, isBuyNow: $isBuyNow, addToCartRequest: $addToCartRequest}';
  }
}

/// generated route for
/// [_i33.SearchScreen]
class SearchPage extends _i36.PageRouteInfo<SearchPageArgs> {
  SearchPage({_i37.Key? key, dynamic Function(String)? onBack})
      : super(SearchPage.name,
            path: '/search', args: SearchPageArgs(key: key, onBack: onBack));

  static const String name = 'SearchPage';
}

class SearchPageArgs {
  const SearchPageArgs({this.key, this.onBack});

  final _i37.Key? key;

  final dynamic Function(String)? onBack;

  @override
  String toString() {
    return 'SearchPageArgs{key: $key, onBack: $onBack}';
  }
}

/// generated route for
/// [_i34.ShipingStatusScreen]
class ShipingStatusPage extends _i36.PageRouteInfo<ShipingStatusPageArgs> {
  ShipingStatusPage(
      {_i37.Key? key,
      required String orderId,
      required String productImage,
      required int statusOrder})
      : super(ShipingStatusPage.name,
            path: '/shiping_status',
            args: ShipingStatusPageArgs(
                key: key,
                orderId: orderId,
                productImage: productImage,
                statusOrder: statusOrder));

  static const String name = 'ShipingStatusPage';
}

class ShipingStatusPageArgs {
  const ShipingStatusPageArgs(
      {this.key,
      required this.orderId,
      required this.productImage,
      required this.statusOrder});

  final _i37.Key? key;

  final String orderId;

  final String productImage;

  final int statusOrder;

  @override
  String toString() {
    return 'ShipingStatusPageArgs{key: $key, orderId: $orderId, productImage: $productImage, statusOrder: $statusOrder}';
  }
}

/// generated route for
/// [_i35.ReviewScreen]
class ReviewPage extends _i36.PageRouteInfo<ReviewPageArgs> {
  ReviewPage({_i37.Key? key, required List<_i39.CartDocs> cartDocs})
      : super(ReviewPage.name,
            path: '/review',
            args: ReviewPageArgs(key: key, cartDocs: cartDocs));

  static const String name = 'ReviewPage';
}

class ReviewPageArgs {
  const ReviewPageArgs({this.key, required this.cartDocs});

  final _i37.Key? key;

  final List<_i39.CartDocs> cartDocs;

  @override
  String toString() {
    return 'ReviewPageArgs{key: $key, cartDocs: $cartDocs}';
  }
}
