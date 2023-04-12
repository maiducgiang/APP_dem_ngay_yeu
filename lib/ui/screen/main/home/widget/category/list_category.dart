import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mubaha/data/model/category/category.dart';
import 'package:mubaha/ui/router/router.gr.dart';
import 'package:mubaha/ui/screen/main/home/widget/category/category_item.dart';
import 'package:mubaha/ui/theme/constant.dart';

class ListCategory extends StatelessWidget {
  const ListCategory({Key? key, required this.listCategory}) : super(key: key);
  final List<CategoryHomepage> listCategory;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: kDefaultPaddingScreen),
      margin: EdgeInsets.symmetric(vertical: 10.h),
      height: 90.h,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: listCategory.length,
        itemBuilder: (ctx, index) {
          final CategoryHomepage item = listCategory[index];
          return GestureDetector(
            onTap: () {
              context.router.push(CategoryListProductsScreen(id: item.id, name: item.name));
            },
            child: CategoryItem(
              item: item,
              index: index,
            ),
          );
        },
      ),
    );
  }
}
