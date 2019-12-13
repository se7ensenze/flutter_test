import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:shopingmall/screen/request_page.dart';
import 'helper/ui.dart';
import 'license_list_page.dart';
import 'maintenance_list_page.dart';
import 'matainance_calendar.dart';
import 'notification_list_page.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          //  backgroundColor: Colors.white,
          leading: Padding(
            padding: EdgeInsets.only(left: 12),
            child: IconButton(
              icon: Icon(Icons.menu),
              onPressed: null,
            ),
          ),
          title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('MenuSmart'),
              ]),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.star),
              onPressed: null,
            ),
          ],
        ),
        body: SafeArea(
          child: Container(
            padding: EdgeInsets.only(top: 20),
            child: Column(mainAxisSize: MainAxisSize.max, children: <Widget>[
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    MsUiBuilder.createFlatButton(
                        MdiIcons.chatOutline, Colors.grey, "Notification",
                        notificationCount: 5, onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => NotificationListPage()));
                    }),
                    MsUiBuilder.createFlatButton(
                        MdiIcons.calendar, Colors.blueAccent, "Calendar",
                        onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MaintenanceCalendarPage(
                                    title: 'ManuSmart Calendar',
                                  )));
                    }),
                    MsUiBuilder.createFlatButton(
                        MdiIcons.certificate, Colors.orangeAccent, "License",
                        onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LicenseListPage()));
                    })
                  ]),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    MsUiBuilder.createFlatButton(
                        MdiIcons.qrcodeScan, Colors.black, "Request",
                        onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RequestMantenance()));
                    }),
                    MsUiBuilder.createFlatButton(
                        MdiIcons.tools, Colors.greenAccent, "Maintenance",
                        notificationCount: 4, onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Maintenance()),
                      );
                    }),
                    MsUiBuilder.createFlatButton(
                        MdiIcons.settings, Colors.grey, "Settings")
                  ]),
            ]),
          ),
        ));
  }
}
