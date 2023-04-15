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
import 'dart:typed_data' as _i14;

import 'package:auto_route/auto_route.dart' as _i10;
import 'package:flutter/material.dart' as _i11;

import '../../data/model/board_local/board_model.dart' as _i13;
import '../../data/model/cart/cart_model.dart' as _i12;
import '../screen/main/detail_board/detail_board.dart' as _i7;
import '../screen/main/edit_board/edit_board_screen.dart' as _i6;
import '../screen/main/image/image_screen.dart' as _i8;
import '../screen/main/main_screen.dart' as _i3;
import '../screen/main/profile/profile_screen.dart' as _i4;
import '../screen/main/review/review_screen.dart' as _i5;
import '../screen/sign_up/sign_up_screen.dart' as _i9;
import '../screen/splash/splash_screen.dart' as _i1;
import '../screen/welcome/welcome_screen.dart' as _i2;

class AppRouter extends _i10.RootStackRouter {
  AppRouter([_i11.GlobalKey<_i11.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i10.PageFactory> pagesMap = {
    SplashPage.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.SplashScreen(),
      );
    },
    WelcomePage.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.WelcomeScreen(),
      );
    },
    MainPage.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.MainScreen(),
      );
    },
    ProfilePage.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i4.ProfileScreen(),
      );
    },
    ReviewPage.name: (routeData) {
      final args = routeData.argsAs<ReviewPageArgs>();
      return _i10.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i5.ReviewScreen(
          key: args.key,
          cartDocs: args.cartDocs,
        ),
      );
    },
    EditBoardPage.name: (routeData) {
      final args = routeData.argsAs<EditBoardPageArgs>(
          orElse: () => const EditBoardPageArgs());
      return _i10.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i6.EditBoardScreen(
          key: args.key,
          boardModelLocal: args.boardModelLocal,
        ),
      );
    },
    DetailBoardPage.name: (routeData) {
      final args = routeData.argsAs<DetailBoardPageArgs>();
      return _i10.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i7.DetailBoardScreen(
          key: args.key,
          boardModelLocal: args.boardModelLocal,
        ),
      );
    },
    ShowImagePage.name: (routeData) {
      final args = routeData.argsAs<ShowImagePageArgs>();
      return _i10.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i8.ShowImageScreen(
          key: args.key,
          image: args.image,
        ),
      );
    },
    SignUp.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i9.SignUpScreen(),
      );
    },
  };

  @override
  List<_i10.RouteConfig> get routes => [
        _i10.RouteConfig(
          SplashPage.name,
          path: '/',
        ),
        _i10.RouteConfig(
          WelcomePage.name,
          path: '/welcom_screen',
        ),
        _i10.RouteConfig(
          MainPage.name,
          path: '/main',
        ),
        _i10.RouteConfig(
          ProfilePage.name,
          path: '/profile',
        ),
        _i10.RouteConfig(
          ReviewPage.name,
          path: '/review',
        ),
        _i10.RouteConfig(
          EditBoardPage.name,
          path: '/editBoard',
        ),
        _i10.RouteConfig(
          DetailBoardPage.name,
          path: '/detailBoardScreen',
        ),
        _i10.RouteConfig(
          ShowImagePage.name,
          path: '/ShowImageScreen',
        ),
        _i10.RouteConfig(
          SignUp.name,
          path: '/signup_screen',
        ),
      ];
}

/// generated route for
/// [_i1.SplashScreen]
class SplashPage extends _i10.PageRouteInfo<void> {
  const SplashPage()
      : super(
          SplashPage.name,
          path: '/',
        );

  static const String name = 'SplashPage';
}

/// generated route for
/// [_i2.WelcomeScreen]
class WelcomePage extends _i10.PageRouteInfo<void> {
  const WelcomePage()
      : super(
          WelcomePage.name,
          path: '/welcom_screen',
        );

  static const String name = 'WelcomePage';
}

/// generated route for
/// [_i3.MainScreen]
class MainPage extends _i10.PageRouteInfo<void> {
  const MainPage()
      : super(
          MainPage.name,
          path: '/main',
        );

  static const String name = 'MainPage';
}

/// generated route for
/// [_i4.ProfileScreen]
class ProfilePage extends _i10.PageRouteInfo<void> {
  const ProfilePage()
      : super(
          ProfilePage.name,
          path: '/profile',
        );

  static const String name = 'ProfilePage';
}

/// generated route for
/// [_i5.ReviewScreen]
class ReviewPage extends _i10.PageRouteInfo<ReviewPageArgs> {
  ReviewPage({
    _i11.Key? key,
    required List<_i12.CartDocs> cartDocs,
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

  final _i11.Key? key;

  final List<_i12.CartDocs> cartDocs;

  @override
  String toString() {
    return 'ReviewPageArgs{key: $key, cartDocs: $cartDocs}';
  }
}

/// generated route for
/// [_i6.EditBoardScreen]
class EditBoardPage extends _i10.PageRouteInfo<EditBoardPageArgs> {
  EditBoardPage({
    _i11.Key? key,
    _i13.BoardModelLocal? boardModelLocal,
  }) : super(
          EditBoardPage.name,
          path: '/editBoard',
          args: EditBoardPageArgs(
            key: key,
            boardModelLocal: boardModelLocal,
          ),
        );

  static const String name = 'EditBoardPage';
}

class EditBoardPageArgs {
  const EditBoardPageArgs({
    this.key,
    this.boardModelLocal,
  });

  final _i11.Key? key;

  final _i13.BoardModelLocal? boardModelLocal;

  @override
  String toString() {
    return 'EditBoardPageArgs{key: $key, boardModelLocal: $boardModelLocal}';
  }
}

/// generated route for
/// [_i7.DetailBoardScreen]
class DetailBoardPage extends _i10.PageRouteInfo<DetailBoardPageArgs> {
  DetailBoardPage({
    _i11.Key? key,
    required _i13.BoardModelLocal boardModelLocal,
  }) : super(
          DetailBoardPage.name,
          path: '/detailBoardScreen',
          args: DetailBoardPageArgs(
            key: key,
            boardModelLocal: boardModelLocal,
          ),
        );

  static const String name = 'DetailBoardPage';
}

class DetailBoardPageArgs {
  const DetailBoardPageArgs({
    this.key,
    required this.boardModelLocal,
  });

  final _i11.Key? key;

  final _i13.BoardModelLocal boardModelLocal;

  @override
  String toString() {
    return 'DetailBoardPageArgs{key: $key, boardModelLocal: $boardModelLocal}';
  }
}

/// generated route for
/// [_i8.ShowImageScreen]
class ShowImagePage extends _i10.PageRouteInfo<ShowImagePageArgs> {
  ShowImagePage({
    _i11.Key? key,
    required List<_i14.Uint8List> image,
  }) : super(
          ShowImagePage.name,
          path: '/ShowImageScreen',
          args: ShowImagePageArgs(
            key: key,
            image: image,
          ),
        );

  static const String name = 'ShowImagePage';
}

class ShowImagePageArgs {
  const ShowImagePageArgs({
    this.key,
    required this.image,
  });

  final _i11.Key? key;

  final List<_i14.Uint8List> image;

  @override
  String toString() {
    return 'ShowImagePageArgs{key: $key, image: $image}';
  }
}

/// generated route for
/// [_i9.SignUpScreen]
class SignUp extends _i10.PageRouteInfo<void> {
  const SignUp()
      : super(
          SignUp.name,
          path: '/signup_screen',
        );

  static const String name = 'SignUp';
}
