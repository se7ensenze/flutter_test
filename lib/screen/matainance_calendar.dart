import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

final Map<DateTime, List> _holidays = {
  DateTime(2019, 1, 1): ['New Year\'s Day'],
  DateTime(2019, 1, 6): ['Epiphany'],
  DateTime(2019, 2, 14): ['Valentine\'s Day'],
  DateTime(2019, 4, 21): ['Easter Sunday'],
  DateTime(2019, 4, 22): ['Easter Monday'],
};

class MaintenanceCalendarPage extends StatefulWidget {
  MaintenanceCalendarPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MaintenanceCalendarPageState createState() =>
      _MaintenanceCalendarPageState();
}

class _MaintenanceCalendarPageState extends State<MaintenanceCalendarPage>
    with TickerProviderStateMixin {
  Map<DateTime, List> _events;
  List _selectedEvents;
  AnimationController _animationController;
  CalendarController _calendarController;

  @override
  void initState() {
    super.initState();
    final _selectedDay = DateTime.now();

    _events = {
      _selectedDay.subtract(Duration(days: 30)): [
        '10:00 AM: ตรวจสอบเครื่องมือวัด X1',
        '12:00 AM: ซ่อมบำรุงเครื่องจักร A',
      ],
      _selectedDay.subtract(Duration(days: 27)): ['10:00 AM: ตรวจสอบเครื่องมือวัด X2'],
      _selectedDay.subtract(Duration(days: 20)): [
        '10:00 AM: ตรวจสอบเครื่องมือวัด X3',
        '12:00 AM: ซ่อมบำรุงเครื่องจักร B',
      ],
      _selectedDay.subtract(Duration(days: 16)): [
        '10:00 AM: ตรวจสอบเครื่องมือวัด X4', 
        '01:00 PM: เข้าอบรมสัมนาการเพิ่มแรงจูงใจให้กับตนเองและผู้อื่น'],
      _selectedDay.subtract(Duration(days: 10)): [
        '10:00 AM: ตรวจสอบเครื่องมือวัด X5',
        '12:00 AM: ซ่อมบังรุงเครื่องจักร C',
        '04:00 PM: ซ้อมอพยบหนีไฟ'
      ],
    };

    _selectedEvents = _events[_selectedDay] ?? [];
    _calendarController = CalendarController();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _calendarController.dispose();
    super.dispose();
  }

  void _onDaySelected(DateTime day, List events) {
    print('CALLBACK: _onDaySelected');
    setState(() {
      _selectedEvents = events;
    });
  }

  void _onVisibleDaysChanged(
      DateTime first, DateTime last, CalendarFormat format) {
    print('CALLBACK: _onVisibleDaysChanged');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          // Switch out 2 lines below to play with TableCalendar's settings
          //-----------------------
          _buildTableCalendar(),
          //_buildTableCalendarWithBuilders(),
          const SizedBox(height: 8.0),
          _buildButtons(),
          const SizedBox(height: 8.0),
          Expanded(child: _buildEventList()),
        ],
      ),
    );
  }

  // Simple TableCalendar configuration (using Styles)
  Widget _buildTableCalendar() {
    return TableCalendar(
      calendarController: _calendarController,
      events: _events,
      holidays: _holidays,
      startingDayOfWeek: StartingDayOfWeek.monday,
      calendarStyle: CalendarStyle(
        selectedColor: Colors.deepOrange[400],
        todayColor: Colors.deepOrange[200],
        markersColor: Colors.brown[700],
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
    );
  }

  // More advanced TableCalendar configuration (using Builders & Styles)
  // Widget _buildTableCalendarWithBuilders() {
  //   return TableCalendar(
  //     locale: 'pl_PL',
  //     calendarController: _calendarController,
  //     events: _events,
  //     holidays: _holidays,
  //     initialCalendarFormat: CalendarFormat.month,
  //     formatAnimation: FormatAnimation.slide,
  //     startingDayOfWeek: StartingDayOfWeek.sunday,
  //     availableGestures: AvailableGestures.all,
  //     availableCalendarFormats: const {
  //       CalendarFormat.month: '',
  //       CalendarFormat.week: '',
  //     },
  //     calendarStyle: CalendarStyle(
  //       outsideDaysVisible: false,
  //       weekendStyle: TextStyle().copyWith(color: Colors.blue[800]),
  //       holidayStyle: TextStyle().copyWith(color: Colors.blue[800]),
  //     ),
  //     daysOfWeekStyle: DaysOfWeekStyle(
  //       weekendStyle: TextStyle().copyWith(color: Colors.blue[600]),
  //     ),
  //     headerStyle: HeaderStyle(
  //       centerHeaderTitle: true,
  //       formatButtonVisible: false,
  //     ),
  //     builders: CalendarBuilders(
  //       selectedDayBuilder: (context, date, _) {
  //         return FadeTransition(
  //           opacity: Tween(begin: 0.0, end: 1.0).animate(_animationController),
  //           child: Container(
  //             margin: const EdgeInsets.all(4.0),
  //             padding: const EdgeInsets.only(top: 5.0, left: 6.0),
  //             color: Colors.deepOrange[300],
  //             width: 100,
  //             height: 100,
  //             child: Text(
  //               '${date.day}',
  //               style: TextStyle().copyWith(fontSize: 16.0),
  //             ),
  //           ),
  //         );
  //       },
  //       todayDayBuilder: (context, date, _) {
  //         return Container(
  //           margin: const EdgeInsets.all(4.0),
  //           padding: const EdgeInsets.only(top: 5.0, left: 6.0),
  //           color: Colors.amber[400],
  //           width: 100,
  //           height: 100,
  //           child: Text(
  //             '${date.day}',
  //             style: TextStyle().copyWith(fontSize: 16.0),
  //           ),
  //         );
  //       },
  //       markersBuilder: (context, date, events, holidays) {
  //         final children = <Widget>[];

  //         if (events.isNotEmpty) {
  //           children.add(
  //             Positioned(
  //               right: 1,
  //               bottom: 1,
  //               child: _buildEventsMarker(date, events),
  //             ),
  //           );
  //         }

  //         if (holidays.isNotEmpty) {
  //           children.add(
  //             Positioned(
  //               right: -2,
  //               top: -2,
  //               child: _buildHolidaysMarker(),
  //             ),
  //           );
  //         }

  //         return children;
  //       },
  //     ),
  //     onDaySelected: (date, events) {
  //       _onDaySelected(date, events);
  //       _animationController.forward(from: 0.0);
  //     },
  //     onVisibleDaysChanged: _onVisibleDaysChanged,
  //   );
  // }

  // Widget _buildEventsMarker(DateTime date, List events) {
  //   return AnimatedContainer(
  //     duration: const Duration(milliseconds: 300),
  //     decoration: BoxDecoration(
  //       shape: BoxShape.rectangle,
  //       color: _calendarController.isSelected(date)
  //           ? Colors.brown[500]
  //           : _calendarController.isToday(date)
  //               ? Colors.brown[300]
  //               : Colors.blue[400],
  //     ),
  //     width: 16.0,
  //     height: 16.0,
  //     child: Center(
  //       child: Text(
  //         '${events.length}',
  //         style: TextStyle().copyWith(
  //           color: Colors.white,
  //           fontSize: 12.0,
  //         ),
  //       ),
  //     ),
  //   );
  // }

  // Widget _buildHolidaysMarker() {
  //   return Icon(
  //     Icons.add_box,
  //     size: 20.0,
  //     color: Colors.blueGrey[800],
  //   );
  // }

  Widget _buildButtons() {
    final dateTime = _events.keys.elementAt(_events.length - 2);

    return Column(
      children: <Widget>[
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            RaisedButton(
              child: Text('Month'),
              onPressed: () {
                setState(() {
                  _calendarController.setCalendarFormat(CalendarFormat.month);
                });
              },
            ),
            RaisedButton(
              child: Text('2 weeks'),
              onPressed: () {
                setState(() {
                  _calendarController
                      .setCalendarFormat(CalendarFormat.twoWeeks);
                });
              },
            ),
            RaisedButton(
              child: Text('Week'),
              onPressed: () {
                setState(() {
                  _calendarController.setCalendarFormat(CalendarFormat.week);
                });
              },
            ),
          ],
        ),
        const SizedBox(height: 8.0),
        RaisedButton(
          child: Text(
              'Set day ${dateTime.day}-${dateTime.month}-${dateTime.year}'),
          onPressed: () {
            _calendarController.setSelectedDay(
              DateTime(dateTime.year, dateTime.month, dateTime.day),
              runCallback: true,
            );
          },
        ),
      ],
    );
  }

  Widget _buildEventList() {
    return ListView(
      children: _selectedEvents
          .map((event) => Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 0.8),
                  borderRadius: BorderRadius.circular(12.0),
                ),
                margin:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                child: ListTile(
                  title: Text(event.toString()),
                  onTap: () => print('$event tapped!'),
                ),
              ))
          .toList(),
    );
  }
}
