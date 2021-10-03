import 'package:flutter/material.dart';
import 'package:flutterclient/flutterclient.dart';
import '../widgets/calendar_custom_widget.dart';

const String CONTACT_DATAPROVIDER = "JVxMobileDemo/Cal-7V/contacts#+";
const String COLUMNAME_EVENT = "EVENT";
const String COLUMNAME_DAYS_FROM_TODAY = "DAYS_FROM_TODAY";

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
        DataBook? dataBook = state.getDataBookByProvider(CONTACT_DATAPROVIDER);
        if (dataBook != null) {
          for (int i = 0; i < dataBook.records.length; i++) {
            calendarData.add(CalendarData(dataBook.getValue(COLUMNAME_EVENT, i),
                dataBook.getValue(COLUMNAME_DAYS_FROM_TODAY, i)));
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
}
