import 'package:cep_trafik_package/core/components/cards/not_found_navigation.dart';
import 'package:cep_trafik_package/feature/sample/view/sample_view.dart';
import 'package:cep_trafik_package/feature/splash/view/splash_view.dart';
import 'package:flutter/material.dart';

import '../../../feature/sample/view/map_traffic_view.dart';
import '../../constants/navigation/navigation_constants.dart';

class NavigationRoute {
  static final NavigationRoute _instance = NavigationRoute._init();
  static NavigationRoute get instance => _instance;

  NavigationRoute._init();
//TODO: Add routes here
  Route<dynamic> generateRoute(RouteSettings args) {
    switch (args.name) {
      case NavigationConstants.DEFAULT:
        return normalNavigate(const SplashView());
      case NavigationConstants.SAMPLE:
        return normalNavigate(const SampleView());
      case NavigationConstants.MAP_VIEW:
        return normalNavigate(const MapTrafficView());
      default:
        return normalNavigate(const NotFoundNavigation());
    }
  }

  MaterialPageRoute normalNavigate(Widget widget) {
    return MaterialPageRoute(builder: (context) => widget);
  }
}

  //  case NavigationConstants.MOVIE_DETAILS_VIEV:
  //       if (args.arguments is MovieResultModel) {
  //         return normalNavigate(MovieDetailsView(movie: args.arguments! as MovieResultModel));
  //       }
  //       throw NavigateException<SettingsDynamicModel>(args.arguments);