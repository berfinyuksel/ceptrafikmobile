import 'package:flutter/services.dart';

class DeviceOrientations {
  static DeviceOrientations? _instance;
  static DeviceOrientations get instance {
    return _instance ??= DeviceOrientations.init();
  }

  DeviceOrientations.init();
  Future<void> setPortraitAndLandscapeView() {
    return SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight
    ]);
  }

  Future<void> setOnlyPortraitView() {
    return SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }
}
