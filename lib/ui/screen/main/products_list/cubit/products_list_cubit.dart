import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mubaha/data/model/products_list/get_filter_options_response.dart';
import 'package:mubaha/data/repository/customer/customer_repository.dart';
import 'package:mubaha/ui/screen/main/products_list/cubit/products_list_state.dart';

class ProductsListCubit extends Cubit<ProductsListState> {
  // final CustomerRepository _apiClient;
  final CustomerRepository _customerRepository;

  ProductsListCubit(this._customerRepository)
      : super(ProductsListState.initial());

  getListProducts() {
    Future.wait([
      getListProduct(
          state.page,
          state.limit,
          state.priceMax.toString(),
          state.priceMax.toString(),
          state.location,
          state.brands,
          state.text,
          state.cat,
          state.rating.toString()),
      getFilterOptions()
    ]);
  }

  Future<void> handleSearchText(String text) async {
    emit(state.copyWith(text: text));
    refreshSearch();
    getListProduct(1, state.limit, "0", "0", "", "", text, "", "");
  }

  void refreshSearch() {
    emit(state.copyWith(
        page: 1,
        priceMax: 0,
        priceMin: 0,
        location: "",
        brands: "",
        cat: "",
        rating: 1));
  }

  Future<void> getListProduct(
      int page,
      int limit,
      String priceMax,
      String priceMin,
      String location,
      String brands,
      String text,
      String cat,
      String rating) async {
    emit(state.copyWith(isLoading: true));
    try {
      final response = await _customerRepository.getProductsList(
          page: page,
          limit: limit,
          priceMax: priceMax,
          priceMin: priceMin,
          location: location,
          brands: brands,
          text: text,
          cat: cat,
          rating: rating);
      if (response.status == 200) {
        final data = response.data;
        final totalDocs = data.totalDocs;

        emit(state.copyWith(
            isLoading: false,
            listProducts: data.docs,
            totalDocs: totalDocs ?? 0));
      }
    } on DioError catch (e) {
      final errorMessage = _customerRepository.mapDioErrorToMessage(e);
      emit(state.copyWith(isLoading: false, error: errorMessage));
    }
  }

  Future<void> getFilterOptions() async {
    emit(state.copyWith(isLoadingFilterOptions: true));
    final List<PriceRangeModel> listPrice = [
      PriceRangeModel(min: "0", max: "100000", title: "0 - 100k"),
      PriceRangeModel(min: "100000", max: "300000", title: "100K - 300k"),
      PriceRangeModel(min: "300000", max: "500000", title: "300k - 500k"),
      PriceRangeModel(min: "500000", max: "500000000", title: "Trên 500k"),
    ];

    final List<StarModel> listStar = [
      StarModel(rating: "5", title: "5 sao"),
      StarModel(rating: "4", title: "Từ 4 sao"),
      StarModel(rating: "3", title: "Từ 3 sao"),
      StarModel(rating: "2", title: "Từ 2 sao"),
      StarModel(rating: "1", title: "Từ 1 sao")
    ];
    try {
      final response = await _customerRepository.getFilterOptions(text: "");
      if (response.status == 200) {
        final data = response.data;

        emit(state.copyWith(
          isLoadingFilterOptions: false,
          stockCountriesOptions: data.stockCountries ?? [],
          listBrandsOptions: data.brands ?? [],
          categoriesOptions: data.categories ?? [],
          priceRangeOptions: listPrice,
          starsOptions: listStar,
        ));
      } else {
        return;
      }
    } on DioError catch (e) {
      final errorMessage = _customerRepository.mapDioErrorToMessage(e);
      emit(state.copyWith(isLoadingFilterOptions: false, error: errorMessage));
    }
  }

  Future<void> handleFilterData(
      PriceRangeModel selectedPriceRange,
      CategoryModel selectedCategory,
      List<FilterBrandsModel> selectedBrands,
      List<StockCountryModel> selectedStockCountry,
      StarModel selectedStart) async {
    final minPrice = selectedPriceRange.min;
    final maxPrice = selectedPriceRange.max;
    final category = selectedCategory.category.id;
    final review = selectedStart.rating;
    var brands = "";
    if (selectedBrands.isNotEmpty) {
      selectedBrands.map((e) {
        if (brands == "") {
          brands = e.brand.id ?? "";
        } else {
          brands = brands + "," + e.brand.id!;
        }
      }).toList();
    }

    var stockCountries = "";

    if (selectedStockCountry.isNotEmpty) {
      selectedStockCountry.map((e) {
        if (stockCountries == "") {
          stockCountries = e.country;
        } else {
          stockCountries = stockCountries + "," + e.country;
        }
      }).toList();
    }
    emit(state.copyWith(
        selectedPriceRange: selectedPriceRange,
        selectedCategory: selectedCategory,
        selectedBrand: selectedBrands,
        selectedStockCountry: selectedStockCountry,
        selectedStar: selectedStart,
        priceMin: double.parse(minPrice),
        priceMax: double.parse(maxPrice),
        location: stockCountries,
        brands: brands,
        cat: category,
        rating: int.parse(review)));

    getListProduct(state.page, state.limit, maxPrice, minPrice, stockCountries,
        brands, state.text, category, review);
  }
}
