import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

class TelephoneCallCustomWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String numberToCall;

    return Scaffold(
      appBar: AppBar(title: Text('Telephone Call'),),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Enter telephone number'
                ),
                onChanged: (String change) => numberToCall = change,
              ),
            ),
            RaisedButton(
              child: Text('Make call'),
              onPressed: () {
                launch("tel://$numberToCall"); 
              },
            )
          ],
        ),
      ),
    );
  }
}