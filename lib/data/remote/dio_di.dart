import 'package:dio/dio.dart';
import 'package:mubaha/data/remote/interceptors/auth_interceptors.dart';
import 'package:mubaha/injection.dart';
import 'package:mubaha/ui/app_cubit.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

abstract class DioDi {
  Dio get dio {
    final dio = Dio();
    dio.options.connectTimeout = Duration(seconds: 5);
    dio.options.receiveTimeout = Duration(seconds: 5);
    dio.interceptors.add(AuthInterceptor(getIt.get<AppCubit>()));
    // dio.interceptors.add(AuthInterceptor(getIt.get<AppCubit>()));
    //
    // dio.interceptors.add(MessageErrorInterceptor());
    // dio.interceptors.add(BadNetworkErrorInterceptor());
    // dio.interceptors.add(UnauthorizedErrorInterceptor());
    // dio.interceptors.add(InternalServerErrorInterceptor());
    // dio.interceptors.add(AuthIntercepßtor());
    dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: false,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90));

    return dio;
  }
}
