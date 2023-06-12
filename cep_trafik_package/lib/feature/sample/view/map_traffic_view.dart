import 'package:cep_trafik_package/core/init/navigation/navigation_service.dart';
import 'package:flutter/material.dart';

import '../../../core/components/utility/device_orientations.dart';

class MapTrafficView extends StatefulWidget {
  const MapTrafficView({Key? key}) : super(key: key);

  @override
  State<MapTrafficView> createState() => _MapTrafficViewState();
}

class _MapTrafficViewState extends State<MapTrafficView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    DeviceOrientations.instance.setOnlyPortraitView();
    return Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
              onTap: () {
                DeviceOrientations.instance.setPortraitAndLandscapeView();
                NavigationService.instance.pop();
              },
              child: const Icon(Icons.arrow_back)),
        ),
        body: const Center(child: Text('sdfsdf')));
  }
}
