import 'package:dio/dio.dart';
import 'package:mubaha/ui/app_cubit.dart';
import 'package:mubaha/ui/services/account_services.dart';

class AuthInterceptor extends Interceptor {
  // Don't need stream subscription cause everytime we request, we get token
  // from cubit state and apply it to the request's header
  final AppCubit _appCubit;

  AuthInterceptor(this._appCubit);

  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    //  AppLog.info('---> ${request.method} ${request.url}');
    final userToken = await AccountServices().getUserToken();
    // final token =
    //     'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjYyMzgyMTIwY2UwYTA1MTZkYTU2MTgwZiIsImlhdCI6MTY0Nzk0NTE0MiwiZXhwIjoxNjc5NDgxMTQyfQ.7IKihEalpp4uu9HV87C-5Md09vqXL6Vl6DzJxzayY5s';
    options.headers['X-Requested-With'] = 'XMLHttpRequest';
    options.headers['Authorization'] = 'Bearer $userToken';
    super.onRequest(options, handler);
  }

  // @override
  // Future<RequestOptions> onRequest(RequestOptions options) async {
  //   final authData = globals.authData;
  //
  //   if (authData?.accessToken != null) {
  //     options.headers['Authorization'] = 'Bearer ${authData.accessToken}';
  //   }
  //
  //   return options;
  // }
}
