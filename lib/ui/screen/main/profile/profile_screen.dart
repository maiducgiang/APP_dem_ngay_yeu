import 'package:auto_route/src/router/auto_router_x.dart';
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:mubaha/data/repository/customer/customer_repository.dart';
import 'package:mubaha/injection.dart';
import 'package:mubaha/translations/locale_keys.g.dart';
import 'package:mubaha/ui/app_cubit.dart';
import 'package:mubaha/ui/app_state.dart';
import 'package:mubaha/ui/router/router.gr.dart';
import 'package:mubaha/ui/screen/auth/siginin/cubit/signin_cubit.dart';
import 'package:mubaha/ui/screen/auth/siginin/cubit/signin_state.dart';
import 'package:mubaha/ui/shared/loading_screen.dart';
import 'package:mubaha/ui/shared/widget/button/primary_button.dart';
import 'package:mubaha/ui/shared/widget/divider/divider_widget.dart';
import 'package:mubaha/ui/shared/widget/header/header.dart';
import 'package:mubaha/ui/theme/constant.dart';
import 'package:mubaha/ui/theme/theme.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) => SigninCubit(
                  getIt.get<CustomerRepository>(), getIt.get<AppCubit>())),
        ],
        child: BlocConsumer<SigninCubit, SigninState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            if (state.isLoading) return LoadingScreen();
            return BlocBuilder<AppCubit, AppState>(
              builder: (context, appState) {
                final user = appState.userSession != null
                    ? appState.userSession!.user
                    : null;
                return SafeArea(
                  child: Column(
                    children: [
                      Header(
                        title: LocaleKeys.my_profile.tr(),
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Container(
                                  padding: EdgeInsets.symmetric(
                                    vertical: 20.h,
                                  ),
                                  color: secondaryColor25,
                                  child: appState.userSession != null
                                      ? Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Container(
                                              height: 82.h,
                                              width: 82.h,
                                              margin: EdgeInsets.symmetric(
                                                  horizontal: 16.h),
                                              child: CircleAvatar(
                                                backgroundColor: Colors.white,
                                                child: ClipOval(
                                                  child: Image.network(
                                                    user!.profile.avatar,
                                                    fit: BoxFit.fill,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  user.profile.fullName,
                                                  style: headingStyle,
                                                ),
                                                SizedBox(
                                                  height: 2.h,
                                                ),
                                                Text(
                                                  user.phone,
                                                  style: subTitleStyle,
                                                ),
                                                SizedBox(
                                                  height: 9.h,
                                                ),
                                                // GestureDetector(
                                                //     onTap: () => context.router
                                                //         .push(
                                                //             FillProfilePage()),
                                                //     child: Container(
                                                //       height: 21.h,
                                                //       width: 52.w,
                                                //       decoration: BoxDecoration(
                                                //           color: primaryColor,
                                                //           borderRadius:
                                                //               BorderRadius
                                                //                   .circular(2)),
                                                //       child: Center(
                                                //           child: Text(
                                                //         'Fix',
                                                //         style: buttonTitleStyle
                                                //             .copyWith(
                                                //                 color: Colors
                                                //                     .white),
                                                //       )),
                                                //     )),
                                              ],
                                            ),
                                          ],
                                        )
                                      : Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal:
                                                  kDefaultPaddingWidthWidget),
                                          child: Row(
                                            children: [
                                              Expanded(
                                                child: PrimaryButton.noBorder(
                                                    onPressed: () {
                                                      context.router
                                                          .push(SiginPage());
                                                    },
                                                    label: 'Đăng nhập',
                                                    paddingHeight: 8.h,
                                                    backgroundColor:
                                                        primaryColor,
                                                    style: const TextStyle(
                                                        color: Colors.white)),
                                              ),
                                              SizedBox(
                                                width:
                                                    kDefaultPaddingWidthScreen,
                                              ),
                                              Expanded(
                                                child: PrimaryButton.outline(
                                                    borderColor: primaryColor,
                                                    onPressed: () {
                                                      context.router
                                                          .push(SignupPage());
                                                    },
                                                    label: 'Đăng ký',
                                                    paddingHeight: 8.h,
                                                    style: const TextStyle(
                                                        color: primaryColor)),
                                              ),
                                            ],
                                          ),
                                        )),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 24.w),
                                child: Column(
                                  children: [
                                    ItemProfile(
                                      onPress: () => context.router
                                          .push(const StatusOrderPage()),
                                      title: 'Trạng thái đơn hàng',
                                      subtitle: 'Những đơn hàng đã đặt',
                                      icon: MdiIcons.viewList,
                                    ),
                                    const ItemProfile(
                                      icon: MdiIcons.heart,
                                      title: 'Yêu thích',
                                      subtitle: 'Những sản phẩm yêu thích',
                                    ),
                                    ItemProfile(
                                        // onPress: () => context.router
                                        //     .push(PaymentPage(cartItemIds: [])),
                                        icon: MdiIcons.wallet,
                                        title: 'Tài khoản/thẻ ngân hàng',
                                        subtitle: 'Thẻ, ví đã lưu'),
                                    ItemProfile(
                                        // onPress: () =>
                                        //     context.router.push(AddressPage()),
                                        icon: Icons.location_on,
                                        title: 'Địa chỉ',
                                        subtitle: 'Nhà riêng, công ty...'),
                                    const ItemProfile(
                                        icon: MdiIcons.flag,
                                        title: 'Ngôn ngữ',
                                        subtitle: 'Chọn ngôn ngữ'),
                                    ItemProfile(
                                        onPress: () =>
                                            context.router.push(NotiPage()),
                                        icon: Icons.notifications,
                                        title: 'Thông báo',
                                        subtitle: 'Thông báo đơn hàng'),
                                    ItemProfile(
                                        onPress: () =>
                                            context.router.push(AboutPage()),
                                        icon: Icons.settings,
                                        title: 'Cài đặt',
                                        subtitle:
                                            'Cài đặt ứng dụng, giao diện'),
                                    const ItemProfile(
                                        icon: MdiIcons.key,
                                        title: 'Cài đặt thông tin',
                                        subtitle: 'Họ tên, mật khẩu...'),
                                  ],
                                ),
                              ),
                              const DividerWidget(),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 24.w),
                                child: Column(
                                  children: [
                                    ItemProfile(
                                      icon: MdiIcons.information,
                                      title: 'Điều khoản của mUBAHA',
                                      subtitle: 'Điều kiện sử dụng',
                                      onPress: () =>
                                          context.router.push(RulePage()),
                                    ),
                                    ItemProfile(
                                      icon: Icons.phone,
                                      title: 'Trung tâm hỗ trợ',
                                      subtitle: 'Hỗ trọ khách hàng',
                                      isBottomLine: false,
                                      onPress: () =>
                                          context.router.push(HelpPage()),
                                    ),
                                    Visibility(
                                      visible: appState.userSession != null,
                                      child: Container(
                                        margin: EdgeInsets.symmetric(
                                            vertical: 15.h),
                                        child: PrimaryButton(
                                          onPressed: () {
                                            context
                                                .read<SigninCubit>()
                                                .logout();
                                          },
                                          label: 'Đăng xuất',
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}

class ItemProfile extends StatelessWidget {
  final bool? isBottomLine;
  final String title;
  final String subtitle;
  final IconData icon;
  final Function()? onPress;
  const ItemProfile(
      {Key? key,
      this.isBottomLine = true,
      required this.title,
      required this.subtitle,
      required this.icon,
      this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        height: 66.h,
        decoration: BoxDecoration(
            border: Border(
                bottom: isBottomLine!
                    ? BorderSide(color: secondaryColor60, width: 1)
                    : const BorderSide(color: Colors.transparent))),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: Colors.black54,
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 14.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: titleStyle,
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Text(
                      subtitle,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: subTitleStyle,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
