import 'package:flutter/material.dart';
import 'package:flutterclient_example/widgets/calendar_custom_widget.dart';
import 'package:jvx_flutterclient/core/models/api/request.dart';
import 'package:jvx_flutterclient/core/models/api/response/response_data.dart';
import 'package:jvx_flutterclient/features/custom_screen/ui/screen/custom_screen.dart';

class CalendarCustomScreen extends CustomScreen {
  final List<CalendarData> calendarData = <CalendarData>[];

  CalendarCustomScreen(String templateName) : super(templateName);

  @override
  Widget build(BuildContext context) {
    return CalendarCustomWidget(
      calendarData: calendarData,
    );
  }

  @override
  void update(Request request, ResponseData responseData) {
    if (responseData != null &&
        responseData.dataBooks != null &&
        responseData.dataBooks.length > 0) {
      for (int i = 0; i < responseData.dataBooks[0].records.length; i++) {
        calendarData
            .add(CalendarData.fromJson(responseData.dataBooks[0].records[i]));
      }
    }
  }

  @override
  bool withServer() {
    return true;
  }
}

class CalendarData {
  String event;
  int daysFromToday;

  CalendarData(this.event, this.daysFromToday);

  CalendarData.fromJson(List json)
      : event = json[0],
        daysFromToday = json[1];
}
