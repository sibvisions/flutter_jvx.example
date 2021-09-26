import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../screens/calendar_custom_screen.dart';
import 'custom_rounded_button.dart';

class CalendarCustomWidget extends StatefulWidget {
  final List<CalendarData> calendarData;

  const CalendarCustomWidget({Key? key, required this.calendarData})
      : super(key: key);

  @override
  _CalendarCustomWidgetState createState() => _CalendarCustomWidgetState();
}

class _CalendarCustomWidgetState extends State<CalendarCustomWidget> {
  Map<DateTime, List> _events = Map<DateTime, List>();
  List? _selectedEvents;
  AnimationController? _animationController;
  CalendarController? _calendarController;

  @override
  void initState() {
    super.initState();
    final _selectedDay = DateTime.now();
    final List<CalendarData> calendarDataToGroup = widget.calendarData;

    Set<CalendarData> set = Set.from(calendarDataToGroup);
    set.forEach((element) {
      CalendarData currentCalData = element;

      if (!_events.containsKey(
          _selectedDay.add(Duration(days: currentCalData.daysFromToday)))) {
        _events.putIfAbsent(
            _selectedDay.add(Duration(days: currentCalData.daysFromToday)),
            () => [currentCalData.event]);
      } else {
        _events[_selectedDay.add(Duration(days: currentCalData.daysFromToday))]!
            .add(currentCalData.event);
      }
    });

    _selectedEvents = _events[_selectedDay] ?? [];
    _calendarController = CalendarController();
  }

  @override
  void dispose() {
    _animationController?.dispose();
    _calendarController?.dispose();
    super.dispose();
  }

  void _onDaySelected(DateTime day, List events, List other) {
    setState(() {
      _selectedEvents = events;
    });
  }

  void _onVisibleDaysChanged(
      DateTime first, DateTime last, CalendarFormat format) {}

  void _onCalendarCreated(
      DateTime first, DateTime last, CalendarFormat format) {}

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        _buildTableCalendar(),
        const SizedBox(height: 8.0),
        _buildButtons(),
        const SizedBox(height: 8.0),
        Text('Events:',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            )),
        const SizedBox(height: 8.0),
        Expanded(child: _buildEventList()),
      ],
    );
  }

  // Simple TableCalendar configuration (using Styles)
  Widget _buildTableCalendar() {
    return TableCalendar(
      rowHeight: 60,
      calendarController: _calendarController,
      events: _events,
      startingDayOfWeek: StartingDayOfWeek.monday,
      calendarStyle: CalendarStyle(
        selectedColor: Theme.of(context).primaryColor,
        todayColor: Colors.deepOrange[200],
        markersColor: Colors.deepOrange[700],
        outsideDaysVisible: false,
      ),
      headerStyle: HeaderStyle(
        formatButtonTextStyle:
            TextStyle().copyWith(color: Colors.white, fontSize: 15.0),
        formatButtonDecoration: BoxDecoration(
          color: Colors.deepOrange[400],
          borderRadius: BorderRadius.circular(16.0),
        ),
      ),
      onDaySelected: _onDaySelected,
      onVisibleDaysChanged: _onVisibleDaysChanged,
      onCalendarCreated: _onCalendarCreated,
    );
  }

  void _setCalendarFormat(CalendarFormat calFormat) {
    setState(() {
      _calendarController!.setCalendarFormat(calFormat);
    });
  }

  Widget _buildButtons() {
    final dateTime = _events.keys.elementAt(_events.length - 2);

    return Column(
      children: <Widget>[
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            CustomRoundedButton(
                "Month",
                Icon(FontAwesomeIcons.calendar, color: Colors.white),
                () => _setCalendarFormat(CalendarFormat.month)),
            CustomRoundedButton(
                "Week",
                Icon(FontAwesomeIcons.calendarWeek, color: Colors.white),
                () => _setCalendarFormat(CalendarFormat.week)),
          ],
        ),
      ],
    );
  }

  Widget _buildEventList() {
    return ListView(
      children: _selectedEvents!
          .map((event) => Card(
                color: Colors.orange[100],
                margin:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                child: ListTile(
                  leading: Icon(FontAwesomeIcons.clock),
                  title: Text(event.toString()),
                  onTap: () => print('$event tapped!'),
                ),
              ))
          .toList(),
    );
  }
}
