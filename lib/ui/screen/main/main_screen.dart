import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mubaha/ui/screen/main/board/board_screen.dart';
import 'package:mubaha/ui/screen/main/profile/profile_screen.dart';
import 'package:mubaha/ui/theme/constant.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  var tabIndex = 0;

  final _screenList = [
    Container(),
    const BoardScreen(),
    // Container(),
    // const HomeScreen(),
    // const CategoryScreen(),
    // CartScreen(
    //   isBack: false,
    // ),
    // const FavoriteScreen(),
    const ProfileScreen()
  ];

  void changeTabIndex(int index) {
    setState(() {
      tabIndex = index;
    });
  }

  getScreen() => _screenList[tabIndex];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getScreen(),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 3,
              offset: const Offset(0, 4), // changes position of shadow
            ),
          ],
        ),
        child: BottomNavigationBar(
          selectedFontSize: 12,
          unselectedFontSize: 12,
          onTap: changeTabIndex,
          currentIndex: tabIndex,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: primaryColor,
          unselectedItemColor: greyPrymaryColor,
          selectedLabelStyle: TextStyle(fontSize: 13.sp),
          unselectedLabelStyle: TextStyle(fontSize: 13.sp),
          elevation: 0,
          items: [
            BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.only(bottom: 6.h, top: 6.h),
                  child: SvgPicture.asset(
                    "assets/images/icons/bottomnavigator_heart.svg",
                    color: greyPrymaryColor,
                    width: 24,
                  ),
                ),
                activeIcon: Padding(
                  padding: EdgeInsets.only(bottom: 6.h, top: 6.h),
                  child: SvgPicture.asset(
                    "assets/images/icons/bottomnavigator_heart_selected.svg",
                    color: primaryColor,
                    width: 24,
                  ),
                ),
                label: 'Ngày yêu'),
            BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.only(bottom: 6.h, top: 6.h),
                  child: SvgPicture.asset(
                    "assets/images/icons/bottomnavigator_board.svg",
                    color: greyPrymaryColor,
                    width: 24,
                  ),
                ),
                activeIcon: Padding(
                  padding: EdgeInsets.only(bottom: 6.h, top: 6.h),
                  child: SvgPicture.asset(
                    "assets/images/icons/bottomnavigator_board_selected.svg",
                    color: primaryColor,
                    width: 24,
                  ),
                ),
                label: 'Kỷ niệm'),
            BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.only(bottom: 6.h, top: 6.h),
                  child: SvgPicture.asset(
                    "assets/images/icons/bottomnavigator_setting.svg",
                    color: greyPrymaryColor,
                    width: 24,
                  ),
                ),
                activeIcon: Padding(
                  padding: EdgeInsets.only(bottom: 6.h, top: 6.h),
                  child: SvgPicture.asset(
                    "assets/images/icons/bottomnavigator_setting_selected.svg",
                    color: primaryColor,
                    width: 24,
                  ),
                ),
                label: 'Cài đặt'),
          ],
        ),
      ),
    );
  }
}
