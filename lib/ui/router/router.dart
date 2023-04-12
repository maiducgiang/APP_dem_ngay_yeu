import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:mubaha/ui/router/app_router.dart';
import 'package:mubaha/ui/screen/auth/siginin/signin_screen.dart';
import 'package:mubaha/ui/screen/auth/signup/forgot_pass_screen.dart';
import 'package:mubaha/ui/screen/auth/signup/otp_screen.dart';
import 'package:mubaha/ui/screen/auth/signup/reset_pass_screen.dart';
import 'package:mubaha/ui/screen/auth/signup/siginup_screen.dart';
import 'package:mubaha/ui/screen/main/address/ui/address_screen.dart';
import 'package:mubaha/ui/screen/main/card/ui/card_screen.dart';
import 'package:mubaha/ui/screen/main/cart/cart_screen.dart';
import 'package:mubaha/ui/screen/main/cart/widget/payment/payment_cart_screen.dart';
import 'package:mubaha/ui/screen/main/category/category_screen.dart';
import 'package:mubaha/ui/screen/main/favorite/favorite_screen.dart';
import 'package:mubaha/ui/screen/main/fill_profile/ui/fill_profile_screen.dart';
import 'package:mubaha/ui/screen/main/home/home_screen.dart';
import 'package:mubaha/ui/screen/main/main_screen.dart';
import 'package:mubaha/ui/screen/main/new_address/ui/new_address_screen.dart';
import 'package:mubaha/ui/screen/main/notification/ui/noti_screen.dart';
import 'package:mubaha/ui/screen/main/order_detail/ui/order_detail_screen.dart';
import 'package:mubaha/ui/screen/main/order_success/ui/order_success_screen.dart';
import 'package:mubaha/ui/screen/main/other/about/ui/about_screen.dart';
import 'package:mubaha/ui/screen/main/other/help/ui/help_screen.dart';
import 'package:mubaha/ui/screen/main/other/rule/ui/rule_screen.dart';
import 'package:mubaha/ui/screen/main/payment/payment_screen.dart';
import 'package:mubaha/ui/screen/main/product_detail/product_detail_screen.dart';
import 'package:mubaha/ui/screen/main/products_list/products_list_screen.dart';
import 'package:mubaha/ui/screen/main/profile/profile_screen.dart';
import 'package:mubaha/ui/screen/main/review/review_screen.dart';
import 'package:mubaha/ui/screen/main/shiping_status/shiping_status_screen.dart';
import 'package:mubaha/ui/screen/main/status_order/ui/status_order_screen.dart';
import 'package:mubaha/ui/screen/main/vendor/vendor_screen.dart';
import 'package:mubaha/ui/screen/main/voucher/ui/voucher_screen.dart';
import 'package:mubaha/ui/screen/splash/splash_screen.dart';
import 'package:mubaha/ui/screen/welcome/welcome_screen.dart';
import 'package:mubaha/ui/shared/widget/search/search_screen.dart';

import '../screen/main/category_list_product/category_list_products_screen.dart';
import '../screen/main/deal_of_the_day_list/deal_of_the_day_screen.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(
        page: SplashScreen,
        name: "SplashPage",
        path: AppRoutes.splashScreen,
        initial: true),
    AutoRoute(
        page: WelcomeScreen,
        name: "WelcomePage",
        path: AppRoutes.welcomeScreen),
    AutoRoute(page: MainScreen, name: "MainPage", path: AppRoutes.main),
    AutoRoute(page: HomeScreen, name: "HomePage", path: AppRoutes.home),
    AutoRoute(
        page: CategoryScreen, name: "CategoryPage", path: AppRoutes.categories),
    AutoRoute(
        page: FavoriteScreen, name: "FavoritePage", path: AppRoutes.favorite),
    AutoRoute(page: CartScreen, name: "CartPage", path: AppRoutes.cart),
    AutoRoute(
        page: ProfileScreen, name: "ProfilePage", path: AppRoutes.profile),
    AutoRoute(page: SigninScreen, name: "SiginPage", path: AppRoutes.signin),
    AutoRoute(page: SignUpScreen, name: "SignupPage", path: AppRoutes.signup),
    AutoRoute(
        page: CategoryListProductsScreen,
        name: "categoryListProductsScreen",
        path: AppRoutes.categoryListProductsScreen),
    AutoRoute(
        page: ForgotPassScreen,
        name: "ForgotPassPage",
        path: AppRoutes.forgotPass),
    AutoRoute(
        page: ResetPassScreen,
        name: "ResetPassPage",
        path: AppRoutes.resetPass),
    AutoRoute(page: OtpScreen, name: "OtpPage", path: AppRoutes.otp),
    AutoRoute(page: CardScreen, name: "CardPage", path: AppRoutes.card),
    AutoRoute(
        page: FillProfileScreen,
        name: "FillProfilePage",
        path: AppRoutes.fillProfile),
    AutoRoute(
        page: StatusOrderScreen,
        name: "StatusOrderPage",
        path: AppRoutes.statusOrder),
    AutoRoute(
        page: OrderDetailScreen,
        name: "OrderDetailPage",
        path: AppRoutes.orderDetail),
    AutoRoute(page: VoucherSreen, name: "VoucherPage", path: AppRoutes.voucher),
    AutoRoute(
        page: AddressScreen, name: "AddressPage", path: AppRoutes.address),
    AutoRoute(
        page: NewAddressScreen,
        name: "NewAddressPage",
        path: AppRoutes.newAddress),
    AutoRoute(
        page: PaymentCartScreen,
        name: "PaymentCartPage",
        path: AppRoutes.paymentCart),
    AutoRoute(
        page: ProductsListScreen,
        name: "ProductsListPage",
        path: AppRoutes.productsList),
    AutoRoute(
        page: DealOfTheDayListScreen,
        name: "deal_of_the_day_detail",
        path: AppRoutes.dealOfTheDay),
    CustomRoute(
      page: ProductDetailScreen,
      name: "ProductDetailPage",
      path: AppRoutes.productDetail,
      fullscreenDialog: true,
      barrierDismissible: false,
      opaque: false,
      transitionsBuilder: slideBottomToTop,
    ),
    AutoRoute(
        page: OrderSuccessScreen,
        name: "OrderSuccessPage",
        path: AppRoutes.orderSuccess),
    AutoRoute(page: RuleScreen, name: "RulePage", path: AppRoutes.rule),
    AutoRoute(page: HelpScreen, name: "HelpPage", path: AppRoutes.help),
    AutoRoute(page: NotiScreen, name: "NotiPage", path: AppRoutes.noti),
    AutoRoute(page: AboutScreen, name: "AboutPage", path: AppRoutes.about),
    AutoRoute(page: VendorScreen, name: "VendorPage", path: AppRoutes.vendor),
    AutoRoute(
        page: PaymentScreen, name: "PaymentPage", path: AppRoutes.payment),
    CustomRoute(
      page: SearchScreen,
      name: "SearchPage",
      path: AppRoutes.search,
      fullscreenDialog: true,
      barrierDismissible: false,
      opaque: false,
      transitionsBuilder: slideBottomToTop,
    ),
    AutoRoute(
        page: ShipingStatusScreen,
        name: "ShipingStatusPage",
        path: AppRoutes.shipingStatus),
    AutoRoute(page: ReviewScreen, name: 'ReviewPage', path: AppRoutes.review)
  ],
)
class $AppRouter {}

Widget slideBottomToTop(context, animation, secondaryAnimation, child) {
  const begin = Offset(0.0, 1.0);
  const end = Offset.zero;
  const curve = Curves.fastLinearToSlowEaseIn;

  var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

  return SlideTransition(
    position: animation.drive(tween),
    child: child,
  );
}
