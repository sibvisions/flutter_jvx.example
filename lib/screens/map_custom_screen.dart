import 'package:flutter/material.dart';
import 'package:flutterclient/flutterclient.dart';
import '../widgets/map_custom_widget.dart';

class MapCustomScreen extends CustomScreen {
  MapCustomScreen(
      {Key? key,
      required SoScreenConfiguration configuration,
      required SoComponentCreator creator})
      : super(key: key, configuration: configuration, creator: creator);

  @override
  MapCustomScreenState createState() => MapCustomScreenState();
}

class MapCustomScreenState extends CustomScreenState {
  @override
  Widget build(BuildContext context) {
    String apiKey = '';
    //AppStateProvider.of(context).appState.config.properties['apiKey'];

    return MapCustomWidget(
      apiKey: apiKey,
    );
  }
}
