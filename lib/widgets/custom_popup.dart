import 'package:flutter/material.dart';

class CustomPopup extends StatefulWidget {
  static CustomPopupState of(BuildContext context) =>
      context.ancestorStateOfType(const TypeMatcher<CustomPopupState>());

  CustomPopup({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return CustomPopupState();
  }
}

class CustomPopupState extends State<CustomPopup> {
  Future<void> _initializeVideoPlayerFuture;
  IconData playerIcon = Icons.play_arrow;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _buildDialogContent();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Container _buildDialogContent() {
    return Container(
      margin: EdgeInsets.all(5.0),
      width: 279.0,
      height: 121.0,
      child: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: Colors.black54,
              borderRadius: BorderRadius.all(Radius.circular(15)),
            ),
            margin: const EdgeInsets.only(top: 40.0),
            padding: EdgeInsets.all(5),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _buildNameAndLocation(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Expanded _buildNameAndLocation() {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.only(left: 6.0, top: 8, right: 6.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                Icon(
                  Icons.work,
                  color: Colors.grey,
                  size: 20.0,
                ),
                SizedBox(width: 5),
                Expanded(
                    child: Text(
                  'SIB Visions GmbH',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                )),
              ],
            ),
            SizedBox(height:5),
            Row(
              children: <Widget>[
                Icon(
                  Icons.location_on,
                  color: Colors.red,
                  size: 15.0,
                ),
                Text(
                  "Wehlistraße 29 / Stiege 1 / 2. Stock",
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
