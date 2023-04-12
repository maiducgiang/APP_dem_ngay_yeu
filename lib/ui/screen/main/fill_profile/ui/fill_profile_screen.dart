import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mubaha/ui/screen/main/profile/bloc/date_cubit.dart';
import 'package:mubaha/ui/screen/main/profile/bloc/gender_cubit.dart';
import 'package:mubaha/ui/screen/main/profile/widget/date_picker_widget.dart';
import 'package:mubaha/ui/screen/main/profile/widget/gender_picker_widget.dart';
import 'package:mubaha/ui/shared/utils/functions.dart';
import 'package:mubaha/ui/shared/widget/bottom/base_bottom.dart';
import 'package:mubaha/ui/shared/widget/divider/divider_widget.dart';
import 'package:mubaha/ui/shared/widget/header/header.dart';
import 'package:mubaha/ui/shared/widget/header/heading.dart';
import 'package:mubaha/ui/shared/widget/textfield/primary_textfield.dart';
import 'package:mubaha/ui/theme/constant.dart';
import 'package:shimmer/shimmer.dart';

class FillProfileScreen extends StatelessWidget {
  FillProfileScreen({Key? key}) : super(key: key);
  final TextEditingController _nameControlller = TextEditingController();
  final TextEditingController _surnameControlller = TextEditingController();
  final TextEditingController _phoneControlller = TextEditingController();
  final TextEditingController _passControlller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => GenderCubit(),
        ),
        BlocProvider(
          create: (context) => DateCubit(),
        )
      ],
      child: GestureDetector(
        onTap: () => unfocus(context),
        child: Scaffold(
          body: SafeArea(
            child: Column(
              children: [
                const Header(
                  isBack: true,
                  title: 'Edit profile',
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: Container(
                                  height: 82.h,
                                  width: 82.h,
                                  color: secondaryColor,
                                  child: CachedNetworkImage(
                                    imageUrl:
                                        'http://s3.amazonaws.com/37assets/svn/765-default-avatar.png',
                                    fit: BoxFit.cover,
                                    placeholder: (context, url) =>
                                        Shimmer.fromColors(
                                      baseColor: Colors.grey,
                                      highlightColor: Colors.grey,
                                      child: Container(
                                        height: 82.h,
                                        width: 82.h,
                                        color: secondaryColor,
                                      ),
                                    ),
                                  )),
                            ),
                            Positioned(
                                right: 5,
                                bottom: 0,
                                child: InkWell(
                                  onTap: () {},
                                  child: Container(
                                    height: 22.h,
                                    width: 22.h,
                                    decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.white),
                                    child: Container(
                                      height: 22.h,
                                      width: 22.h,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.white,
                                          border: Border.all(
                                              color: secondaryColor)),
                                      child: Icon(
                                        Icons.edit,
                                        color: primaryColor,
                                        size: 15.sp,
                                      ),
                                    ),
                                  ),
                                ))
                          ],
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: kDefaultPaddingWidthWidget),
                          child: Column(
                            children: [
                              PrimaryTextField(
                                label: 'First name',
                                controller: _nameControlller,
                              ),
                              SizedBox(
                                height: 17.h,
                              ),
                              PrimaryTextField(
                                label: 'Last name',
                                controller: _surnameControlller,
                              ),
                              SizedBox(
                                height: 17.h,
                              ),
                              GenderPickerWidget(
                                male: 'Male',
                                female: 'Female',
                              ),
                              SizedBox(
                                height: 17.h,
                              ),
                              const DatePickerWidget(
                                title: 'Date of birth',
                              ),
                              SizedBox(
                                height: 30.h,
                              ),
                            ],
                          ),
                        ),
                        DividerWidget(),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: kDefaultPaddingWidthWidget),
                          child: Heading(
                            label: 'Re-enter your account',
                            paddingBottom: false,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: kDefaultPaddingWidthWidget),
                          child: Column(
                            children: [
                              SizedBox(
                                height: kDefaultPaddingHeightWidget,
                              ),
                              PrimaryTextField(
                                label: 'Phone number',
                                controller: _phoneControlller,
                              ),
                              SizedBox(
                                height: 17.h,
                              ),
                              PrimaryTextField(
                                label: 'Password',
                                controller: _passControlller,
                                isPass: true,
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                BaseBottom(
                  leftButton: 'Return',
                  rightButton: 'Save',
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
