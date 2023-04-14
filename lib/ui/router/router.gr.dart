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

import '../../data/model/board_local/board_model.dart' as _i11;
import '../../data/model/cart/cart_model.dart' as _i10;
import '../screen/main/detail_board/detail_board.dart' as _i7;
import '../screen/main/edit_board/edit_board_screen.dart' as _i6;
import '../screen/main/main_screen.dart' as _i3;
import '../screen/main/profile/profile_screen.dart' as _i4;
import '../screen/main/review/review_screen.dart' as _i5;
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
      final args = routeData.argsAs<EditBoardPageArgs>(
          orElse: () => const EditBoardPageArgs());
      return _i8.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i6.EditBoardScreen(
          key: args.key,
          boardModelLocal: args.boardModelLocal,
        ),
      );
    },
    DetailBoardPage.name: (routeData) {
      final args = routeData.argsAs<DetailBoardPageArgs>();
      return _i8.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i7.DetailBoardScreen(
          key: args.key,
          boardModelLocal: args.boardModelLocal,
        ),
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
          DetailBoardPage.name,
          path: '/detailBoardScreen',
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
class EditBoardPage extends _i8.PageRouteInfo<EditBoardPageArgs> {
  EditBoardPage({
    _i9.Key? key,
    _i11.BoardModelLocal? boardModelLocal,
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

  final _i9.Key? key;

  final _i11.BoardModelLocal? boardModelLocal;

  @override
  String toString() {
    return 'EditBoardPageArgs{key: $key, boardModelLocal: $boardModelLocal}';
  }
}

/// generated route for
/// [_i7.DetailBoardScreen]
class DetailBoardPage extends _i8.PageRouteInfo<DetailBoardPageArgs> {
  DetailBoardPage({
    _i9.Key? key,
    required _i11.BoardModelLocal boardModelLocal,
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

  final _i9.Key? key;

  final _i11.BoardModelLocal boardModelLocal;

  @override
  String toString() {
    return 'DetailBoardPageArgs{key: $key, boardModelLocal: $boardModelLocal}';
  }
}
