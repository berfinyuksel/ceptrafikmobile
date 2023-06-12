import 'package:cep_trafik_package/core/init/cache/local_database_manager.dart';
import 'package:cep_trafik_package/core/init/cache/shared_prefs_manager.dart';
import 'package:cep_trafik_package/core/init/navigation/navigation_service.dart';
import 'package:cep_trafik_package/core/init/network/dio_manager.dart';
import 'package:flutter/material.dart';

abstract class BaseCubit {
  BuildContext? context;

  DioManager dioManager = DioManager.instance;
  SharedPrefsManager sharedPrefManager = SharedPrefsManager.instance;
  NavigationService navigation = NavigationService.instance;
  LocalDatabaseManager localDatabaseManager = LocalDatabaseManager.instance;

  void setContext(BuildContext context);
  void init();
}
