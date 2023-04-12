import 'package:easy_localization/easy_localization.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:mubaha/data/enums/enum_currency_symbols.dart';
import 'package:mubaha/data/enums/enum_voucher_type.dart';
import 'package:mubaha/ui/shared/extension/format_date.dart';

part 'voucher.g.dart';

@JsonSerializable()
class Voucher {
  final VoucherData? data;
  final int status;
  final String message;
  final String? error;

  Voucher({required this.message, required this.status, this.error, this.data});

  factory Voucher.fromJson(Map<String, dynamic> json) =>
      _$VoucherFromJson(json);

  Map<String, dynamic> toJson() => _$VoucherToJson(this);
}

@JsonSerializable()
class VoucherData {
  final List<VoucherDocs> docs;
  final int totalDocs;
  final int limit;
  final int totalPages;
  final int page;
  final int pagingCounter;
  // final int? nextPage;
  final bool hasPrevPage;
  final bool hasNextPage;
  VoucherData(
      {required this.hasNextPage,
      required this.hasPrevPage,
      required this.limit,
      // this.nextPage,
      required this.page,
      required this.pagingCounter,
      required this.totalDocs,
      required this.totalPages,
      required this.docs});

  factory VoucherData.fromJson(Map<String, dynamic> json) =>
      _$VoucherDataFromJson(json);

  Map<String, dynamic> toJson() => _$VoucherDataToJson(this);
}

@JsonSerializable()
class VoucherDocs {
  final VoucherDiscount discount;
  @JsonKey(name: '_id')
  final String id;
  final String title;
  final double minBasketPrice;
  final int usageLimitQuantity;
  final int totalUsed;
  final int maxVoucherAmount;
  final String? vendor;
  final bool active;
  final String code;
  final DateTime startDate;
  final DateTime endDate;
  final String type;
  @JsonKey(
    name: 'currencySymbol',
    fromJson: stringToCurrencySymbolsType,
    toJson: currencySymbolsTypeToString,
  )
  final CurrencySymbolsType currencySymbol;
  final String status;
  VoucherDocs(
      {required this.active,
      required this.code,
      required this.currencySymbol,
      required this.endDate,
      required this.id,
      required this.maxVoucherAmount,
      required this.minBasketPrice,
      required this.startDate,
      required this.status,
      required this.title,
      required this.totalUsed,
      required this.type,
      required this.usageLimitQuantity,
      this.vendor,
      required this.discount});

  String? get getStartDate {
    return FormatDate(startDate).format();
  }

  String? get getMinBasketPrice {
    final currencyFormatter =
        NumberFormat('${currencySymbol.display()}#,##0', 'ID');
    return currencyFormatter.format(minBasketPrice);
  }

  String? get getPriceDiscount {
    final currencyFormatter =
        NumberFormat('${discount.type.display()}#,##0', 'ID');
    return currencyFormatter.format(discount.amount);
  }

  String? get getMaxVoucherAmount {
    final currencyFormatter =
        NumberFormat('${currencySymbol.display()}#,##0', 'ID');
    return currencyFormatter.format(maxVoucherAmount);
  }

  String? get getPercentDiscount {
    return '${discount.amount}${discount.type.display()}';
  }

  factory VoucherDocs.fromJson(Map<String, dynamic> json) =>
      _$VoucherDocsFromJson(json);

  Map<String, dynamic> toJson() => _$VoucherDocsToJson(this);
}

@JsonSerializable()
class VoucherDiscount {
  final int amount;
  @JsonKey(
      name: 'type', fromJson: stringToVoucherType, toJson: voucherTypeToString)
  final VoucherType type;
  VoucherDiscount({required this.amount, required this.type});

  factory VoucherDiscount.fromJson(Map<String, dynamic> json) =>
      _$VoucherDiscountFromJson(json);

  Map<String, dynamic> toJson() => _$VoucherDiscountToJson(this);
}
