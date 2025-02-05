import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_jvx/flutter_jvx.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:url_launcher/url_launcher.dart';

import 'custom_popup.dart';
import 'custom_rounded_button.dart';

class MapCustomWidget extends StatefulWidget {
  const MapCustomWidget({super.key});

  @override
  State<StatefulWidget> createState() => MapCustomWidgetState();
}

class MapCustomWidgetState extends State<MapCustomWidget> {
  final LatLng _initialPosition = const LatLng(48.247533, 16.380093);
  final MapController _mapController = MapController();
  bool _infoWindowVisible = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height - AppBar().preferredSize.height,
          child: FlutterMap(
            mapController: _mapController,
            options: MapOptions(
              initialCenter: _initialPosition,
              initialZoom: 16,
              minZoom: 0,
              maxZoom: 18,
            ),
            children: [
              TileLayer(
                urlTemplate: "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
                userAgentPackageName: "com.sibvisions.flutter_jvx.example",
              ),
              MarkerLayer(
                markers: _buildMarkers(),
                rotate: true,
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.all(5),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(15)),
          ),
          height: 175,
          width: double.infinity,
          child: Column(
            children: [
              const SizedBox(height: 10),
              Center(
                child: SizedBox(
                  height: 40,
                  child: Image.asset("assets/images/sib_visions_logo.png"),
                ),
              ),
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.all(10),
                child: IntrinsicHeight(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Expanded(
                        flex: 4,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "SIB Visions GmbH",
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              "Wehlistreet 29",
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              "1200 Vienna",
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: CustomRoundedButton(
                          text: const Text("Info"),
                          icon: const Icon(Icons.open_in_new),
                          onTap: _launchMapsUrl,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: CustomRoundedButton(
                          text: const Text("Call"),
                          icon: const Icon(Icons.call),
                          onTap: _launchCallUrl,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.only(
            bottom: 10,
            right: 10,
          ),
          child: Align(
            alignment: Alignment.bottomRight,
            child: !kIsWeb
                ? FloatingActionButton(
                    onPressed: () {
                      getPosition().then((position) {
                        if (position != null) {
                          log(position.toString());
                          _mapController.move(LatLng(position.latitude, position.longitude),
                              _mapController.camera.zoom);
                        } else {
                          log("No last known location");
                        }
                      }).catchError((e, stack) {
                        log("Failed to obtain user location", error: e, stackTrace: stack);
                        return null;
                      });
                    },
                    elevation: 5,
                    child: const Icon(Icons.location_searching),
                  )
                : null,
          ),
        )
      ],
    );
  }

  @override
  void dispose() {
    _mapController.dispose();

    super.dispose();
  }

  List<Marker> _buildMarkers() {

    Size effectiveSize = Size(
      _infoWindowVisible ? 279.0 : 60,
      _infoWindowVisible ? 81.0 : 60,
    );

    return [
      Marker(
        width: effectiveSize.width,
        height: effectiveSize.height,
        point: _initialPosition,
        alignment: Alignment.topCenter,
        child: GestureDetector(child: _infoWindowVisible ? _buildPopup() : _buildMarker(),
        onTap: () => setState(() => _infoWindowVisible = !_infoWindowVisible)),
      ),
    ];
  }

  Widget _buildPopup() {
    return const CustomPopup();
  }

  Widget _buildMarker() {
    return Image.asset(
      "assets/images/ic_marker.png",
      height: 60,
    );
  }

  void _launchMapsUrl() async {
    const url = "https://www.google.com/maps/search/?api=1&query=SIB Visions GmbH";
    await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
  }

  void _launchCallUrl() async {
    const url = "tel://+43 (0) 1 934 6009";
    await launchUrl(Uri.parse(url));
  }

  Future<Position?> getPosition() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error("Location services are disabled.");
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error("Location permissions are denied");
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error("Location permissions are permanently denied, we cannot request permissions.");
    }

    return await Geolocator.getLastKnownPosition();
  }
}
