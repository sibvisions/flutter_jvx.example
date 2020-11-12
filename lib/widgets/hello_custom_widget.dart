import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jvx_flutterclient/core/models/app/app_state.dart';
import 'package:jvx_flutterclient/core/models/app/menu_arguments.dart';
import 'package:jvx_flutterclient/core/ui/widgets/menu/menu_drawer_widget.dart';
import 'package:jvx_flutterclient/core/ui/widgets/util/app_state_provider.dart';

class HelloCustomWidget extends StatefulWidget {
  @override
  _HelloCustomWidgetState createState() => _HelloCustomWidgetState();
}

class _HelloCustomWidgetState extends State<HelloCustomWidget> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    AppState appState = AppStateProvider.of(context).appState;

    return WillPopScope(
        onWillPop: () async {
          Navigator.of(context).pushReplacementNamed('/menu',
              arguments: MenuArguments(appState.items, true, null));
          return false;
        },
        child: Scaffold(
          key: _scaffoldKey,
          appBar: appState.appFrame.showScreenHeader
              ? AppBar(
                  leading: IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.of(context).pushReplacementNamed('/menu',
                          arguments: MenuArguments(appState.items, true, null));
                    },
                  ),
                  title: Text('Hello'),
                  actions: <Widget>[
                    IconButton(
                      icon: Icon(FontAwesomeIcons.ellipsisV),
                      onPressed: () =>
                          _scaffoldKey.currentState.openEndDrawer(),
                    )
                  ],
                )
              : null,
          endDrawer: MenuDrawerWidget(
              appState: appState,
              menuItems: appState.items,
              listMenuItems: true,
              currentTitle: 'Telephone Call',
              groupedMenuMode: true),
          body: Center(
            child: FlatButton(
              child: Text('Press this to get back to the Menu'),
              onPressed: () {
                Navigator.of(context).pushReplacementNamed('/menu',
                    arguments: MenuArguments(appState.items, true, null));
              },
            ),
          ),
        ));
  }
}
