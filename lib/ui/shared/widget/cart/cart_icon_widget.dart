import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mubaha/icons/my_flutter_app_icons.dart';

class CartIconWidget extends StatelessWidget {
  final VoidCallback onPress;
  const CartIconWidget({Key? key, required this.onPress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        width: 32.w,
        child: Stack(
          children: [
            const Icon(
              MyFlutterApp.cart,
            ),
            Positioned(
                right: 0,
                child: Container(
                  height: 10.h,
                  padding: EdgeInsets.symmetric(horizontal: 2.w),
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(6.r)),
                  child: Center(
                    child: Text(
                      '99+',
                      style: TextStyle(color: Colors.white, fontSize: 8.sp),
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
