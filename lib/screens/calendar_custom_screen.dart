import 'package:flutter/material.dart';
import 'package:flutterclient/flutterclient.dart';
import '../widgets/calendar_custom_widget.dart';

class CalendarCustomScreen extends CustomScreen {
  CalendarCustomScreen(
      {Key? key,
      required SoScreenConfiguration configuration,
      required SoComponentCreator creator})
      : super(key: key, configuration: configuration, creator: creator);

  @override
  CalendarCustomScreenState createState() => CalendarCustomScreenState();
}

class CalendarCustomScreenState extends CustomScreenState {
  List<CalendarData> calendarData = <CalendarData>[];

  @override
  void onState(ApiState? state) {
    super.onState(state);
    if (state != null && state is ApiResponse && mounted) {
      // Updating the data objects
      if (state.hasDataBook) {
        // toDo set dataProvider
        DataBook? dataBook = state.getDataBookByProvider('');
        if (dataBook != null) {
          for (int i = 0; i < dataBook.records.length; i++) {
            calendarData.add(CalendarData.fromJson(dataBook.records[i]));
          }
        }
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
