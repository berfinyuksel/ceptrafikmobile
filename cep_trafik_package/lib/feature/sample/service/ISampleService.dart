import 'package:cep_trafik_package/core/init/network/dio_client.dart';

import '../model/sample_model.dart';

abstract class ISampleService {
   final DioClient client;

  ISampleService(this.client);
  
  Future<List<SampleModel>?> getFakeApi();
}
