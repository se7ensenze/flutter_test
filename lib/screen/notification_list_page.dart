import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:shopingmall/screen/helper/ui.dart';

class NotificationListPage extends StatefulWidget {
  @override
  _NotificationListPageState createState() => _NotificationListPageState();
}

class _NotificationListPageState extends State<NotificationListPage>
    with SingleTickerProviderStateMixin {
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
    return Scaffold(
        appBar: MsUiBuilder.simpleAppBar(context),
        body: SafeArea(
          child: createBody(),
        ));
  }

  Widget createBody() {
    return Container(
        padding: EdgeInsets.all(20),
        child: ListView(
          children: <Widget>[
            Card(
              child: ListTile(
                leading: Icon(
                  MdiIcons.certificate,
                  color: Colors.yellow,
                ),
                title: Text(
                  "Licensing",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("คุณจะต้องทำการสอบการใช้งานเครื่องจักร A เบื้องต้น"),
                    Text("ระยะเวลาที่เหลือ 3 เดือน")
                  ],
                ),
              ),
            ),
            Card(
              child: ListTile(
                leading: Icon(MdiIcons.certificate, color: Colors.yellow),
                title: Text(
                  "Licensing",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("คุณจะต้องทำการสอบวัดระดับค่าสายตาประจำปี"),
                    Text("ระยะเวลาที่เหลือ 1 เดือน")
                  ],
                ),
              ),
            ),
            Card(
              child: ListTile(
                leading: Icon(MdiIcons.certificate, color: Colors.yellow),
                title: Text(
                  "Licensing",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("ใบอนุญาขับขี่ของคุณใกล้หมดอายุ"),
                    Text("ระยะเวลาที่เหลือ 3 สัปดาห์")
                  ],
                ),
              ),
            ),
            Card(
              child: ListTile(
                leading: Icon(MdiIcons.tools, color: Colors.blue),
                title: Text(
                  "Request PM",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("รายการแจ้งซ่อมที่ 1 ดำเนินการแล้ว"),
                    Text("เมื่อเวลา 2019-12-10 16:38 PM"),
                  ],
                ),
              ),
            ),
            Card(
              child: ListTile(
                leading: Icon(MdiIcons.tools, color: Colors.blue),
                title: Text(
                  "Request PM",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("รายการแจ้งซ่อมที่ 1 เสร็จสิ้นแล้ว"),
                    Text("เมื่อเวลา 2019-12-10 16:55 PM"),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
