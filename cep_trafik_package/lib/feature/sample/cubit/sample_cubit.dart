import 'package:bloc/bloc.dart';
import 'package:cep_trafik_package/core/constants/enums/shared_pref_keys.dart';
import 'package:cep_trafik_package/core/constants/navigation/navigation_constants.dart';
import 'package:cep_trafik_package/feature/auth/service/auth_service.dart';
import 'package:cep_trafik_package/feature/sample/model/sample_model.dart';
import 'package:cep_trafik_package/feature/sample/service/sample_service.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../core/base/cubit/base_cubit.dart';

part 'sample_state.dart';

class SampleCubit extends Cubit<SampleState> with BaseCubit {
  SampleCubit() : super(const SampleState());
  late SampleService sampleService;
  late AuthService authService;

  @override
  void init() async {
    sampleService = SampleService(dioManager.IBBNetworkClient);
    authService = AuthService(dioManager.TKMNetworkClient);
    String title = sharedPrefManager.getStringValue(SharedPrefKeys.TITLE);
    await getCachedFakeApi();
    debugPrint(title);
  }

  @override
  void setContext(BuildContext context) => this.context = context;

  void changeLoading(bool value) {
    emit(
      state.copyWith(isLoading: value),
    );
  }

  Future<List<SampleModel>?> getFakeApi() async {
    final List<SampleModel>? result = await sampleService.getFakeApi();
    emit(state.copyWith(sampleList: result));
    await cacheFakeApi(result);
    return result;
  }

  void getAuth() async {
    await authService.fetchAccessToken();
  }

  Future<void> cacheFakeApi(List<SampleModel>? result) async {
    await localDatabaseManager.sampleMananager?.insertAll(result ?? []);
  }

  Future<List<SampleModel>?> getCachedFakeApi() async {
    final result = await localDatabaseManager.sampleMananager?.getCachedData(SampleModel()) ?? [];
    emit(state.copyWith(sampleList: result));
    return result;
  }

  void changeText() async {
    changeLoading(true);

    cacheTitle();
    emit(
      state.copyWith(title: state.title == 'new title' ? 'final title' : 'new title'),
    );
    changeLoading(false);
  }

  void navigate() async {
    await navigation.navigateToPage(path: NavigationConstants.MAP_VIEW);
  }

  void showAlert() {
    showDialog(
        context: context!,
        builder: (context) {
          return const Text('dialog shown');
        });
  }

  void cacheTitle() {
    sharedPrefManager.setStringValue(SharedPrefKeys.TITLE, state.title!);
  }
}
