import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mubaha/ui/router/router.gr.dart';
import 'package:mubaha/ui/services/account_services.dart';
import 'package:mubaha/ui/theme/app_path.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  initState() {
    // Future.delayed(const Duration(seconds: 1), () {
    //   context.router.push(const WelcomePage());
    // });
    checkFirtLoad();

    super.initState();
  }

  void checkFirtLoad() async {
    final bool isFirstLoad = await AccountServices().getIsFirstLoad();
    if (isFirstLoad == false) {
      context.router.push(const WelcomePage());
    } else {
      context.router.push(const MainPage());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            alignment: Alignment.center,
            child: Center(
              child: SvgPicture.asset(
                AppPath.logoSvg,
                color: Colors.black,
                width: 200.w,
              ),
            )));
  }
}
