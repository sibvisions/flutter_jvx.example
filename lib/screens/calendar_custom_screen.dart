import 'package:flutter/material.dart';
import 'package:jvx_flutterclient/core/models/api/response.dart';
import 'package:jvx_flutterclient/core/ui/screen/so_component_creator.dart';
import 'package:jvx_flutterclient/core/ui/screen/so_screen_configuration.dart';
import 'package:jvx_flutterclient/features/custom_screen/ui/screen/custom_screen.dart';

import '../widgets/calendar_custom_widget.dart';

class CalendarCustomScreen extends CustomScreen {
  CalendarCustomScreen(
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
  CalendarCustomScreenState createState() => CalendarCustomScreenState();
}

class CalendarCustomScreenState extends CustomScreenState {
  List<CalendarData> calendarData = <CalendarData>[];

  @override
  void onResponse(Response response) {
    super.onResponse(response);
    if (response.responseData != null &&
        response.responseData.dataBooks != null &&
        response.responseData.dataBooks.length > 0) {
      for (int i = 0;
          i < response.responseData.dataBooks[0].records.length;
          i++) {
        calendarData.add(CalendarData.fromJson(
            response.responseData.dataBooks[0].records[i]));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return CalendarCustomWidget(calendarData: this.calendarData);
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
