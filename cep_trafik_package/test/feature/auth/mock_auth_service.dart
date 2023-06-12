import 'package:cep_trafik_package/core/base/error/dio_exception.dart';
import 'package:cep_trafik_package/core/components/utility/api_response.dart';
import 'package:cep_trafik_package/core/constants/enums/network_route_enum.dart';
import 'package:cep_trafik_package/core/init/network/dio_client.dart';
import 'package:cep_trafik_package/feature/auth/model/auth_request_model.dart';
import 'package:cep_trafik_package/feature/auth/model/auth_response_model.dart';
import 'package:cep_trafik_package/feature/auth/service/IAuthService.dart';
import 'package:cep_trafik_package/feature/auth/service/components/auth_request_arguments.dart';
import 'package:dio/dio.dart';

class MockAuthService extends IAuthService {
  MockAuthService(DioClient client) : super(client);

  @override
  Future<AuthResponseModel?> fetchAccessToken() async {
    try {
      final response = await client.post(NetWorkRoutes.TOKEN.value,
          options: Options(contentType: Headers.formUrlEncodedContentType),
          data: AuthRequestModel(
                  grantType: AuthRequestArguments.grantType.value,
                  userName: AuthRequestArguments.userName.value,
                  password: AuthRequestArguments.password.value)
              .toJson());
      return ResponseParser<AuthResponseModel>(response: response)
          .fromMap(model: AuthResponseModel());
    } on DioError catch (e) {
      throw DioException.fromDioError(e);
    }
  }
}
