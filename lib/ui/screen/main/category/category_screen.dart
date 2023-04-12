import 'package:auto_route/auto_route.dart';
import 'package:badges/badges.dart' as badges;
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mubaha/data/model/category/category.dart';
import 'package:mubaha/data/repository/customer/customer_repository.dart';
import 'package:mubaha/icons/my_flutter_app_icons.dart';
import 'package:mubaha/injection.dart';
import 'package:mubaha/translations/locale_keys.g.dart';
import 'package:mubaha/ui/app_cubit.dart';
import 'package:mubaha/ui/app_state.dart';
import 'package:mubaha/ui/router/router.gr.dart';
import 'package:mubaha/ui/screen/main/category/cubit/category_cubit.dart';
import 'package:mubaha/ui/screen/main/category/cubit/category_state.dart';
import 'package:mubaha/ui/screen/main/category/widget/category_item.dart';
import 'package:mubaha/ui/shared/base_screen.dart';
import 'package:mubaha/ui/shared/loading_screen.dart';
import 'package:mubaha/ui/shared/widget/header/header.dart';
import 'package:mubaha/ui/theme/app_path.dart';
import 'package:mubaha/ui/theme/constant.dart';
import 'package:mubaha/ui/theme/theme.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      child: BlocProvider(
        create: (context) => CategoryCubit(getIt.get<CustomerRepository>())
          ..getDataCtegoryScreen(),
        child: BlocConsumer<CategoryCubit, CategoryState>(
            builder: (context, state) {
              if (state.isLoading) {
                return const LoadingScreen();
              }
              if (state.listCategory.isEmpty) {
                return Container(
                  alignment: Alignment.center,
                  child: Text(
                    "Hiện chưa có danh mục.",
                    style: titleStyle,
                  ),
                );
              }
              return BlocBuilder<AppCubit, AppState>(
                builder: (context, appState) {
                  return Container(
                    padding: EdgeInsets.zero,
                    child: Column(
                      children: [
                        renderHeader(context, appState),
                        renderBody(context, state.listCategory)
                      ],
                    ),
                  );
                },
              );
            },
            listener: (context, state) {}),
      ),
    );
  }
}

Widget renderHeader(BuildContext context, AppState appState) {
  return Header(
    title: LocaleKeys.category.tr(),
    trailing: Row(children: [
      InkWell(
        onTap: () {
          context.router.push(CartPage());
        },
        child: Container(
          //margin: const EdgeInsets.only(bottom: kDefaultPaddingScreen, top: kDefaultPaddingScreen),
          padding: EdgeInsets.symmetric(horizontal: kDefaultPaddingScreen.w),
          child: appState.userSession != null
              ? badges.Badge(
                  padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h),
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

Widget renderBody(BuildContext context, List<Category> listCategory) {
  return Expanded(
      child: Container(
    padding: EdgeInsets.symmetric(horizontal: kDefaultPaddingScreen.w),
    // margin: EdgeInsets.only(top: kDefaultPaddingScreen.h),
    child: ListView.builder(
      shrinkWrap: true,
      itemCount: listCategory.length,
      itemBuilder: (ctx, index) {
        final Category item = listCategory[index];
        return GestureDetector(
          onTap: () {
            context.router.push(
                CategoryListProductsScreen(id: item.id ?? "", name: item.name));
          },
          child: CategoryItem(
            item: item,
            index: index,
          ),
        );
      },
    ),
  ));
}
