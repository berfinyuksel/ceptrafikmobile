// ignore_for_file: non_constant_identifier_names

import 'package:cep_trafik_package/core/base/error/dio_exception.dart';
import 'package:cep_trafik_package/core/constants/app/app_constants.dart';
import 'package:cep_trafik_package/core/init/app_state/app_state.dart';
import 'package:cep_trafik_package/core/init/network/dio_client.dart';
import 'package:dio/dio.dart';

class DioManager {
  static DioManager? _instance;
  static DioManager get instance {
    return _instance ??= DioManager.init();
  }

  DioManager.init();

  DioClient IBBNetworkClient = DioClient(baseUrl: AppConstants.IBB_BASE_URL);

  DioClient TKMNetworkClient = DioClient(
      baseUrl: AppConstants.TKM_BASE_URL,
      interceptorsWrapper: InterceptorsWrapper(onRequest: (options, handler) async {
        String accessToken = AppStateManager.instance.accessToken;
        if (accessToken.isNotEmpty) {
          options.headers.putIfAbsent('Authorization', () => 'bearer $accessToken');
        }
        options.contentType = Headers.formUrlEncodedContentType;
        return handler.next(options);
      }, onResponse: (response, handler) {
        return handler.next(response);
      }, onError: (DioError e, handler) {
        throw DioException.fromDioError(e);
      }));
}
