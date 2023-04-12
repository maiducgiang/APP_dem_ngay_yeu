import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mubaha/data/model/user/user_session.dart';
import 'package:mubaha/data/repository/customer/customer_repository.dart';
import 'package:mubaha/ui/app_cubit.dart';
import 'package:mubaha/ui/screen/main/home/cubit/home_state.dart';
import 'package:mubaha/ui/services/account_services.dart';

const homePageAssets = "assets/data/homepage.json";

class HomeCubit extends Cubit<HomeState> {
  // final CustomerRepository _apiClient;
  final CustomerRepository _customerRepository;
  final AppCubit _appCubit;

  HomeCubit(this._customerRepository, this._appCubit)
      : super(HomeState.initial());

  Future updateUser(String userToken, String userId) async {
    final getMeResponse = await _customerRepository.getAccountInfo();
    if (getMeResponse.status == 200) {
      final data = getMeResponse.data;
      final userSession =
          UserSession(token: userToken, userId: userId, user: data!.account!);
      _appCubit.updateUserSession(userSession);
    }
  }

  Future getTotalCart() async {
    final getTotalCart = await _customerRepository.getTotalCart();
    if (getTotalCart.status == 200) {
      _appCubit.updateTotalCart(getTotalCart.data!.total);
    }
  }

  Future<void> getProduct(bool isLogin) async {
    emit(state.copyWith(isLoading: true));
    try {
      final userToken = await AccountServices().getUserToken();
      final userId = await AccountServices().getUserId();
      if (userToken != "" && isLogin == false) {
        Future.wait([updateUser(userToken, userId), getTotalCart()]);
      }
      final response = await _customerRepository.getHomepage();
      if (response.status == 200) {
        final data = response.data;
        emit(state.copyWith(
            isLoading: false,
            listCategory: data.categories,
            listDealsOfTheDay: data.dealsOfTheDay,
            listFlashSales: data.flashSales,
            listProductsByCat: data.productsByCat,
            listStylesOfMe: data.stylesOfMe,
            brand: data.brands!));
      }
      print("Home Cubit:"+response.errors.toString());
    } on DioError catch (e) {
      print(e.toString());
      final errorMessage = _customerRepository.mapDioErrorToMessage(e);
      emit(state.copyWith(isLoading: false, error: errorMessage));
    }
  }

  // Future<void> getDataHomeScreen() async {
  //   emit(state.copyWith(isLoading: true));
  //   final json = await rootBundle.loadString(homePageAssets);
  //   final res = await jsonDecode(json);
  //   final homeResponse = HomePageResponse.fromJson(res as Map<String, dynamic>);
  //   if (homeResponse.status == 200) {
  //     final data = homeResponse.data;
  //     final listCategory = data.listCategory;
  //     final listDealsOfDay = data.listDealsOfDay;
  //     final listYourStyle = data.listYourStyle;
  //     final listKidsConner = data.listKidsConner;
  //     final listBrand = data.listBrand;
  //     final listVoucher = data.listVoucher;

  //     emit(state.copyWith(
  //         isLoading: false,
  //         listCategory: listCategory,
  //         listDealsOfDay: listDealsOfDay,
  //         listYourStyle: listYourStyle,
  //         listKidsConner: listKidsConner,
  //         listBrand: listBrand,
  //         listVoucher: listVoucher ?? []));
  //   }
  //   try {} on DioError catch (e) {
  //     final errorMessage = _apiClient.mapDioErrorToMessage(e);
  //     emit(state.copyWith(isLoading: false, error: errorMessage));
  //   }
  // }

  Future<void> updateIndexStyleCategory(int index) async {
    emit(state.copyWith(yourStyleCategoryIndex: index));
  }
}
