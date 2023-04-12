import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mubaha/data/repository/customer/customer_repository.dart';
import 'package:mubaha/ui/screen/main/category/cubit/category_state.dart';

const categoryPageAssets = "assets/data/categories.json";

class CategoryCubit extends Cubit<CategoryState> {
  final CustomerRepository _apiClient;
  CategoryCubit(this._apiClient) : super(CategoryState.initial());

  Future<void> getDataCtegoryScreen() async {
    emit(state.copyWith(isLoading: true));

    try {
      final response = await _apiClient.getCategories();
      if (response.status == 200) {
        emit(state.copyWith(isLoading: false, listCategory: response.data));
      }
    } on DioError catch (e) {
      final errorMessage = _apiClient.mapDioErrorToMessage(e);
      emit(state.copyWith(isLoading: false, error: errorMessage));
    }
  }

  // Future<void> getDataCtegoryScreen() async {
  //   emit(state.copyWith(isLoading: true));
  //   final json = await rootBundle.loadString(categoryPageAssets);
  //   final res = await jsonDecode(json);
  //   final homeResponse =
  //       CategoryPageResponse.fromJson(res as Map<String, dynamic>);
  //   if (homeResponse.status == 200) {
  //     final data = homeResponse.data;
  //     final listCategory = data;

  //     emit(state.copyWith(
  //       isLoading: false,
  //       listCategory: listCategory,
  //     ));
  //   }
  //   try {} on DioError catch (e) {
  //     final errorMessage = _apiClient.mapDioErrorToMessage(e);
  //     emit(state.copyWith(isLoading: false, error: errorMessage));
  //   }
  // }
}
