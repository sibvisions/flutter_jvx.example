import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_jvx/data.dart';
import 'package:flutter_jvx/services.dart';

class StyledTableCustomWidget extends StatefulWidget {
  const StyledTableCustomWidget({Key? key}) : super(key: key);

  @override
  State<StyledTableCustomWidget> createState() =>
      _StyledTableCustomWidgetState();
}

class _StyledTableCustomWidgetState extends State<StyledTableCustomWidget> {
  static const String CONTACT_DATA_PROVIDER =
      "JVxMobileDemo/StyTab-2G/contacts#4";
  static const String COLUMN_NAME_ID = "ID";
  static const String COLUMN_NAME_FIRSTNAME = "FIRSTNAME";
  static const String COLUMN_NAME_LASTNAME = "LASTNAME";
  static const String COLUMN_NAME_STREET = "STREET";
  static const String COLUMN_NAME_STREET_NO = "NR";
  static const String COLUMN_NAME_ZIP = "ZIP";
  static const String COLUMN_NAME_TOWN = "TOWN";
  static const String COLUMN_NAME_IMAGE = "IMAGE";

  final List<Contact> contacts = [];

  @override
  void initState() {
    super.initState();
    IUiService().registerDataSubscription(
      pDataSubscription: DataSubscription(
        subbedObj: this,
        dataProvider: CONTACT_DATA_PROVIDER,
        from: 0,
        dataColumns: [
          COLUMN_NAME_ID,
          COLUMN_NAME_FIRSTNAME,
          COLUMN_NAME_LASTNAME,
          COLUMN_NAME_IMAGE,
          COLUMN_NAME_STREET,
          COLUMN_NAME_STREET_NO,
          COLUMN_NAME_ZIP,
          COLUMN_NAME_TOWN,
        ],
        onDataChunk: (DataChunk dataChunk) {
          contacts.clear();
          for (int i = 0; i < dataChunk.data.length; i++) {
            contacts.add(Contact(
              dataChunk.data[i]![0],
              dataChunk.data[i]![1],
              dataChunk.data[i]![2],
              dataChunk.data[i]![3],
              dataChunk.data[i]![4],
              dataChunk.data[i]![5],
              dataChunk.data[i]![6],
              dataChunk.data[i]![7],
            ));
          }
          setState(() {});
        },
      ),
    );
  }

  @override
  void dispose() {
    IUiService().disposeDataSubscription(pSubscriber: this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemBuilder: (ctx, index) {
                return Card(
                  child: Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 15,
                        ),
                        padding: const EdgeInsets.all(10),
                        child: contacts[index].image != null
                            ? CircleAvatar(
                                backgroundImage: MemoryImage(
                                    base64Decode(contacts[index].image!)),
                                minRadius: 40,
                              )
                            : CircleAvatar(
                                backgroundColor: Theme.of(context).primaryColor,
                                minRadius: 40,
                                child: Text(
                                  '${contacts[index].firstname[0]}${contacts[index].lastname[0]}',
                                  style: const TextStyle(
                                      fontSize: 40, color: Colors.white),
                                ),
                              ),
                      ),
                      const VerticalDivider(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${contacts[index].firstname} ${contacts[index].lastname}',
                            style: Theme.of(context).textTheme.headline6,
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              const Icon(
                                Icons.map,
                                color: Colors.grey,
                                size: 13.0,
                              ),
                              const SizedBox(width: 5),
                              Text(
                                '${contacts[index].street} ${contacts[index].streetNr}, ${contacts[index].zip} ${contacts[index].town}',
                                style: const TextStyle(
                                    color: Colors.grey, fontSize: 14),
                              ),
                            ],
                          )
                        ],
                      ),
                      Expanded(
                          child: Container(
                        alignment: Alignment.centerRight,
                        child: const Icon(Icons.keyboard_arrow_right,
                            color: Colors.black, size: 40.0),
                      )),
                    ],
                  ),
                );
              },
              itemCount: contacts.length,
            ),
          ),
        ],
      ),
    );
  }
}

class Contact {
  final int id;
  final String firstname;
  final String lastname;
  final String? image;
  final String street;
  final String streetNr;
  final String zip;
  final String town;

  Contact(this.id, this.firstname, this.lastname, this.image, this.street,
      this.streetNr, this.zip, this.town);
}
