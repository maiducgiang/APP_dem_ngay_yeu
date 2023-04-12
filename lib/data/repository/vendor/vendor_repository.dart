import 'package:dio/dio.dart';
import 'package:mubaha/data/model/user/get_user_response.dart';
import 'package:retrofit/http.dart';
import 'endpoint.dart' as endpoint;

part 'vendor_repository.g.dart';

@RestApi()
abstract class VendorRepository {
  factory VendorRepository(
    Dio dio, {
    String baseUrl,
  }) = _VendorRepository;

  @GET(endpoint.getUser)
  Future<GetUserResponse> getUserInfo();
}
