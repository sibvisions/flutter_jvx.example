import 'package:flutter/material.dart';
import 'package:flutterclient_example/widgets/calendar_custom_widget.dart';
import 'package:jvx_flutterclient/custom_screen/custom_screen.dart';
import 'package:jvx_flutterclient/model/api/request/request.dart';
import 'package:jvx_flutterclient/model/api/response/response_data.dart';
import 'package:jvx_flutterclient/ui/screen/component_creator.dart';

class CalendarCustomScreen extends CustomScreen {
  List<CalendarData> calendarData = <CalendarData>[];

  CalendarCustomScreen(ComponentCreator componentCreator)
      : super(componentCreator);

  @override
  Widget getWidget() {
    return CalendarCustomWidget(calendarData: calendarData,);
  }

  @override
  void update(Request request, ResponseData responseData) {
    if (responseData != null && responseData.jVxData!=null && responseData.jVxData.length > 0) {
      for (int i = 0; i < responseData.jVxData[0].records.length; i++) {
        calendarData.add(CalendarData.fromJson(responseData.jVxData[0].records[i]));
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
