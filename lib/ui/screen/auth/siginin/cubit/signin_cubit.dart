import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mubaha/data/model/login/login_response.dart';
import 'package:mubaha/data/model/user/user_session.dart';
import 'package:mubaha/data/repository/customer/customer_repository.dart';
import 'package:mubaha/ui/app_cubit.dart';
import 'package:mubaha/ui/screen/auth/siginin/cubit/signin_state.dart';
import 'package:mubaha/ui/services/account_services.dart';

class SigninCubit extends Cubit<SigninState> {
  final CustomerRepository _customerRepository;
  final AppCubit _appCubit;
  SigninCubit(this._customerRepository, this._appCubit)
      : super(SigninState.initial());

  Future<void> login(LoginRequest loginRequest) async {
    emit(state.copyWith(isLoading: true));
    try {
      final response = await _customerRepository.login(loginRequest);
      if (response.status == 200) {
        final userToken = response.data!.token;
        final userId = response.data!.userId;
        final accountInfo = response.data!.account;
        AccountServices().saveUserToken(userToken);
        AccountServices().saveUserId(userId);
        final userSession =
            UserSession(token: userToken, userId: userId, user: accountInfo);
        _appCubit.updateUserSession(userSession);
        emit(state.copyWith(isLoading: false, token: response.data!.token));
      }
    } on DioError catch (e) {
      final errorMessage = _customerRepository.mapDioErrorToMessage(e);
      emit(state.copyWith(isLoading: false, error: errorMessage));
    }
  }

  Future<LoginResponse?> loginOtp(LoginRequest registerRequest) async {
    emit(state.copyWith(isLoading: true));
    try {
      final response = await _customerRepository.loginOtp(registerRequest);
      if (response.status == 200) {
        emit(state.copyWith(isLoading: false));
        return response;
      }
    } on DioError catch (e) {
      final errorMessage = _customerRepository.mapDioErrorToMessage(e);
      emit(state.copyWith(isLoading: false, error: errorMessage));
      return null;
    }
  }

  Future<void> verifyLoginOtp(LoginRequest verifyLoginOtpRequest) async {
    try {
      final response =
          await _customerRepository.verifyLoginOtp(verifyLoginOtpRequest);
      if (response.status == 200) {
        final userToken = response.data!.token;
        final userId = response.data!.userId;
        final accountInfo = response.data!.account;
        AccountServices().saveUserToken(userToken);
        AccountServices().saveUserId(userId);
        final userSession =
            UserSession(token: userToken, userId: userId, user: accountInfo);
        _appCubit.updateUserSession(userSession);
        emit(state.copyWith(isLoading: false, token: response.data!.token));
      }
    } on DioError catch (e) {
      final errorMessage = _customerRepository.mapDioErrorToMessage(e);
      emit(state.copyWith(isLoading: false, error: errorMessage));
    }
  }

  Future<LoginResponse?> register(LoginRequest registerRequest) async {
    emit(state.copyWith(isLoading: true));
    try {
      final response = await _customerRepository.register(registerRequest);
      if (response.status == 200) {
        emit(state.copyWith(isLoading: false));
        return response;
      }
    } on DioError catch (e) {
      final errorMessage = _customerRepository.mapDioErrorToMessage(e);
      emit(state.copyWith(isLoading: false, error: errorMessage));
      return null;
    }
  }

  Future<void> verifyRegisterOtp(LoginRequest verifyRegisterOtpRequest) async {
    try {
      final response =
          await _customerRepository.verifyRegisterOtp(verifyRegisterOtpRequest);
      if (response.status == 200) {
        final userToken = response.data!.token;
        final userId = response.data!.userId;
        final accountInfo = response.data!.account;
        AccountServices().saveUserToken(userToken);
        AccountServices().saveUserId(userId);
        final userSession =
            UserSession(token: userToken, userId: userId, user: accountInfo);
        _appCubit.updateUserSession(userSession);
        emit(state.copyWith(isLoading: false, token: response.data!.token));
      }
    } on DioError catch (e) {
      final errorMessage = _customerRepository.mapDioErrorToMessage(e);
      emit(state.copyWith(isLoading: false, error: errorMessage));
    }
  }

  Future<void> logout() async {
    emit(state.copyWith(isLoading: true));
    try {
      final response = await _customerRepository.logout();
      if (response.status == 200) {
        AccountServices().saveUserToken('');
        AccountServices().saveUserId('');
        final userSession = UserSession(token: '', userId: '');
        _appCubit.updateUserSession(null);
        _appCubit.updateTotalCart(null);
        emit(state.copyWith(isLoading: false, token: ''));
      }
    } on DioError catch (e) {
      final errorMessage = _customerRepository.mapDioErrorToMessage(e);
      emit(state.copyWith(isLoading: false, error: errorMessage));
    }
  }
}
