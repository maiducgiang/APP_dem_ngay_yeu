import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mubaha/data/model/brand/brand.dart';
import 'package:mubaha/data/model/category/category.dart';
import 'package:mubaha/data/model/product/product2.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState(
      {required bool isLoading,
      required List<CategoryHomepage> listCategory,
      required List<Product2> listDealsOfTheDay,
      required List<Product2> listStylesOfMe,
      required List<Product2> listProductsByCat,
      required List<Product2> listFlashSales,
      required List<Brand> brand,
      String? error,
      required int yourStyleCategoryIndex}) = _HomeState;

  factory HomeState.initial() => const HomeState(
      isLoading: false,
      listCategory: [],
      listDealsOfTheDay: [],
      listStylesOfMe: [],
      listProductsByCat: [],
      listFlashSales: [],
      yourStyleCategoryIndex: 0,
      brand: []);
}
