import 'package:custom_info_window/custom_info_window.dart';
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

  final Set<Marker> markers = <Marker>{};
  int id = 0;

  @override
  void initState() {
    HuaweiMapInitializer.initializeMap();
    super.initState();
  }

  createMarker(double lat, double lng) {
    setState(() {
      final marker = Marker(
        markerId: MarkerId("${id + 1}"),
        position: LatLng(lat, lng),
        infoWindow: const InfoWindow(title: "Antidepresan"),
      );
      markers.add(marker);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          HuaweiMap(
            initialCameraPosition:
                const CameraPosition(target: _center, zoom: _zoom),
            mapType: MapType.normal,
            markers: markers,
            tiltGesturesEnabled: true,
            buildingsEnabled: true,
            compassEnabled: true,
            zoomControlsEnabled: true,
            rotateGesturesEnabled: true,
            myLocationButtonEnabled: true,
            myLocationEnabled: true,
            padding: const EdgeInsets.only(bottom: 30.0),
            logoPosition: HuaweiMap.LOWER_LEFT,
            logoPadding: const EdgeInsets.only(
              left: 15,
              bottom: 75,
            ),
            onPoiClick: (argument) {},
            onClick: (argument) {
              setState(() {
                createMarker(argument.lat, argument.lng);
              });
            },
            onLongPress: (argument) => markers.clear(),
          ),
        ],
      ),
    );
  }
}
