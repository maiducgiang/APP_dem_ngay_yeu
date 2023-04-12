import 'package:auto_route/auto_route.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:mubaha/ui/shared/base_screen.dart';

import '../../../../data/model/product/product2.dart';
import '../../../../icons/my_flutter_app_icons.dart';
import '../../../app_cubit.dart';
import '../../../app_state.dart';
import '../../../shared/widget/header/header.dart';
import '../../../theme/app_path.dart';
import '../../../theme/constant.dart';
import '../../../theme/theme.dart';
import '../products_list/products_list_screen.dart';

class DealOfTheDayListScreen extends StatefulWidget {
  DealOfTheDayListScreen(
      {Key? key, required this.listProducts, required this.namePage})
      : super(key: key);
  List<Product2> listProducts;
  String namePage;

  @override
  State<DealOfTheDayListScreen> createState() => _DealOfTheDayListState();
}

class _DealOfTheDayListState extends State<DealOfTheDayListScreen> {
  final ScrollController _scrollController = ScrollController();
  var isShowFilterOptions = true;
  var selectFilterOptions = "";

  Widget renderHeader(BuildContext context, AppState appState) {
    return Header(
      leading: GestureDetector(
        onTap: () {
          context.router.pop();
        },
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.zero,
          child: Icon(
            Ionicons.chevron_back_outline,
            size: 20.sp,
          ),
        ),
      ),
      title: "Deal Of The Day",
      trailing: Row(children: [
        InkWell(
          onTap: () {
            // Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //         builder: (context) => MultiBlocProvider(
            //           providers: [
            //             BlocProvider(
            //               create: (context) =>
            //                   CartCubit(getIt.get<CustomerRepository>()),
            //             ),
            //             BlocProvider(
            //               create: (context) => SelectCartCubit(),
            //             ),
            //             BlocProvider(
            //                 create: (context) =>
            //                     PaymentCubit(getIt.get<CustomerRepository>()))
            //           ],
            //           child: CartScreen(),
            //         )));
          },
          child: Container(
            //margin: const EdgeInsets.only(bottom: kDefaultPaddingScreen, top: kDefaultPaddingScreen),
            padding: EdgeInsets.symmetric(horizontal: kDefaultPaddingScreen.w),
            child: appState.userSession != null
                ? badges.Badge(
                    padding:
                        EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h),
                    shape: badges.BadgeShape.square,
                    borderRadius: BorderRadius.circular(10.r),
                    badgeContent: Text(appState.totalCart.toString(),
                        style: TextStyle(color: Colors.white, fontSize: 9.sp)),
                    child: const Icon(
                      MyFlutterApp.cart,
                      color: Colors.black,
                    ),
                  )
                : const Icon(
                    MyFlutterApp.cart,
                    color: Colors.black,
                  ),
          ),
        ),
        InkWell(
          child: Container(
            padding: EdgeInsets.zero,
            child: SvgPicture.asset(
              AppPath.searchIcon,
              color: Colors.black,
              width: 18.w,
            ),
          ),
        ),
      ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: BaseScreen(
      child: BlocBuilder<AppCubit, AppState>(
        builder: (context, appState) {
          return Column(
            children: [
              Container(
                //alignment: Alignment.topCenter,
                child: renderHeader(context, appState),
                // decoration: BoxDecoration(
                //   color: Colors.white,
                //   //borderRadius: BorderRadius.circular(30), //border corner radius
                //   boxShadow:[
                //     BoxShadow(
                //       color: Colors.grey.withOpacity(0.5), //color of shadow
                //       //spreadRadius: 5, //spread radius
                //       blurRadius: 5, // blur radius
                //       offset: Offset(0, 2), // changes position of shadow
                //       //first paramerter of offset is left-right
                //       //second parameter is top to down
                //     ),
                //     //you can set more BoxShadow() here
                //   ],
                // ),
              ),
              Expanded(
                  child: Container(
                //padding: EdgeInsets.symmetric(vertical: 5.h),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  controller: _scrollController,
                  child: Column(
                    children: [
                      widget.listProducts.isEmpty
                          ? Container(
                              //margin: EdgeInsets.only(top: 20.h),
                              alignment: Alignment.center,
                              child: Text("Không tìm thấy kết quả",
                                  style: titleStyle),
                            )
                          : renderProductList(context, widget.listProducts),
                    ],
                  ),
                ),
              )),
            ],
          );
        },
      ),
    ));
  }
}
