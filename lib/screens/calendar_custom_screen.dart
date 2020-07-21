import 'package:flutter/material.dart';
import 'package:flutterclient_example/widgets/calendar_custom_widget.dart';
import 'package:jvx_flutterclient/custom_screen/custom_screen.dart';
import 'package:jvx_flutterclient/model/api/request/request.dart';
import 'package:jvx_flutterclient/model/api/response/response_data.dart';
import 'package:jvx_flutterclient/ui/screen/so_component_creator.dart';

class CalendarCustomScreen extends CustomScreen {
  List<CalendarData> calendarData = <CalendarData>[];

  CalendarCustomScreen(SoComponentCreator componentCreator)
      : super(componentCreator);

  @override
  Widget getWidget() {
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
