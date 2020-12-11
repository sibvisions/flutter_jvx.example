import 'package:flutter/material.dart';
import 'package:flutterclient_example/widgets/styled_table_custom_widget.dart';
import 'package:jvx_flutterclient/core/models/api/request.dart';
import 'package:jvx_flutterclient/core/models/api/response.dart';
import 'package:jvx_flutterclient/core/models/api/response/response_data.dart';
import 'package:jvx_flutterclient/core/ui/screen/so_component_creator.dart';
import 'package:jvx_flutterclient/core/ui/screen/so_screen_configuration.dart';
import 'package:jvx_flutterclient/features/custom_screen/ui/screen/custom_screen.dart';

class StyledTableCustomScreen extends CustomScreen {
  StyledTableCustomScreen(
      {Key key,
      String templateName,
      @required SoScreenConfiguration configuration,
      SoComponentCreator creator})
      : super(
            key: key,
            templateName: templateName,
            configuration: configuration,
            creator: creator);

  @override
  StyledTableCustomScreenState createState() => StyledTableCustomScreenState();
}

class StyledTableCustomScreenState extends CustomScreenState {
  List<Contact> contacts = <Contact>[];

  @override
  Widget build(BuildContext context) {
    return StyledTableCustomWidget(contacts: contacts);
  }

  @override
  void onResponse(Response response) {
    super.onResponse(response);
    if (response.responseData != null &&
        response.responseData.dataBooks != null &&
        response.responseData.dataBooks.length > 0) {
      for (int i = 0;
          i < response.responseData.dataBooks[0].records.length;
          i++) {
        contacts.add(
            Contact.fromJson(response.responseData.dataBooks[0].records[i]));
      }
    }
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
