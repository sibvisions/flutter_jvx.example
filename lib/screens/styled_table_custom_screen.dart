import 'package:flutter/material.dart';
import 'package:flutterclient_example/widgets/styled_table_custom_widget.dart';
import 'package:jvx_flutterclient/custom_screen/custom_screen.dart';
import 'package:jvx_flutterclient/model/api/request/request.dart';
import 'package:jvx_flutterclient/model/api/response/response_data.dart';
import 'package:jvx_flutterclient/ui/screen/so_component_creator.dart';

class StyledTableCustomScreen extends CustomScreen {
  List<Contact> contacts = <Contact>[];

  StyledTableCustomScreen(SoComponentCreator componentCreator)
      : super(componentCreator);

  @override
  Widget getWidget() {
    return StyledTableCustomWidget(
      contacts: contacts,
    );
  }

  @override
  void update(Request request, ResponseData responeData) {
    if (responeData != null &&
        responeData.dataBooks != null &&
        responeData.dataBooks.length > 0) {
      for (int i = 0; i < responeData.dataBooks[0].records.length; i++) {
        contacts.add(Contact.fromJson(responeData.dataBooks[0].records[i]));
        for (int j = 0; j < responeData.dataBooks[0].records[i].length; j++) {
          print(responeData.dataBooks[0].records[i][j]);
        }
      }
    }
  }

  @override
  bool withServer() {
    return true;
  }
}

class Contact {
  int id;
  String firstname;
  String lastname;
  String image;
  String street;
  String streetNr;
  String zip;
  String town;

  Contact(this.id, this.firstname, this.lastname, this.image, this.street,
      this.streetNr, this.zip, this.town);

  Contact.fromJson(List json)
      : id = json[0],
        firstname = json[5],
        lastname = json[6],
        street = json[7],
        streetNr = json[8],
        zip = json[9],
        town = json[10],
        image = json[18];
}
