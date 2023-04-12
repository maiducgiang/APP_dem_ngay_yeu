import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mubaha/data/model/favorite/favorite_response.dart';
import 'package:mubaha/data/repository/customer/customer_repository.dart';
import 'package:mubaha/ui/screen/main/favorite/cubit/favorite_state.dart';

const favoritePageAssets = "assets/data/favorite.json";

class FavoriteCubit extends Cubit<FavoriteState> {
  final CustomerRepository _apiClient;
  FavoriteCubit(this._apiClient) : super(FavoriteState.initial());

  Future<void> getDataFavoriteScreen() async {
    emit(state.copyWith(isLoading: true));
    final json = await rootBundle.loadString(favoritePageAssets);
    final res = await jsonDecode(json);
    final favoriteResponse =
        FavoritePageResponse.fromJson(res as Map<String, dynamic>);

    if (favoriteResponse.status == 200) {
      final data = favoriteResponse.data;
      final listFavorite = data;

      emit(state.copyWith(
        isLoading: false,
        listFavorite: listFavorite,
      ));
    }
    try {} on DioError catch (e) {
      final errorMessage = _apiClient.mapDioErrorToMessage(e);
      emit(state.copyWith(isLoading: false, error: errorMessage));
    }
  }
}
