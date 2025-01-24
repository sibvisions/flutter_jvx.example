import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_jvx/flutter_jvx.dart';
import 'package:signature/signature.dart';

class SignatureCustomWidget extends StatefulWidget {
  const SignatureCustomWidget({super.key});

  @override
  State<SignatureCustomWidget> createState() => _SignatureCustomWidgetState();
}

class _SignatureCustomWidgetState extends State<SignatureCustomWidget> {
  static const String CONTACT_DATA_PROVIDER = "JVxMobileDemo/Sig-3V/contacts#4";
  static const String COLUMN_NAME_SIGNATURE = "SIGNATURE";
  static const String COLUMN_NAME_SIGNATURE_POINTS = "SIGNATURE_POINTS";

  final SignatureController _controller = SignatureController(
    penStrokeWidth: 2,
    penColor: Colors.black,
    exportBackgroundColor: Colors.white,
  );

  /// record cache
  DataChunk dataChunk = DataChunk.empty();

  /// the selected record index
  int? selectedIndex;

  @override
  void initState() {
    super.initState();

    IUiService().registerDataSubscription(
      pDataSubscription: DataSubscription(
        subbedObj: this,
        dataProvider: CONTACT_DATA_PROVIDER,
        from: 0,
        onDataChunk: _receiveDataChunk,
        onSelectedRecord: _receiveSelectedRecord,
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
    _controller.clear();

    if (selectedIndex != null) {
      var dataRow = dataChunk.data[selectedIndex]!;

      String? json = dataRow[dataChunk.columnDefinitions
          .indexByName(COLUMN_NAME_SIGNATURE_POINTS)];

      List<Point>? points = _fromJson(json);

      if (points != null) {
        _controller.points = points;
      }
    }

    return Center(
      child: Column(
        children: [
          const SizedBox(height: 10),
          const Text(
            "- Sign here -",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Container(
              margin: const EdgeInsets.all(15.0),
              child: Column(children: [
                Container(
                  margin: const EdgeInsets.only(top: 20, bottom: 15),
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: Theme.of(context).colorScheme.primary),
                    color: Colors.white,
                  ),
                  child: SizedBox(
                      height: 250,
                      child: Signature(
                        controller: _controller,
                        backgroundColor: Colors.transparent,
                      )),
                ),
                Row(
                  children: [
                    Expanded(
                      child: IconButton(
                        icon: const Icon(Icons.clear),
                        color: Theme.of(context).colorScheme.primary,
                        onPressed: () async {
                          await DataBook.updateRecord(
                              pDataProvider: CONTACT_DATA_PROVIDER,
                              pColumnNames: [
                                COLUMN_NAME_SIGNATURE,
                                COLUMN_NAME_SIGNATURE_POINTS
                              ],
                              pValues: [
                                null,
                                null
                              ]);

                          setState(() {});
                        },
                      ),
                    ),
                    Expanded(
                      child: IconButton(
                        icon: const Icon(Icons.check),
                        color: Theme.of(context).colorScheme.primary,
                        onPressed: () async {
                          if (_controller.isNotEmpty) {
                            var data = await _controller.toPngBytes();
                            await DataBook.updateRecord(
                              pDataProvider: CONTACT_DATA_PROVIDER,
                              pColumnNames: [
                                COLUMN_NAME_SIGNATURE,
                                COLUMN_NAME_SIGNATURE_POINTS
                              ],
                              pValues: [
                                base64Encode(data!),
                                _toJson(_controller.points)
                              ],
                            );
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ]))
        ],
      ),
    );
  }

  String? _toJson(List<Point> points) {
    List<Map> json = [];

    points.forEach((point) {
      json.add({
        'point': {'x': point.offset.dx, 'y': point.offset.dy},
        'type': point.type.name,
        'pressure': point.pressure
      });
    });

    return jsonEncode(json);
  }

  List<Point>? _fromJson(String? json) {
    if (json == null) {
      return null;
    }

    List<Point> result = [];

    List<dynamic> listJson = jsonDecode(json);

    listJson.forEach((entry) {
      result.add(Point(
        Offset(entry["point"]["x"], entry["point"]["y"]),
        PointType.values.byName(entry['type']),
        entry["pressure"],
      ));
    });

    return result;
  }

  void _receiveDataChunk(DataChunk pDataChunk) {
    dataChunk = pDataChunk;

    _updateSelection();
  }

  /// Receives selected row
  void _receiveSelectedRecord(DataRecord? pRecord) {
    if (selectedIndex != pRecord?.index) {
      selectedIndex = pRecord?.index;

      _updateSelection();
    }
  }

  void _updateSelection() {
    if (selectedIndex != null) {
      setState(() {});
    }
  }
}
