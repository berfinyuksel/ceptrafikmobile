import 'package:bloc_test/bloc_test.dart';
import 'package:cep_trafik_package/core/constants/app/app_constants.dart';
import 'package:cep_trafik_package/core/init/network/dio_client.dart';
import 'package:cep_trafik_package/feature/sample/cubit/sample_cubit.dart';
import 'package:cep_trafik_package/feature/sample/model/sample_model.dart';
import 'package:cep_trafik_package/feature/sample/service/sample_service.dart';
import 'package:flutter_test/flutter_test.dart';

import 'mock_sample_cubit.dart';
import 'mock_sample_service.dart';

void main() {
  late DioClient dioClient;
  late SampleService sampleService;
  late MockSampleService mockSampleService;
  late MockSampleCubit sampleCubit;

  setUp(() {
    dioClient = DioClient(baseUrl: AppConstants.IBB_BASE_URL);
    sampleService = SampleService(dioClient);
    mockSampleService = MockSampleService(dioClient);
    sampleCubit = MockSampleCubit(dioClient)..init();
  });

  test('SampleService getFakeAPI success', () async {
    final List<SampleModel>? result = await sampleService.getFakeApi();
    expect(result, isNotEmpty);
  });

  test('MockSampleService getOneFakeAPI success', () async {
    final result = await mockSampleService.getOneFakeApi();

    expect(result?.id, 1);
  });
  group('Cubit methods', () {
    List<SampleModel>? result = [];
    String? title = '';
    blocTest('MockSampleCubit getFakeAPI success',
        build: () => sampleCubit,
        act: (MockSampleCubit cubit) async {
          result = await cubit.getFakeApi();
          title = result?.first.title;
        },
        expect: () => [SampleState(title: title)]);

    blocTest('Sample Cubit change loading statte success',
        build: () => sampleCubit,
        act: (MockSampleCubit cubit) => cubit.changeLoading(true),
        expect: () => [const SampleState(isLoading: true)]);

    blocTest('Sample Cubit change text emits result successfully',
        build: () => sampleCubit,
        act: (MockSampleCubit cubit) async {
          cubit.changeText();
        },
        expect: () => [
              const SampleState(isLoading: true, title: 'title'),
              const SampleState(isLoading: true, title: 'hello'),
              const SampleState(isLoading: false, title: 'hello')
            ]);
  });
}