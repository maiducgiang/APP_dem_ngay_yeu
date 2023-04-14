import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:mubaha/ui/router/app_router.dart';
import 'package:mubaha/ui/screen/main/detail_board/detail_board.dart';
import 'package:mubaha/ui/screen/main/edit_board/edit_board_screen.dart';
import 'package:mubaha/ui/screen/main/main_screen.dart';
import 'package:mubaha/ui/screen/main/profile/profile_screen.dart';
import 'package:mubaha/ui/screen/main/review/review_screen.dart';
import 'package:mubaha/ui/screen/splash/splash_screen.dart';
import 'package:mubaha/ui/screen/welcome/welcome_screen.dart';
import 'package:auto_route/annotations.dart';

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
    AutoRoute(
        page: ProfileScreen, name: "ProfilePage", path: AppRoutes.profile),
    AutoRoute(page: ReviewScreen, name: 'ReviewPage', path: AppRoutes.review),
    AutoRoute(
        page: EditBoardScreen,
        name: "EditBoardPage",
        path: AppRoutes.editBoard),
    AutoRoute(
        page: DetailBoardScreen,
        name: "DetailBoardPage",
        path: AppRoutes.detailBoard)
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
