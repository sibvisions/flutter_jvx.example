import 'package:flutter/material.dart';
import 'package:jvx_flutterclient/ui/widgets/menu_drawer_widget.dart';
import 'package:jvx_flutterclient/utils/globals.dart' as globals;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HelloCustomWidget extends StatefulWidget {
  @override
  _HelloCustomWidgetState createState() => _HelloCustomWidgetState();
}

class _HelloCustomWidgetState extends State<HelloCustomWidget> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Hello'),
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
      body: Center(
        child: FlatButton(
          child: Text('Press this to get back to the Menu'),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
    );
  }
}
