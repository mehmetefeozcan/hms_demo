import 'package:flutter/material.dart';
import 'package:huawei_map/map.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HuaweiMapDemo(),
    );
  }
}

class HuaweiMapDemo extends StatefulWidget {
  const HuaweiMapDemo({super.key});

  @override
  _HuaweiMapDemoState createState() => _HuaweiMapDemoState();
}

class _HuaweiMapDemoState extends State<HuaweiMapDemo> {
  static const LatLng _center = LatLng(41.012959, 28.997438);
  static const double _zoom = 12;

  bool onLoading = false;

  @override
  void initState() {
    HuaweiMapInitializer.initializeMap();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: HuaweiMap(
        initialCameraPosition: CameraPosition(target: _center, zoom: _zoom),
        mapType: MapType.normal,
        tiltGesturesEnabled: true,
        buildingsEnabled: true,
        compassEnabled: true,
        zoomControlsEnabled: true,
        rotateGesturesEnabled: true,
        myLocationButtonEnabled: true,
        myLocationEnabled: true,
        padding: EdgeInsets.only(bottom: 30.0),
        logoPosition: HuaweiMap.LOWER_LEFT,
        logoPadding: EdgeInsets.only(
          left: 15,
          bottom: 75,
        ),
      ),
    );
  }
}
