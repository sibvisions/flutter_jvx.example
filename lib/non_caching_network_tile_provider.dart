import 'package:flutter/cupertino.dart';
import 'package:flutter_map/flutter_map.dart';

class NonCachingNetworkTileProvider extends TileProvider {
  @override
  ImageProvider getImage(Coords<num> coords, TileLayerOptions options) {
    return NetworkImage(getTileUrl(coords, options));
  }
}