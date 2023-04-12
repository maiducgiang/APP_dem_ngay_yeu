import 'dart:async';

import 'package:auto_route/auto_route.dart';

import 'package:badges/badges.dart' as badges;
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:mubaha/data/model/product_detail_screen/product_detail_response.dart';
import 'package:mubaha/data/repository/customer/customer_repository.dart';
import 'package:mubaha/icons/my_flutter_app_icons.dart';
import 'package:mubaha/injection.dart';
import 'package:mubaha/translations/locale_keys.g.dart';
import 'package:mubaha/ui/app_cubit.dart';
import 'package:mubaha/ui/app_state.dart';
import 'package:mubaha/ui/router/router.gr.dart';
import 'package:mubaha/ui/screen/main/cart/cart_screen.dart';
import 'package:mubaha/ui/screen/main/cart/cubit/cart_cubit/cart_cubit.dart';
import 'package:mubaha/ui/screen/main/cart/cubit/select_cart_cubit/select_cart_cubit.dart';
import 'package:mubaha/ui/screen/main/home/cubit/home_cubit.dart';
import 'package:mubaha/ui/screen/main/payment/cubit/payment_cubit.dart';
import 'package:mubaha/ui/screen/main/product_detail/cubit/product_detail_cubit.dart';
import 'package:mubaha/ui/screen/main/product_detail/cubit/product_detail_state.dart';
import 'package:mubaha/ui/screen/main/product_detail/cubit/variant_cubit.dart';
import 'package:mubaha/ui/screen/main/product_detail/cubit/variant_state.dart';
import 'package:mubaha/ui/screen/main/product_detail/widget/attribute_widget.dart';
import 'package:mubaha/ui/screen/main/product_detail/widget/main_infor_widget.dart';
import 'package:mubaha/ui/screen/main/product_detail/widget/product_desc_widget.dart';
import 'package:mubaha/ui/screen/main/product_detail/widget/product_detail_shimmer_widget.dart';
import 'package:mubaha/ui/screen/main/product_detail/widget/related_product_widget.dart';
import 'package:mubaha/ui/screen/main/product_detail/widget/review_widget.dart';
import 'package:mubaha/ui/screen/main/product_detail/widget/vendor_product_widget.dart';
import 'package:mubaha/ui/screen/main/product_detail/widget/warranty_widget.dart';
import 'package:mubaha/ui/shared/utils/functions.dart';
import 'package:mubaha/ui/shared/widget/bottom/base_bottom.dart';
import 'package:mubaha/ui/shared/widget/divider/divider_widget.dart';
import 'package:mubaha/ui/shared/widget/header/header.dart';
import 'package:mubaha/ui/theme/constant.dart';
import 'package:mubaha/ui/theme/theme.dart';

class ProductDetailScreen extends StatefulWidget {
  ProductDetailScreen({Key? key, required this.id}) : super(key: key);
  final String id;

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  late Timer _timer;
  void _addingToCart() {
    showDialog(
        context: context,
        builder: (context) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        });
  }

  void _alerDialog() async {
    showDialog(
        context: context,
        builder: (context) {
          _timer = Timer(Duration(seconds: 2), () {
            Navigator.of(context).pop();
          });
          return AlertDialog(
            contentPadding: EdgeInsets.symmetric(
                vertical: kDefaultPaddingHeightScreen,
                horizontal: kDefaultPaddingWidthScreen),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.info_outline,
                ),
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  'Vui lòng chọn loại sản phẩm',
                  style: subTitleStyle.copyWith(color: titleColor),
                  textAlign: TextAlign.center,
                )
              ],
            ),
          );
        }).then((val) {
      if (_timer.isActive) {
        _timer.cancel();
      }
    });
  }

  void _addedToCart() async {
    await context.router.pop();
    showDialog(
        context: context,
        builder: (context) {
          _timer = Timer(Duration(seconds: 2), () {
            context.router.pop();
          });
          return AlertDialog(
            contentPadding: EdgeInsets.symmetric(
                vertical: kDefaultPaddingHeightScreen,
                horizontal: kDefaultPaddingWidthScreen),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.done,
                  color: Colors.green,
                ),
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  'Thêm sản phẩm thành công',
                  style: subTitleStyle.copyWith(color: titleColor),
                  textAlign: TextAlign.center,
                )
              ],
            ),
          );
        }).then((val) {
      if (_timer.isActive) {
        _timer.cancel();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        unfocus(context);
      },
      child: Scaffold(
        body: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => ProductDetailCubit(
                  customerRepository: getIt.get<CustomerRepository>(),
                  id: widget.id)
                ..getProductDetail(widget.id),
            ),
            BlocProvider(
                create: (context) =>
                    VariantCubit(getIt.get<CustomerRepository>())),
            BlocProvider(
                create: (context) => HomeCubit(
                    getIt.get<CustomerRepository>(), getIt.get<AppCubit>())),
          ],
          child: BlocConsumer<ProductDetailCubit, ProductDetailState>(
              builder: (context, productState) {
                if (productState.isAddingtoCart) {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    _addingToCart();
                  });
                }
                if (productState.isLoading) {
                  return const ProductDetailShimmerWidget();
                }
                if (productState.addedToCart) {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    _addedToCart();
                    context.read<ProductDetailCubit>().updateAddedToCart();
                  });
                }
                if (productState.error != null) {
                  return SafeArea(
                    child: Container(
                      child: Text("Errol!"),
                    ),
                  );
                }
                print(productState.error);
                return BlocBuilder<AppCubit, AppState>(
                  builder: (context, appState) {
                    return SafeArea(
                      bottom: false,
                      minimum: EdgeInsets.only(bottom: 8.h),
                      child: Column(
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                Header(
                                  isBack: true,
                                  title: productState.detailProduct?.name,
                                  trailing: Row(children: [
                                    const Icon(
                                      Icons.share_outlined,
                                    ),
                                    SizedBox(
                                      width: 15.w,
                                    ),
                                    const Icon(Ionicons.heart_outline),
                                    SizedBox(
                                      width: 15.w,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    MultiBlocProvider(
                                                      providers: [
                                                        BlocProvider(
                                                          create: (context) =>
                                                              CartCubit(getIt.get<
                                                                  CustomerRepository>()),
                                                        ),
                                                        BlocProvider(
                                                          create: (context) =>
                                                              SelectCartCubit(),
                                                        ),
                                                        BlocProvider(
                                                            create: (context) =>
                                                                PaymentCubit(
                                                                    getIt.get<
                                                                        CustomerRepository>()))
                                                      ],
                                                      child: CartScreen(),
                                                    )));
                                      },
                                      child: Container(
                                        margin: EdgeInsets.only(
                                            right: kDefaultPaddingWidthScreen),
                                        child: appState.userSession != null
                                            ? badges.Badge(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 2.w,
                                                    vertical: 1.h),
                                                shape: badges.BadgeShape.square,
                                                borderRadius:
                                                    BorderRadius.circular(10.r),
                                                badgeContent: Text(
                                                    appState.totalCart
                                                        .toString(),
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 9.sp)),
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
                                  ]),
                                ),
                                Expanded(
                                    child: SingleChildScrollView(
                                        child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    MainInforWidget(
                                      productDetail:
                                          productState.detailProduct!,
                                    ),
                                    const DividerWidget(),
                                    AttributeWidget(
                                      productDetail:
                                          productState.detailProduct!,
                                    ),
                                    const DividerWidget(),
                                    VendorProductWidget(
                                      vendor:
                                          productState.detailProduct!.vendor,
                                    ),
                                    // const DividerWidget(),
                                    // const DealWidget(),
                                    const DividerWidget(),
                                    const WarrantyWidget(),
                                    const DividerWidget(),
                                    ProductDescWidget(
                                      desc: productState
                                          .detailProduct!.description,
                                    ),
                                    const DividerWidget(),
                                    ReviewWidget(
                                      reviews:
                                          productState.detailProduct!.reviews!,
                                    ),
                                    const DividerWidget(),
                                    // const CheckWidget(),
                                    // const DividerWidget(),
                                    RelatedProductWidget(
                                      relatedProducts:
                                          productState.relatedProducts!,
                                    ),
                                  ],
                                )))
                              ],
                            ),
                          ),
                          BlocBuilder<VariantCubit, VariantState>(
                            builder: (context, variantState) {
                              return BaseBottom(
                                enableRightButton: productState
                                        .detailProduct!.variants!.isNotEmpty
                                    ? variantState.enableAdd
                                    : true,
                                enableLeftButton: productState
                                        .detailProduct!.variants!.isNotEmpty
                                    ? variantState.enableAdd
                                    : true,
                                onPressLeft: () {
                                  productState
                                          .detailProduct!.variants!.isNotEmpty
                                      ? variantState.enableAdd
                                          ? context
                                              .read<ProductDetailCubit>()
                                              .addToCart(AddToCartRequest(
                                                  vendor: productState
                                                      .detailProduct!.vendor.id,
                                                  productId: productState
                                                      .detailProduct!.id,
                                                  selectedVariant: variantState
                                                      .selectedVariant,
                                                  amount:
                                                      variantState.amount ?? 1,
                                                  selectedAttribute:
                                                      variantState
                                                          .selectedAttribute))
                                          : _alerDialog()
                                      : context
                                          .read<ProductDetailCubit>()
                                          .addToCart(AddToCartRequest(
                                              vendor: productState
                                                  .detailProduct!.vendor.id,
                                              productId: productState
                                                  .detailProduct!.id,
                                              selectedVariant:
                                                  variantState.selectedVariant,
                                              amount: variantState.amount ?? 1,
                                              selectedAttribute: variantState
                                                  .selectedAttribute));
                                  context
                                      .read<VariantCubit>()
                                      .selectVariant(enableAdd: false);
                                  context.read<HomeCubit>().getProduct(false);
                                },
                                onPressRight: () {
                                  final List<String> cartItemIds = [];
                                  cartItemIds.add(productState.id!);
                                  productState
                                          .detailProduct!.variants!.isNotEmpty
                                      ? variantState.enableAdd
                                          ? context.router.push(PaymentPage(
                                              cartItemIds: cartItemIds,
                                              isBuyNow: true,
                                              addToCartRequest: AddToCartRequest(
                                                  vendor: productState
                                                      .detailProduct!.vendor.id,
                                                  productId: productState
                                                      .detailProduct!.id,
                                                  selectedVariant: variantState
                                                      .selectedVariant,
                                                  amount:
                                                      variantState.amount ?? 1,
                                                  selectedAttribute: variantState
                                                      .selectedAttribute)))
                                          : _alerDialog()
                                      : context.router.push(PaymentPage(
                                          cartItemIds: cartItemIds,
                                          isBuyNow: true,
                                          addToCartRequest: AddToCartRequest(
                                              vendor: productState
                                                  .detailProduct!.vendor.id,
                                              productId: productState.detailProduct!.id,
                                              selectedVariant: variantState.selectedVariant,
                                              amount: variantState.amount ?? 1,
                                              selectedAttribute: variantState.selectedAttribute)));
                                },
                                rightButton: LocaleKeys.buy_now.tr(),
                                leftButton: LocaleKeys.add_to_cart.tr(),
                              );
                            },
                          )
                        ],
                      ),
                    );
                  },
                );
              },
              listener: (context, state) {}),
        ),
      ),
    );
  }
}
