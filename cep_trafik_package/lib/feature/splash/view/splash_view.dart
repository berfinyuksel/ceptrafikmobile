import 'package:cep_trafik_package/core/components/loading/basic_loading_widget.dart';

import 'package:cep_trafik_package/feature/splash/cubit/splash_cubit.dart';
import 'package:flutter/material.dart';

import '../../../core/base/view/base_view.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<SplashCubit>(
      cubit: SplashCubit(),
      onCubitReady: (cubit) {
        cubit.setContext(context);
        cubit.init();
      },
      onPageBuilder: (SplashCubit cubit) => const Scaffold(
        body: BasicLoadingWidget(),
      ),
    );
  }
}
