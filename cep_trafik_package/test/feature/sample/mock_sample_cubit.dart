import 'package:cep_trafik_package/core/base/cubit/base_cubit.dart';
import 'package:cep_trafik_package/core/init/network/dio_client.dart';
import 'package:cep_trafik_package/feature/sample/cubit/sample_cubit.dart';
import 'package:cep_trafik_package/feature/sample/model/sample_model.dart';
import 'package:cep_trafik_package/feature/sample/service/sample_service.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'mock_sample_service.dart';

class MockSampleCubit extends Cubit<SampleState> with BaseCubit {
  MockSampleCubit(
    this.dioClient,
  ) : super(const SampleState());

  late SampleService sampleService;
  final DioClient dioClient;

  void changeLoading(bool value) {
    emit(
      state.copyWith(isLoading: value),
    );
  }

  @override
  void init() {
    sampleService = MockSampleService(dioClient);
  }

  @override
  void setContext(BuildContext context) {
    // TODO: implement setContext
  }

    void changeText() async {
    changeLoading(true);
    emit(
      state.copyWith(title: 'hello'),
    );
    changeLoading(false);
  }
  

  Future<List<SampleModel>?> getFakeApi() async {
    final List<SampleModel>? result = await sampleService.getFakeApi();
    emit(state.copyWith(title: result?.first.title));
    return result;
  }
}
