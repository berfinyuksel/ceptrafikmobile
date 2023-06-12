import 'package:cep_trafik_package/core/init/network/dio_manager.dart';
import 'package:cep_trafik_package/feature/auth/model/auth_response_model.dart';
import 'package:cep_trafik_package/feature/auth/service/auth_service.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late AuthService authService;
  setUp(() {
    authService = AuthService(DioManager.instance.TKMNetworkClient);
  });
  test('Fetch user token success', () async {
    final AuthResponseModel? result = await authService.fetchAccessToken();
    expect(result?.accessToken, isNotEmpty);
    expect(result?.tokenType, 'bearer');
  });
}
