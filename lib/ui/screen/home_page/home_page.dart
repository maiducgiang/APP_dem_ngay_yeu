import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:lottie/lottie.dart';
import 'package:mubaha/ui/screen/home_page/cubit/home_page_cubit.dart';
import 'package:mubaha/ui/screen/home_page/widgets/add_day.dart';
import 'package:mubaha/ui/screen/home_page/widgets/count_circle.dart';
import 'package:mubaha/ui/screen/home_page/widgets/home_footer.dart';
import 'package:mubaha/ui/shared/widget/edit_popup.dart';
import 'package:mubaha/ui/theme/app_path.dart';

import 'widgets/home_header.dart';
import 'widgets/hour_progress.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomePageCubit(),
      child: const HomePageScreen(),
    );
  }
}

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({Key? key}) : super(key: key);

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  late final HomePageCubit _homePageCubit;

  @override
  void initState() {
    _homePageCubit = context.read<HomePageCubit>()..init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        physics:
            const NeverScrollableScrollPhysics(parent: ClampingScrollPhysics()),
        child: Container(
          height: MediaQuery.of(context).size.height - 100.h,
          decoration: const BoxDecoration(
            // image: DecorationImage(
            //     fit: BoxFit.cover, image: AssetImage(AppPath.background3)
            // ),
            gradient: LinearGradient(
                colors: [
                  Color(0xFFFFDDDD),
                  Color(0xFFFDB1B1),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.0, 1.0],
                tileMode: TileMode.clamp),
          ),
          child: Column(
            children: const [
              HomeHeader(),
              CountCircle(),
              AddDay(),
              HomeFooter()
            ],
          ),
        ),
      ),
    );
  }
}
