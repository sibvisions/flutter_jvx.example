import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_jvx/mixin/config_service_mixin.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import "package:latlong2/latlong.dart";
import 'package:url_launcher/url_launcher.dart';

import 'custom_popup.dart';
import 'custom_rounded_button.dart';

class MapCustomWidget extends StatefulWidget {
  const MapCustomWidget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => MapCustomWidgetState();
}

class MapCustomWidgetState extends State<MapCustomWidget>
    with ConfigServiceGetterMixin {
  late final String? apiKey;
  final LatLng initialPosition = LatLng(48.247533, 16.380093);
  MapController mapController = MapController();
  bool infoWindowVisible = false;

  List<Marker> _buildMarker() {
    return [
      Marker(
        point: initialPosition,
        width: 279.0,
        height: 121.0,
        anchorPos: AnchorPos.align(AnchorAlign.top),
        builder: (context) => GestureDetector(
            onTap: () {
              setState(() {
                infoWindowVisible = !infoWindowVisible;
              });
            },
            child: infoWindowVisible ? popup() : marker()),
      ),
    ];
  }

  @override
  void initState() {
    super.initState();
    apiKey = getConfigService().getAppConfig()?.startupParameters?["apiKey"];
  }

  Container popup() {
    return Container(
      alignment: Alignment.bottomCenter,
      width: 279.0,
      height: 121.0,
      child: const CustomPopup(),
    );
  }

  Container marker() {
    return Container(
      alignment: Alignment.bottomCenter,
      width: 20,
      height: 25,
      child: Image.asset(
        "assets/images/ic_marker.png",
        height: 60,
      ),
    );
  }

  void _launchMapsUrl() async {
    const url =
        "https://www.google.com/maps/search/?api=1&query=SIB Visions GmbH";
    await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
  }

  void _launchCallUrl() async {
    const url = "tel://+43 (0) 1 934 6009 0";
    await launchUrl(Uri.parse(url));
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height -
              AppBar().preferredSize.height,
          child: FlutterMap(
            mapController: mapController,
            options: MapOptions(
              center: initialPosition,
              zoom: 15,
              minZoom: 0,
              maxZoom: 18,
            ),
            layers: [
              TileLayerOptions(
                urlTemplate: "https://api.mapbox.com/styles/v1/"
                    "{id}/tiles/{z}/{x}/{y}?access_token={accessToken}",
                additionalOptions: {
                  "id": "mapbox/streets-v11",
                  "accessToken": apiKey ?? "",
                },
              ),
              MarkerLayerOptions(
                markers: _buildMarker(),
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
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
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
                            "Wehlistraße 29",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            "1200 Wien",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 15),
                      child: CustomRoundedButton(
                        text: "Maps",
                        icon: const Icon(Icons.map, color: Colors.white),
                        onTap: _launchMapsUrl,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Container(
                      margin: const EdgeInsets.only(top: 15),
                      child: CustomRoundedButton(
                        text: "Call",
                        icon: const Icon(Icons.call, color: Colors.white),
                        onTap: _launchCallUrl,
                      ),
                    ),
                  ],
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
                          mapController.move(
                              LatLng(position.latitude, position.longitude),
                              mapController.zoom);
                        } else {
                          log("No last known location");
                        }
                      }).catchError((e) {
                        log("Failed to obtain user location", error: e);
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
    mapController.dispose();
    super.dispose();
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
      return Future.error(
          "Location permissions are permanently denied, we cannot request permissions.");
    }

    return Geolocator.getLastKnownPosition();
  }
}
