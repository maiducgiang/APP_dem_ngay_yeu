import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mubaha/data/enums/enum_stock_country.dart';
import 'package:mubaha/data/model/product/product2.dart';
import 'package:mubaha/data/model/products_list/get_filter_options_response.dart';

part 'products_list_state.freezed.dart';

@freezed
class ProductsListState with _$ProductsListState {
  const factory ProductsListState(
      {required bool isLoading,
      required bool isLoadingFilterOptions,
      required List<Product2> listProducts,
      required int limit,
      required int page,
      required double priceMin,
      required double priceMax,
      required String location,
      required String brands,
      required String text,
      required String cat,
      required int rating,
      required int totalDocs,
      required List<StockCountryModel> stockCountriesOptions,
      required List<FilterBrandsModel> listBrandsOptions,
      required List<CategoryModel> categoriesOptions,
      required List<PriceRangeModel> priceRangeOptions,
      required List<StarModel> starsOptions,
      required List<StockCountryModel> selectedStockCountry,
      required List<FilterBrandsModel> selectedBrand,
      required CategoryModel? selectedCategory,
      required PriceRangeModel selectedPriceRange,
      required StarModel selectedStar,
      required bool isFirstGetFilterOptions,
      String? error}) = _ProductsListState;

  factory ProductsListState.initial() => ProductsListState(
      isLoading: false,
      isLoadingFilterOptions: false,
      listProducts: [],
      limit: 30,
      page: 1,
      priceMin: 0,
      priceMax: 0,
      location: StockCountryType.vn.getType(),
      brands: "",
      text: "",
      cat: "",
      rating: 0,
      totalDocs: 0,
      stockCountriesOptions: [],
      listBrandsOptions: [],
      categoriesOptions: [],
      priceRangeOptions: [],
      starsOptions: [],
      selectedBrand: [],
      selectedStockCountry: [],
      isFirstGetFilterOptions: false,
      selectedStar: StarModel(rating: "1", title: ""),
      selectedPriceRange: PriceRangeModel(min: "0", max: "0", title: ""),
      selectedCategory:
          CategoryModel(category: CategoryItemModel(id: "", name: "")));
}
