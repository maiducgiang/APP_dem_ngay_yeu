// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i8;
import 'package:flutter/material.dart' as _i9;

import '../../data/model/cart/cart_model.dart' as _i10;
import '../screen/main/edit_board/edit_board_screen.dart' as _i6;
import '../screen/main/main_screen.dart' as _i3;
import '../screen/main/profile/profile_screen.dart' as _i4;
import '../screen/main/review/review_screen.dart' as _i5;
import '../screen/sign_up/sign_up_screen.dart' as _i7;
import '../screen/splash/splash_screen.dart' as _i1;
import '../screen/welcome/welcome_screen.dart' as _i2;

class AppRouter extends _i8.RootStackRouter {
  AppRouter([_i9.GlobalKey<_i9.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i8.PageFactory> pagesMap = {
    SplashPage.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.SplashScreen(),
      );
    },
    WelcomePage.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.WelcomeScreen(),
      );
    },
    MainPage.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.MainScreen(),
      );
    },
    ProfilePage.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i4.ProfileScreen(),
      );
    },
    ReviewPage.name: (routeData) {
      final args = routeData.argsAs<ReviewPageArgs>();
      return _i8.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i5.ReviewScreen(
          key: args.key,
          cartDocs: args.cartDocs,
        ),
      );
    },
    EditBoardPage.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i6.EditBoardScreen(),
      );
    },
    SignUpScreen.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i7.SignUpScreen(),
      );
    },
  };

  @override
  List<_i8.RouteConfig> get routes => [
        _i8.RouteConfig(
          SplashPage.name,
          path: '/',
        ),
        _i8.RouteConfig(
          WelcomePage.name,
          path: '/welcom_screen',
        ),
        _i8.RouteConfig(
          MainPage.name,
          path: '/main',
        ),
        _i8.RouteConfig(
          ProfilePage.name,
          path: '/profile',
        ),
        _i8.RouteConfig(
          ReviewPage.name,
          path: '/review',
        ),
        _i8.RouteConfig(
          EditBoardPage.name,
          path: '/editBoard',
        ),
        _i8.RouteConfig(
          SignUpScreen.name,
          path: '/signup_screen',
        ),
      ];
}

/// generated route for
/// [_i1.SplashScreen]
class SplashPage extends _i8.PageRouteInfo<void> {
  const SplashPage()
      : super(
          SplashPage.name,
          path: '/',
        );

  static const String name = 'SplashPage';
}

/// generated route for
/// [_i2.WelcomeScreen]
class WelcomePage extends _i8.PageRouteInfo<void> {
  const WelcomePage()
      : super(
          WelcomePage.name,
          path: '/welcom_screen',
        );

  static const String name = 'WelcomePage';
}

/// generated route for
/// [_i3.MainScreen]
class MainPage extends _i8.PageRouteInfo<void> {
  const MainPage()
      : super(
          MainPage.name,
          path: '/main',
        );

  static const String name = 'MainPage';
}

/// generated route for
/// [_i4.ProfileScreen]
class ProfilePage extends _i8.PageRouteInfo<void> {
  const ProfilePage()
      : super(
          ProfilePage.name,
          path: '/profile',
        );

  static const String name = 'ProfilePage';
}

/// generated route for
/// [_i5.ReviewScreen]
class ReviewPage extends _i8.PageRouteInfo<ReviewPageArgs> {
  ReviewPage({
    _i9.Key? key,
    required List<_i10.CartDocs> cartDocs,
  }) : super(
          ReviewPage.name,
          path: '/review',
          args: ReviewPageArgs(
            key: key,
            cartDocs: cartDocs,
          ),
        );

  static const String name = 'ReviewPage';
}

class ReviewPageArgs {
  const ReviewPageArgs({
    this.key,
    required this.cartDocs,
  });

  final _i9.Key? key;

  final List<_i10.CartDocs> cartDocs;

  @override
  String toString() {
    return 'ReviewPageArgs{key: $key, cartDocs: $cartDocs}';
  }
}

/// generated route for
/// [_i6.EditBoardScreen]
class EditBoardPage extends _i8.PageRouteInfo<void> {
  const EditBoardPage()
      : super(
          EditBoardPage.name,
          path: '/editBoard',
        );

  static const String name = 'EditBoardPage';
}

/// generated route for
/// [_i7.SignUpScreen]
class SignUpScreen extends _i8.PageRouteInfo<void> {
  const SignUpScreen()
      : super(
          SignUpScreen.name,
          path: '/signup_screen',
        );

  static const String name = 'SignUpScreen';
}
