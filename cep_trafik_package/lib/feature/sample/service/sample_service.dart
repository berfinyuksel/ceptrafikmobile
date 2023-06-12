import 'package:cep_trafik_package/core/components/utility/api_response.dart';
import 'package:cep_trafik_package/core/init/network/dio_client.dart';
import 'package:cep_trafik_package/feature/sample/model/sample_model.dart';
import 'package:cep_trafik_package/feature/sample/service/ISampleService.dart';
import 'package:dio/dio.dart';

import '../../../core/base/error/dio_exception.dart';

class SampleService extends ISampleService {
  SampleService(DioClient client) : super(client);

  @override
  Future<List<SampleModel>?> getFakeApi() async {
    try {
      final response = await client.get('/posts');
      return ResponseParser<SampleModel>(response: response).fromList<List<SampleModel>>(model: SampleModel());
    } on DioError catch (e) {
      throw DioException.fromDioError(e);
    }
  }

  Future<SampleModel?> getOneFakeApi() async {
    try {
      final response = await client.get('/posts');
      return ResponseParser<SampleModel>(response: response[0]).fromMap(model: SampleModel());
    } on DioError catch (e) {
      throw DioException.fromDioError(e);
    }
  }
}
