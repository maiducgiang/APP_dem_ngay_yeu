import 'package:dio/dio.dart';
import 'package:mubaha/data/model/no_data/no_data_response.dart';
import 'package:mubaha/data/model/user/get_user_response.dart';
import 'package:retrofit/http.dart';
import 'auth_endpoint.dart' as endpoint;

part 'auth_repository.g.dart';

@RestApi()
abstract class AuthRepository {
  factory AuthRepository(
    Dio dio, {
    String baseUrl,
  }) = _AuthRepository;

  @GET(endpoint.getUser)
  Future<GetUserResponse> getUserInfo();
}

extension ApiClientHandleError on AuthRepository {
  String mapDioErrorToMessage(DioError error) {
    switch (error.type) {
      case DioErrorType.connectTimeout:
      case DioErrorType.sendTimeout:
      case DioErrorType.receiveTimeout:
        return 'Connection timeout';
      case DioErrorType.response:
        // Parsing error response to string error
        if (error.response != null) {
          final res = error.response;
          if (res?.data != null) {
            try {
              final response = NoDataResponse.fromJson(res?.data);
              return response.message;
            } catch (e) {
              return 'Common error (${res?.statusCode ?? ''})';
            }
          }
          return 'Common error (${res?.statusCode ?? ''})';
        }
        return 'Common error (${error.toString()})';
      case DioErrorType.cancel:
        return 'Request was cancelled unexpectedly';
      case DioErrorType.other:
        return error.message;
    }
  }
}
