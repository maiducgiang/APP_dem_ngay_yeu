import 'package:json_annotation/json_annotation.dart';
import 'package:mubaha/data/model/cart/cart_model.dart';

@JsonSerializable()
class GroupVendor {
  final List<GroupVendorItem> groupMap;
  GroupVendor({required this.groupMap});
}

@JsonSerializable()
class GroupVendorItem {
  final String key;
  final List<CartDocs> value;
  bool isSelectAll;
  GroupVendorItem(
      {required this.key, required this.value, this.isSelectAll = false});
}
