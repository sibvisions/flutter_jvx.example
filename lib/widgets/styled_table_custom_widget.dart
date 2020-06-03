import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:jvx_flutterclient/utils/globals.dart' as globals;

import '../screens/styled_table_custom_screen.dart';

class StyledTableCustomWidget extends StatefulWidget {
  final List<Contact> contacts;

  const StyledTableCustomWidget({Key key, this.contacts}) : super(key: key);

  @override
  _StyledTableCustomWidgetState createState() =>
      _StyledTableCustomWidgetState();
}

class _StyledTableCustomWidgetState extends State<StyledTableCustomWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemBuilder: (ctx, index) {
                return Card(
                  child: Row(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 15,
                        ),
                        padding: EdgeInsets.all(10),
                        child: widget.contacts[index].image != null
                            ? CircleAvatar(
                                backgroundImage: MemoryImage(
                                    base64Decode(widget.contacts[index].image)),
                                minRadius: 40,
                              )
                            : CircleAvatar(
                                backgroundColor:
                                    globals.applicationStyle.themeColor,
                                minRadius: 40,
                                child: Text(
                                  '${widget.contacts[index].firstname[0]}${widget.contacts[index].lastname[0]}',
                                  style: TextStyle(
                                      fontSize: 40, color: Colors.white),
                                ),
                              ),
                      ),
                      VerticalDivider(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            widget.contacts[index].firstname,
                            style: Theme.of(context).textTheme.headline6,
                          ),
                          Text(
                            widget.contacts[index].lastname,
                            style: TextStyle(color: Colors.grey),
                          )
                        ],
                      ),
                      Expanded(
                          child: Container(
                            alignment: Alignment.centerRight,
                            child: Icon(Icons.keyboard_arrow_right,
                                color: Colors.black, size: 40.0),
                          )),
                    ],
                  ),
                );
              },
              itemCount: widget.contacts.length,
            ),
          ),
        ],
      ),
    );
  }
}
