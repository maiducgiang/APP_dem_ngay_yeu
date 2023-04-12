import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:mubaha/data/repository/customer/customer_repository.dart';
import 'package:mubaha/injection.dart';
import 'package:mubaha/ui/screen/main/home/widget/style/your_style.dart';
import 'package:mubaha/ui/screen/main/vendor/bloc/vendor_cubit.dart';
import 'package:mubaha/ui/screen/main/vendor/bloc/vendor_state.dart';
import 'package:mubaha/ui/screen/main/vendor/widget/flashsale_vendor_widget.dart';
import 'package:mubaha/ui/shared/loading_screen.dart';
import 'package:mubaha/ui/shared/utils/functions.dart';
import 'package:mubaha/ui/shared/widget/search_bar/search_widget.dart';
import 'package:mubaha/ui/theme/constant.dart';
import 'package:mubaha/ui/theme/theme.dart';

class VendorScreen extends StatefulWidget {
  VendorScreen({Key? key, required this.id}) : super(key: key);
  final String id;

  @override
  State<VendorScreen> createState() => _VendorScreenState();
}

class _VendorScreenState extends State<VendorScreen> {
  List<String> listTitleTopic = ['Shop', 'Product', 'Flash Sale'];

  int topicSelect = 0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        unfocus(context);
      },
      child: Scaffold(
        body: BlocProvider(
          create: (context) =>
              VendorCubit(getIt.get<CustomerRepository>(), widget.id)
                ..getVendorDetail(widget.id),
          child: BlocConsumer<VendorCubit, VendorState>(
            listener: (context, state) {},
            builder: (context, state) {
              List<Widget> listTopic = [
                YourStyle(
                  listYourStyle: state.suggestedForYou,
                  categoryIndex: 1,
                  showTitle: false,
                ),
                YourStyle(
                  listYourStyle: state.dealsOfTheDay,
                  categoryIndex: 1,
                  showTitle: false,
                ),
                // ProductVendorWidget(),
                FlashsaleVendorWidget(
                  listProduct: state.flashSales,
                ),
              ];
              if (state.isLoading) return const LoadingScreen();
              return CustomScrollView(
                slivers: [
                  SliverAppBar(
                    systemOverlayStyle: const SystemUiOverlayStyle(
                        statusBarBrightness: Brightness.dark),
                    elevation: 0,
                    expandedHeight: 180.h,
                    backgroundColor: Colors.grey,
                    pinned: true,
                    leading: IconButton(
                        icon: const Icon(
                          Icons.arrow_back,
                        ),
                        onPressed: () => Navigator.pop(context)),
                    actions: [
                      IconButton(
                          icon: const Icon(
                            Icons.more_horiz,
                          ),
                          onPressed: () {})
                    ],
                    title: Row(
                      children: [
                        const SearchWidget(),
                        Container(
                          height: 35.h,
                          width: 35.h,
                          margin:
                              EdgeInsets.only(left: kDefaultPaddingWidthScreen),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(3),
                              border: Border.all(color: Colors.white)),
                          child: const Icon(
                            Icons.filter_list,
                          ),
                        ),
                      ],
                    ),
                    flexibleSpace: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            primaryColor,
                            primaryColor.withOpacity(0.7),
                          ],
                        ),
                      ),
                      child: FlexibleSpaceBar(
                        collapseMode: CollapseMode.pin,
                        background: Container(
                          decoration: BoxDecoration(
                              color: Colors.grey,
                              image: DecorationImage(
                                  image: NetworkImage(state.vendor!.cover),
                                  fit: BoxFit.cover,
                                  colorFilter: ColorFilter.mode(
                                      Colors.grey.withOpacity(0.3),
                                      BlendMode.dstATop))),
                          child: Padding(
                            padding: EdgeInsets.all(kDefaultPaddingWidthWidget),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                SizedBox(
                                  height: kDefaultPaddingHeightWidget,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(
                                          right: kDefaultPaddingWidthWidget),
                                      height: 58.h,
                                      width: 58.h,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          image: DecorationImage(
                                              image: NetworkImage(
                                                state.vendor!.avatar,
                                              ),
                                              fit: BoxFit.fill)),
                                    ),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            state.vendor!.brandName,
                                            style: categoryTitleStyle.copyWith(
                                                color: Colors.white),
                                          ),
                                          Text(
                                            state.vendor!.active
                                                ? 'Online'
                                                : 'Offline',
                                            style:
                                                textCategoryNameStyle.copyWith(
                                                    color: Colors.white,
                                                    height: 2.h),
                                          )
                                        ],
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal:
                                              kDefaultPaddingWidthScreen,
                                          vertical: 5.h),
                                      color: primaryColor,
                                      child: Center(
                                        child: Text(
                                          'Follow',
                                          style: textCategoryNameStyle.copyWith(
                                              color: Colors.white),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: kDefaultPaddingHeightWidget,
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                        child: VendorItem(
                                            data: state.vendor!.ratingOverall
                                                    .toString() +
                                                '/5.0',
                                            content: 'Shop review')),
                                    Expanded(
                                        child: VendorItem(
                                            data: state.vendor!.followers
                                                .toString(),
                                            content: 'Followers')),
                                    Expanded(
                                      child: VendorItem(
                                          data: state.vendor!.responseRate
                                                  .toString() +
                                              '%',
                                          content: 'Chat response'),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SliverStickyHeader(
                    header: Container(
                      color: Colors.white,
                      height: 40.h,
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: listTitleTopic.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                topicSelect = index;
                              });
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width / 3,
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          color: topicSelect == index
                                              ? primaryColor
                                              : Colors.transparent))),
                              child: Center(
                                  child: Text(
                                listTitleTopic[index],
                                style: titleStyle.copyWith(
                                    fontWeight: FontWeight.w400,
                                    color: topicSelect == index
                                        ? primaryColor
                                        : Colors.black),
                              )),
                            ),
                          );
                        },
                      ),
                    ),
                    sliver: SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, i) => listTopic[topicSelect],
                        childCount: 1,
                      ),
                    ),
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class VendorItem extends StatelessWidget {
  const VendorItem({Key? key, required this.data, required this.content})
      : super(key: key);
  final String data;
  final String content;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          data,
          style: textCategoryNameStyle.copyWith(color: Colors.white),
        ),
        Text(
          content,
          style: textCategoryNameStyle.copyWith(
              color: Colors.white, height: 1.3.h),
        )
      ],
    );
  }
}
