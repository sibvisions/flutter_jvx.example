import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';

class MapCustomWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Map Custom Screen'),),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text('SIBVisions address:', style: TextStyle(fontSize: 20),),
          Container(
            height: MediaQuery.of(context).size.height / 1.5,
            child: new FlutterMap(
              options: new MapOptions(center: LatLng(48.246533, 16.380093), zoom: 13.0),
              layers: [
                new TileLayerOptions(
                  urlTemplate: "https://api.tiles.mapbox.com/v4/"
                      "{id}/{z}/{x}/{y}@2x.png?access_token={accessToken}",
                  additionalOptions: {
                    'accessToken': 'pk.eyJ1IjoibG9yZW56bXVla3NjaCIsImEiOiJjamV6aG15eHAwZDQ3MnFwYW1yMmt4ajI0In0.g_r3IeL9KgarsZAahvoaJQ',
                    'id': 'mapbox.streets',
                  },
                ),
                new MarkerLayerOptions(
                  markers: [
                    new Marker(
                      width: 100.0,
                      height: 100.0,
                      point: new LatLng(48.246533, 16.380093),
                      builder: (ctx) => new Container(
                        child: Image.asset("packages/jvx_mobile_v3/assets/images/sib_visions.jpg"),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
