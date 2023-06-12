import 'package:cep_trafik_package/core/init/network/dio_client.dart';
import 'package:cep_trafik_package/feature/auth/model/auth_response_model.dart';

abstract class IAuthService {
  final DioClient client;
  IAuthService(this.client);

  Future<AuthResponseModel?> fetchAccessToken();
}
