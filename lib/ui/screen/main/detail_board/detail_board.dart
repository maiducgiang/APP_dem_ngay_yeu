import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mubaha/data/model/board_local/board_model.dart';
import 'package:mubaha/ui/router/router.gr.dart';
import 'package:mubaha/ui/screen/main/detail_board/cubit/detail_board_cubit.dart';
import 'package:mubaha/ui/screen/main/detail_board/cubit/detail_board_state.dart';
import 'package:mubaha/ui/shared/loading_screen.dart';
import 'package:mubaha/ui/theme/constant.dart';
import 'package:mubaha/ui/theme/theme.dart';
import 'package:mubaha/ui/shared/extension/format_date.dart';

class DetailBoardScreen extends StatefulWidget {
  const DetailBoardScreen({Key? key, required this.boardModelLocal})
      : super(key: key);
  final BoardModelLocal boardModelLocal;
  @override
  State<DetailBoardScreen> createState() => _DetailBoardScreenState();
}

class _DetailBoardScreenState extends State<DetailBoardScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DetailBoardCubit()..init(widget.boardModelLocal),
      child: BlocConsumer<DetailBoardCubit, DetailBoardState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          if (state.boardModelLocal == null) {
            return const LoadingScreen();
          }
          return Scaffold(
            appBar: _appBar(context, state),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                context.router
                    .push(EditBoardPage(boardModelLocal: state.boardModelLocal))
                    .then((value) {
                  context
                      .read<DetailBoardCubit>()
                      .getBoardCached(widget.boardModelLocal.id!);
                });
              },
              backgroundColor: primaryColor,
              elevation: 0,
              child: SvgPicture.asset(
                "assets/images/icons/edit.svg",
                color: Colors.white,
                width: 18.sp,
              ),
            ),
            body: SafeArea(
                child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        FormatTime(state.boardModelLocal!.time).format(),
                        style: subTitleStyle.copyWith(
                            fontSize: 13.sp, color: greyPrymaryColor),
                      ),
                      Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.symmetric(horizontal: 3.w),
                        child: SvgPicture.asset(
                          "assets/images/icons/ellipse.svg",
                          color: greyPrymaryColor,
                          width: 3.sp,
                        ),
                      ),
                      Text(
                        FormatDayShip(state.boardModelLocal!.time).format3(),
                        style: subTitleStyle.copyWith(
                            fontSize: 13.sp, color: greyPrymaryColor),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  Container(
                    //margin: EdgeInsets.symmetric(vertical: 12.h),
                    child: Text(
                      state.boardModelLocal!.title,
                      style: titleStyle.copyWith(
                          height: 1.3.h,
                          wordSpacing: 0.5.w,
                          letterSpacing: 0.5.w,
                          fontSize: 15.sp,
                          color: Color(0xff1C2433)),
                    ),
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  state.boardModelLocal!.listImage != null &&
                          state.boardModelLocal!.listImage!.isNotEmpty
                      ? Container(
                          height: 90.h,
                          margin: EdgeInsets.symmetric(vertical: 14.h),
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount:
                                  state.boardModelLocal!.listImage?.length,
                              itemBuilder: (context, index) {
                                return Container(
                                  width: 90.h,
                                  margin: EdgeInsets.only(right: 10.w),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10.0),
                                    child: Image.memory(
                                      state.boardModelLocal!.listImage![index],
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                );
                              }),
                        )
                      : Container(
                          height: 20.h,
                        ),
                ],
              ),
            )),
          );
        },
      ),
    );
  }

  AppBar _appBar(BuildContext context, DetailBoardState state) {
    return AppBar(
      automaticallyImplyLeading: false,
      centerTitle: true,
      backgroundColor: Colors.white,
      elevation: 0,
      actions: [
        Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(
            horizontal: 15.w,
          ),
          margin: EdgeInsets.symmetric(vertical: 8.h, horizontal: 12.w),
          child: GestureDetector(
            onTap: () {
              context.read<DetailBoardCubit>().deleteBoard();
              context.router.pop();
            },
            child: SvgPicture.asset(
              "assets/images/icons/delete.svg",
              color: greyPrymaryColor,
              width: 18.sp,
            ),
          ),
        )
      ],
      leading: GestureDetector(
        onTap: () => Navigator.pop(context),
        child: const Icon(
          Icons.arrow_back_ios_new_rounded,
          color: Colors.black,
        ),
      ),
      title: Text(
        FormatDayShip(state.boardModelLocal!.time).format2(),
        style: titleStyle.copyWith(
          fontSize: 15.sp,
        ),
      ),
    );
  }
}
