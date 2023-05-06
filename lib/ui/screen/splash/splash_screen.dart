import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mubaha/data/cache_manager.dart';
import 'package:mubaha/data/model/user_local/user_model_local.dart';
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

  final _cacheManager = CacheManager.instance;
  Future<void> init() async {
    await _remoteConfig.setConfigSettings(RemoteConfigSettings(
      fetchTimeout: const Duration(seconds: 60),
      minimumFetchInterval: const Duration(seconds: 1),
    ));
    await _remoteConfig.ensureInitialized();
    await _remoteConfig.activate();
    await _remoteConfig.fetchAndActivate().then((value) {
      checkFirtLoad(showSignUp: _remoteConfig.getBool('show_sign_up'));
    });
  }

  @override
  initState() {
    init();
    super.initState();
  }

  void checkFirtLoad({required bool showSignUp}) async {
    UserLocal? userLocal = await _cacheManager.getUserCached();

    await Future.delayed(const Duration(seconds: 1));
    if (userLocal != null) {
      context.router.push(const MainPage());
    } else {
      context.router.push(const SignUpFinalPage());
    }

    // context.router.pushAll([showSignUp ? SignUpPage() :  MainPage()]);
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
