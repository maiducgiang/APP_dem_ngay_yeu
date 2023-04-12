import 'package:flutter/material.dart';
import 'package:mubaha/ui/theme/constant.dart';
import 'package:mubaha/ui/theme/theme.dart';

class WarrantyWidget extends StatelessWidget {
  const WarrantyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(kDefaultPaddingWidthWidget),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Chính sách bảo hành và đổi trả',
              style: subHeadingStyle.copyWith(color: titleColor),
            ),
            SizedBox(
              height: kDefaultPaddingHeightWidget,
            ),
            Text(
              'Sản phẩm này đủ điều kiện để trả lại và thay thế kích thước. Vui lòng bắt đầu trả hàng thay thế từ phần \'Đơn hàng của tôi\' của Ứng dụng trong vòng 7 ngày kể từ ngày giao hàng. Vui lòng đảm bảo sản phẩm ở tình trạng ban đầu với tất cả các thẻ được đính kèm',
              style: subHeadingStyle.copyWith(
                  fontWeight: FontWeight.w400,
                  color: contentColor,
                  height: 1.3),
            )
          ],
        ));
  }
}
