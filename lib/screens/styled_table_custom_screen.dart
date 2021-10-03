import 'package:flutter/material.dart';
import 'package:flutterclient/flutterclient.dart';
import 'package:flutterclient_example/widgets/styled_table_custom_widget.dart';

const String CONTACT_DATAPROVIDER = "JVxMobileDemo/StyTab-2G/contacts#4";
const String COLUMNAME_ID = "ID";
const String COLUMNAME_FIRSTNAME = "FIRSTNAME";
const String COLUMNAME_LASTNAME = "LASTNAME";
const String COLUMNAME_STREET = "STREET";
const String COLUMNAME_STREET_NO = "NR";
const String COLUMNAME_ZIP = "ZIP";
const String COLUMNAME_TOWN = "TOWN";
const String COLUMNAME_IMAGE = "IMAGE";

class StyledTableCustomScreen extends CustomScreen {
  StyledTableCustomScreen(
      {Key? key,
      required SoScreenConfiguration configuration,
      required SoComponentCreator creator})
      : super(key: key, configuration: configuration, creator: creator);

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
  void onState(ApiState? state) {
    super.onState(state);
    if (state != null && state is ApiResponse && mounted) {
      // Updating the data objects
      if (state.hasDataBook) {
        DataBook? dataBook = state.getDataBookByProvider(CONTACT_DATAPROVIDER);
        if (dataBook != null) {
          for (int i = 0; i < dataBook.records.length; i++) {
            contacts.add(Contact(
                dataBook.getValue(COLUMNAME_ID, i),
                dataBook.getValue(COLUMNAME_FIRSTNAME, i),
                dataBook.getValue(COLUMNAME_LASTNAME, i),
                dataBook.getValue(COLUMNAME_IMAGE, i),
                dataBook.getValue(COLUMNAME_STREET, i),
                dataBook.getValue(COLUMNAME_STREET_NO, i),
                dataBook.getValue(COLUMNAME_ZIP, i),
                dataBook.getValue(COLUMNAME_TOWN, i)));
          }
        }
      }
    }
  }
}

class Contact {
  int id;
  String firstname;
  String lastname;
  String? image;
  String street;
  String streetNr;
  String zip;
  String town;

  Contact(this.id, this.firstname, this.lastname, this.image, this.street,
      this.streetNr, this.zip, this.town);
}
