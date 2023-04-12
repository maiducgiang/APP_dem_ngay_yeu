// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:auto_route/auto_route.dart';
// import 'package:flutter_vector_icons/flutter_vector_icons.dart';
// import 'package:mubaha/core/constant/constant.dart';
// import 'package:mubaha/core/theme/theme.dart';

// class BaseScreen extends StatelessWidget {
//   const BaseScreen(
//       {Key? key,
//       this.title,
//       this.leading,
//       this.trailing,
//       required this.child,
//       this.elevation = 0.0,
//       this.onPress,
//       this.isBack = true,
//       this.isBackPress,
//       this.titleWidget})
//       : super(key: key);
//   final String? title;
//   final List<Widget>? trailing;
//   final Widget? leading;
//   final Widget child;
//   final double? elevation;
//   final Function()? onPress;
//   final Widget? titleWidget;
//   final bool? isBack;
//   final Function()? isBackPress;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         key: key,
//         appBar: AppBar(
//           actions: trailing,
//           backgroundColor: Colors.white,
//           leadingWidth: 300,
//           leading: Expanded(
//             child: Row(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 // SizedBox(
//                 //   width: kDefaultPaddingScreen.w,
//                 // ),
//                 Visibility(
//                     visible: isBack == true,
//                     child: Container(
//                       margin: EdgeInsets.only(bottom: 5.h),
//                       child: GestureDetector(
//                           onTap: isBackPress ??
//                               () {
//                                 context.router.pop();
//                               },
//                           child: const Icon(
//                             Ionicons.chevron_back_outline,
//                             size: 23,
//                             color: Colors.black,
//                           )),
//                     )),
//                 Text("!@3jkasdhkasjdhaksj" ?? "", style: headerTitleStyle),
//                 leading ?? Container()
//               ],
//             ),
//           ),
//           elevation: elevation,
//         ),
//         body: SafeArea(
//           child: GestureDetector(
//             child: child,
//             onTap: () {
//               FocusScopeNode currentFocus = FocusScope.of(context);
//               if (!currentFocus.hasPrimaryFocus) {
//                 currentFocus.unfocus();
//               }
//             },
//           ),
//         ));
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mubaha/ui/theme/text_style.dart';

class BaseScreen extends StatelessWidget {
  const BaseScreen(
      {Key? key,
      this.title,
      this.leading,
      this.trailing,
      required this.child,
      this.elevation = 0.0,
      this.onPress,
      this.titleWidget,
      this.isCenter = false,
      this.isLeading = true})
      : super(key: key);
  final String? title;
  final List<Widget>? trailing;
  final Widget? leading;
  final Widget child;
  final double? elevation;
  final Function()? onPress;
  final Widget? titleWidget;
  final bool? isCenter;
  final bool? isLeading;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: key,
        appBar: title != null
            ? AppBar(
                automaticallyImplyLeading: false,
                backgroundColor: Colors.white,
                actions: trailing,
                leading: isLeading!
                    ? InkWell(
                        onTap: () => Navigator.pop(context),
                        child: const Icon(
                          Icons.arrow_back,
                          color: Colors.black,
                        ),
                      )
                    : null,
                elevation: elevation,
                centerTitle: isCenter,
                title: Text(title!, style: AppTextStyle().textHeading))
            : null,
        body: SafeArea(
          bottom: false,
          minimum: EdgeInsets.only(bottom: 8.h),
          child: GestureDetector(
            child: child,
            onTap: () {
              FocusScopeNode currentFocus = FocusScope.of(context);
              if (!currentFocus.hasPrimaryFocus) {
                currentFocus.unfocus();
              }
            },
          ),
        ));
  }
}
