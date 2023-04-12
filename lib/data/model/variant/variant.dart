import 'package:easy_localization/easy_localization.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:mubaha/data/model/product/product2.dart';

part 'variant.g.dart';

@JsonSerializable()
class Variant {
  @JsonKey(name: '_id')
  final String id;
  final String name;
  final int price;
  final String? imageId;
  final List<AttributesModel> attributes;
  final String image;
  final double discount;
  final StockModel2? stock;

  Variant(
      {required this.id,
      required this.name,
      required this.price,
      this.imageId,
      required this.attributes,
      required this.image,
      required this.discount,
      this.stock});

  // Color? get colorFinal {
  //   return HexColor.fromHex(colorName);
  // }
  String? get getPriceVariant {
    final currencyFormatter = NumberFormat('₫#,##0', 'ID');

    return currencyFormatter.format(price);
  }

  String? get getCurrentPriceVariant {
    final currencyFormatter = NumberFormat('₫#,##0', 'ID');
    if (discount == 0) return currencyFormatter.format(price);
    return currencyFormatter.format(price * (1 - discount));
  }

  factory Variant.fromJson(Map<String, dynamic> json) =>
      _$VariantFromJson(json);

  Map<String, dynamic> toJson() => _$VariantToJson(this);
}

@JsonSerializable()
class AttributesModel {
  @JsonKey(name: '_id')
  final String id;
  final String name;
  // final String sku;
  final int price;
  final double discount;
  final Stock stock;
  AttributesModel(
      {required this.id,
      required this.name,
      // required this.sku,
      required this.price,
      required this.discount,
      required this.stock});

  String? get getPriceVariant {
    final currencyFormatter = NumberFormat('₫#,##0', 'ID');

    return currencyFormatter.format(price);
  }

  String? get getCurrentPriceVariant {
    final currencyFormatter = NumberFormat('₫#,##0', 'ID');
    if (discount == 0) return currencyFormatter.format(price);
    return currencyFormatter.format(price * (1 - discount));
  }

  factory AttributesModel.fromJson(Map<String, dynamic> json) =>
      _$AttributesModelFromJson(json);

  Map<String, dynamic> toJson() => _$AttributesModelToJson(this);
}

@JsonSerializable()
class Stock {
  final int quantity;
  final String status;
  Stock({required this.quantity, required this.status});
  factory Stock.fromJson(Map<String, dynamic> json) => _$StockFromJson(json);
  Map<String, dynamic> toJson() => _$StockToJson(this);
}
