import 'package:cep_trafik_package/core/components/utility/device_orientations.dart';
import 'package:cep_trafik_package/core/init/navigation/navigation_routes.dart';
import 'package:cep_trafik_package/core/init/navigation/navigation_service.dart';
import 'package:cep_trafik_package/core/init/theme/dark/app_theme_dark.dart';
import 'package:cep_trafik_package/core/init/theme/light/app_theme_light.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainView extends StatelessWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DeviceOrientations.instance.setPortraitAndLandscapeView();
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, widget) => MaterialApp(
        theme: AppThemeLight.instance.theme,
        darkTheme: AppThemeDark.instance.theme,
        themeMode: ThemeMode.system,
        navigatorKey: NavigationService.instance.navigatorKey,
        onGenerateRoute: NavigationRoute.instance.generateRoute,
      ),
    );
  }
}
