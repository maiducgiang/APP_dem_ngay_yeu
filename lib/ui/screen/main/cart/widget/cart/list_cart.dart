import 'package:flutter/material.dart';
import 'package:mubaha/data/model/cart/cart_model.dart';
import 'package:mubaha/ui/screen/main/cart/widget/cart/cart.dart';
import 'package:mubaha/ui/shared/widget/divider/divider_widget.dart';
class ListCart extends StatefulWidget {
  const ListCart({Key? key, required this.cartGroup}) : super(key: key);
  final List<CartGrouped> cartGroup;
  @override
  State<ListCart> createState() => _ListCartState();
}

class _ListCartState extends State<ListCart> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.zero,
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: widget.cartGroup.length,
        itemBuilder: (ctx, index) {
          final CartGrouped item = widget.cartGroup[index];
          return Column(
            children: [
              Cart(
                item: item,
              ),
              index == widget.cartGroup.length - 1 ? Container() : DividerWidget()
            ],
          );
        },
      ),
    );
  }
}
//
// class ListCart extends StatelessWidget {
//   const ListCart({Key? key, required this.cartGroup}) : super(key: key);
//   final List<CartGrouped> cartGroup;
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.zero,
//       child: ListView.builder(
//         shrinkWrap: true,
//         physics: const NeverScrollableScrollPhysics(),
//         itemCount: cartGroup.length,
//         itemBuilder: (ctx, index) {
//           final CartGrouped item = cartGroup[index];
//           return Column(
//             children: [
//               Cart(
//                 item: item,
//               ),
//               index == cartGroup.length - 1 ? Container() : DividerWidget()
//             ],
//           );
//         },
//       ),
//     );
//   }
// }
