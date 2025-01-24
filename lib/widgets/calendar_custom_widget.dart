import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_jvx/flutter_jvx.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:table_calendar/table_calendar.dart';

import 'custom_rounded_button.dart';

class CalendarCustomWidget extends StatefulWidget {
  const CalendarCustomWidget({super.key});

  @override
  State<CalendarCustomWidget> createState() => _CalendarCustomWidgetState();
}

class _CalendarCustomWidgetState extends State<CalendarCustomWidget> {
  static const String CONTACT_DATA_PROVIDER = "JVxMobileDemo/Cal-7V/contacts#+";
  static const String COLUMN_NAME_EVENT = "EVENT";
  static const String COLUMN_NAME_DAYS_FROM_TODAY = "DAYS_FROM_TODAY";

  final Map<int, List<String>> _events = {};
  DateTime _focusedDay = _getCurrentDay();
  DateTime _selectedDay = _getCurrentDay();
  List<String> _selectedEvents = [];

  CalendarFormat _calendarFormat = CalendarFormat.month;

  static DateTime _getCurrentDay() {
    DateTime now = DateTime.now().toUtc();
    DateTime currentDay = DateTime.utc(now.year, now.month, now.day);
    return currentDay;
  }

  @override
  void initState() {
    super.initState();
    IUiService().registerDataSubscription(
      pDataSubscription: DataSubscription(
        subbedObj: this,
        dataProvider: CONTACT_DATA_PROVIDER,
        from: 0,
        dataColumns: [COLUMN_NAME_EVENT, COLUMN_NAME_DAYS_FROM_TODAY],
        onDataChunk: (DataChunk dataChunk) {
          _events.clear();
          DateTime currentDay = _getCurrentDay();
          for (int i = 0; i < dataChunk.data.length; i++) {
            String event = dataChunk.data[i]![0];
            int daysFromToday = dataChunk.data[i]![1];

            var dateTime = currentDay.add(Duration(days: daysFromToday)).millisecondsSinceEpoch;
            if (!_events.containsKey(dateTime)) {
              _events.putIfAbsent(dateTime, () => [event]);
            } else {
              _events[dateTime]!.add(event);
            }
          }
          _selectedEvents = _events[currentDay.millisecondsSinceEpoch] ?? [];
          setState(() {});
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        _buildTableCalendar(),
        const SizedBox(height: 8.0),
        SizedBox(
          height: 80,
          child: _buildButtons(),
        ),
        const SizedBox(height: 8.0),
        const Text("Events:",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            )),
        const SizedBox(height: 8.0),
        Expanded(child: _buildEventList()),
      ],
    );
  }

  @override
  void dispose() {
    IUiService().disposeDataSubscription(pSubscriber: this);
    super.dispose();
  }

  /// Simple TableCalendar configuration (using Styles)
  Widget _buildTableCalendar() {
    return TableCalendar<String>(
      rowHeight: 60,
      firstDay: DateTime.utc(DateTime.now().year - 20, 1, 1),
      lastDay: DateTime.utc(DateTime.now().year + 20, 12, 31),
      focusedDay: _focusedDay,
      eventLoader: (DateTime day) => _events[day.millisecondsSinceEpoch] ?? [],
      startingDayOfWeek: StartingDayOfWeek.monday,
      calendarStyle: CalendarStyle(
        rangeHighlightColor: Theme.of(context).colorScheme.primary,
        todayTextStyle: TextStyle(color: Colors.deepOrange[200]),
        markerDecoration: BoxDecoration(color: Colors.deepOrange[700]),
        outsideDaysVisible: false,
      ),
      headerStyle: HeaderStyle(
        formatButtonTextStyle: const TextStyle().copyWith(color: Colors.white, fontSize: 15.0),
        formatButtonDecoration: BoxDecoration(
          color: Colors.deepOrange[400],
          borderRadius: BorderRadius.circular(16.0),
        ),
      ),
      calendarFormat: _calendarFormat,
      onFormatChanged: (format) => _setCalendarFormat(format),
      onPageChanged: (focusedDay) {
        _focusedDay = focusedDay;
      },
      selectedDayPredicate: (day) {
        return isSameDay(_selectedDay, day);
      },
      onDaySelected: (selectedDay, focusedDay) {
        if (!isSameDay(_selectedDay, selectedDay)) {
          setState(() {
            _focusedDay = focusedDay;
            _selectedDay = selectedDay;
            _selectedEvents = _events[_selectedDay.millisecondsSinceEpoch] ?? [];
          });
        }
      },
    );
  }

  void _setCalendarFormat(CalendarFormat format) {
    _calendarFormat = format;
    setState(() {});
  }

  Widget _buildButtons() {
    // final dateTime = _events.keys.elementAt(_events.length - 2);
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          child: CustomRoundedButton(
            text: const Text("Month"),
            icon: const Icon(FontAwesomeIcons.calendar),
            onTap: () => _setCalendarFormat(CalendarFormat.month),
          ),
        ),
        Expanded(
          child: CustomRoundedButton(
            text: const Text("Week"),
            icon: const Icon(FontAwesomeIcons.calendarWeek),
            onTap: () => _setCalendarFormat(CalendarFormat.week),
          ),
        ),
      ],
    );
  }

  Widget _buildEventList() {
    return ListView(
      children: _selectedEvents
          .map((event) => Card(
                color: Colors.orange[100],
                margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                child: ListTile(
                  leading: const Icon(FontAwesomeIcons.clock),
                  title: Text(event.toString()),
                  onTap: () => log("$event tapped!"),
                ),
              ))
          .toList(),
    );
  }
}
