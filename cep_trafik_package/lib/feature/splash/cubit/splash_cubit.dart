import 'package:bloc/bloc.dart';
import 'package:cep_trafik_package/core/constants/enums/shared_pref_keys.dart';
import 'package:cep_trafik_package/core/init/cache/local_database.dart';
import 'package:cep_trafik_package/core/init/network/dio_manager.dart';
import 'package:cep_trafik_package/feature/auth/model/auth_response_model.dart';
import 'package:cep_trafik_package/feature/auth/service/auth_service.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../core/base/cubit/base_cubit.dart';
import '../../../core/constants/navigation/navigation_constants.dart';
import '../../../core/init/cache/shared_prefs_manager.dart';
import '../../../core/init/di/locator.dart' as servicelocator;

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> with BaseCubit {
  SplashCubit() : super(SplashInitial());
  late AuthService authService;
  @override
  void init() async {
    await _initMethods();
    await fecthAccessToken();
    await navigateToMapView();
  }

  @override
  void setContext(BuildContext context) => this.context = context;

  Future<void> _initMethods() async {
    WidgetsFlutterBinding.ensureInitialized();
    await SharedPrefsManager.preferencesInit();
    await LocalDatabase.instance.database;
    await servicelocator.init();
    authService = AuthService(dioManager.TKMNetworkClient);
  }

  Future<void> fecthAccessToken() async {
    await authService.fetchAccessToken();
  }

  Future<void> navigateToMapView() async {
    await navigation.navigateToPage(path: NavigationConstants.SAMPLE);
  }
}
