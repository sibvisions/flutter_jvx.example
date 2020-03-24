import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:jvx_flutterclient/ui/widgets/menu_drawer_widget.dart';
import 'package:latlong/latlong.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jvx_flutterclient/utils/globals.dart' as globals;

class MapCustomWidget extends StatelessWidget {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Map Custom Screen'),
        actions: <Widget>[
              IconButton(
                icon: Icon(FontAwesomeIcons.ellipsisV),
                onPressed: () =>
                    _scaffoldKey.currentState.openEndDrawer(),
              )
            ],),
      endDrawer: MenuDrawerWidget(
        menuItems: globals.items,
        listMenuItems: true,
        currentTitle: 'Telephone Call',
        groupedMenuMode: true),
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
                        child: Image.asset("packages/jvx_flutterclient/assets/images/sib_visions.jpg"),
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
