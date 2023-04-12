import 'package:flutter/material.dart';
import 'package:mubaha/ui/shared/base_screen.dart';
import 'package:mubaha/ui/shared/widget/header/header.dart';

class EmptyCartScreen extends StatelessWidget {
  final bool isBack;
  const EmptyCartScreen({Key? key, this.isBack = true}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      child: Column(
        children: [
          Header(
            title: 'Giỏ hàng',
            isBack: isBack,
          ),
          Expanded(
            child: Container(
              alignment: Alignment.center,
              child: const Text("Chưa có sản phẩm trong giỏ hàng"),
            ),
          ),
        ],
      ),
    );
  }
}
