part of 'category_product_list_cubit.dart';


class CategoryProductListState extends Equatable {
  @override
  List<Object> get props => [];
}
class CategoryProductListInitial extends CategoryProductListState {}

class CategoryProductListLoading extends CategoryProductListState {}
class CategoryProductListLoadFailure extends CategoryProductListState {
  final String errol;
  CategoryProductListLoadFailure({required this.errol});
}
class CategoryProductListLoadSuccess extends CategoryProductListState {
  // final bool isLoading;
  // final bool isLoadingFilterOptions;
  // final List<Product2> listProducts;
  // final int limit;
  // final int page;
  // final double priceMin;
  // final double priceMax;
  // final String location;
  // final String brands;
  // final String text;
  // final String cat;
  // final int rating;
  // final int totalDocs;
  // final List<StockCountryModel> stockCountriesOptions;
  // final List<FilterBrandsModel> listBrandsOptions;
  // final List<CategoryModel> categoriesOptions;
  // final List<PriceRangeModel> priceRangeOptions;
  // final List<StarModel> starsOptions;
  // final List<StockCountryModel> selectedStockCountry;
  // final List<FilterBrandsModel> selectedBrand;
  // final CategoryModel? selectedCategory;
  // final PriceRangeModel selectedPriceRange;
  // final StarModel selectedStar;
  // final bool isFirstGetFilterOptions;
  // final String? error;
  final CategoryDetail categoryDetail;
  final List<Product4> products;
  final bool hasPrevPage;
  final bool hasNextPage;
  final int page;
  CategoryProductListLoadSuccess( {
    required this.categoryDetail,
    required this.products,
    required this.hasPrevPage,
    required this.hasNextPage,
    required this.page
  });
  @override
  List<Object> get props => [categoryDetail, products, hasPrevPage, hasNextPage, page ];
}
