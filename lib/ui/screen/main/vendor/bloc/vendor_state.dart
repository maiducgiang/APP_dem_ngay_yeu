import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mubaha/data/model/product/product2.dart';
import 'package:mubaha/data/model/vendor/vendor.dart';

part 'vendor_state.freezed.dart';

@freezed
class VendorState with _$VendorState {
  const factory VendorState(
      {required bool isLoading,
      Vendor? vendor,
      required List<Product2> dealsOfTheDay,
      required List<Product2> flashSales,
      required List<Product2> suggestedForYou,
      required String id,
      String? error}) = _VendorState;

  factory VendorState.initial({required String id}) => VendorState(
      isLoading: false,
      id: id,
      dealsOfTheDay: [],
      flashSales: [],
      suggestedForYou: []);
}
