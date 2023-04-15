import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mubaha/ui/router/router.gr.dart';
import 'package:mubaha/ui/theme/app_path.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../sign_up/sign_up_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final _remoteConfig = FirebaseRemoteConfig.instance;

  Future<void> init() async {
    await _remoteConfig.setConfigSettings(RemoteConfigSettings(
      fetchTimeout: const Duration(seconds: 1),
      minimumFetchInterval: const Duration(seconds: 1),
    ));
    await _remoteConfig.fetchAndActivate();
  }

  @override
  initState() {
    init();
    checkFirtLoad();
    super.initState();
  }

  void checkFirtLoad() async {
    await Future.delayed(const Duration(seconds: 1));
    context.router.pushAll([
      _remoteConfig.getBool('show_sign_up') ? const SignUp() : const MainPage()
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            alignment: Alignment.center,
            child: Center(
              child: SvgPicture.asset(
                AppPath.logoSvg,
                //color: Colors.black,
                width: 200.w,
              ),
            )));
  }
}
