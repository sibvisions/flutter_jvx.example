import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geolocation/geolocation.dart';
import 'package:jvx_flutterclient/ui/widgets/menu_drawer_widget.dart';
import 'package:jvx_flutterclient/utils/globals.dart' as globals;
import 'package:latlong/latlong.dart';
import 'package:url_launcher/url_launcher.dart';

import 'custom_popup.dart';
import 'custom_rounded_button.dart';

class MapCustomWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MapCustomWidgetState();
}

class MapCustomWidgetState extends State<MapCustomWidget> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  LatLng _center = LatLng(48.247533, 16.380093);
  MapController mapController = MapController();

  List<Marker> _buildMarkersOnMap() {
    List<Marker> markers = List<Marker>();
    var marker = new Marker(
      point: _center,
      width: 279.0,
      height: 121.0,
      builder: (context) => GestureDetector(
          onTap: () {
            setState(() {
              infoWindowVisible = !infoWindowVisible;
            });
          },
          child: _buildCustomMarker()),
    );
    markers.add(marker);

    return markers;
  }

  var infoWindowVisible = false;
  GlobalKey<State> key = new GlobalKey();
  Container _buildCustomMarker() {
    return Container(child: infoWindowVisible ? popup() : marker());
  }

  Opacity popup() {
    return Opacity(
      opacity: infoWindowVisible ? 1.0 : 0.0,
      child: Container(
        alignment: Alignment.bottomCenter,
        width: 279.0,
        height: 121.0,
        child: CustomPopup(key: key),
      ),
    );
  }

  Opacity marker() {
    return Opacity(
      child: Container(
        alignment: Alignment.bottomCenter,
        child: Image.asset(
          'assets/ic_marker.png',
          height: 60,
        ),
        width: 20,
        height: 25,
      ),
      opacity: infoWindowVisible ? 0.0 : 1.0,
    );
  }

  void _launchMapsUrl() async {
    final url =
        'https://www.google.com/maps/search/?api=1&query=Wehlistraße29, 1200 Wien';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void _launchCallUrl() async {
    final url = 'tel://+43 (0) 1 934 6009 0';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Map Custom Screen'),
        actions: <Widget>[
          IconButton(
            icon: Icon(FontAwesomeIcons.ellipsisV),
            onPressed: () => _scaffoldKey.currentState.openEndDrawer(),
          )
        ],
      ),
      endDrawer: MenuDrawerWidget(
          menuItems: globals.items,
          listMenuItems: true,
          currentTitle: 'Telephone Call',
          groupedMenuMode: true),
      body: Stack(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height -
                AppBar().preferredSize.height,
            child: new FlutterMap(
              mapController: mapController,
              options: new MapOptions(center: _center, zoom: 15.0),
              layers: [
                new TileLayerOptions(
                  urlTemplate: "https://api.tiles.mapbox.com/v4/"
                      "{id}/{z}/{x}/{y}@2x.png?access_token={accessToken}",
                  additionalOptions: {
                    'accessToken':
                        'pk.eyJ1IjoibG9yZW56bXVla3NjaCIsImEiOiJjamV6aG15eHAwZDQ3MnFwYW1yMmt4ajI0In0.g_r3IeL9KgarsZAahvoaJQ',
                    'id': 'mapbox.streets',
                  },
                ),
                new MarkerLayerOptions(
                  markers: _buildMarkersOnMap(),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(15)),
            ),
            height: 175,
            width: double.infinity,
            child: Column(
              children: <Widget>[
                SizedBox(height: 10),
                Center(
                  child: Container(
                    height: 40,
                    child: Image.asset(
                        'packages/jvx_flutterclient/assets/images/sib_visions.jpg'),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'SIB Visions GmbH',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              'Wehlistraße 29',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              '1200 Wien',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 15),
                        child: CustomRoundedButton(
                            "Maps",
                            Icon(Icons.map, color: Colors.white),
                            _launchMapsUrl),
                      ),
                      SizedBox(width: 10),
                      Container(
                        margin: EdgeInsets.only(top: 15),
                        child: CustomRoundedButton(
                            "Call",
                            Icon(Icons.call, color: Colors.white),
                            _launchCallUrl),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              bottom: 10,
              right: 10,
            ),
            child: Align(
              alignment: Alignment.bottomRight,
              child: FloatingActionButton(
                onPressed: () async {
                  LocationResult result = await Geolocation.lastKnownLocation();
                  print(result.location.latitude.toString());
                  _center = LatLng(
                      result.location.latitude, result.location.longitude);
                  mapController.move(_center, mapController.zoom);
                },
                child: const Icon(Icons.location_searching),
                elevation: 5,
              ),
            ),
          )
        ],
      ),
    );
  }
}
