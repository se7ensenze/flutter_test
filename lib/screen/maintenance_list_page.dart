import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:shopingmall/screen/helper/ui.dart';

import 'maintenance_detail_page.dart';

class Maintenance extends StatefulWidget {
  @override
  _MaintenanceState createState() => _MaintenanceState();
}

class _MaintenanceState extends State<Maintenance>
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
    return new Scaffold(
        appBar: MsUiBuilder.simpleAppBar(context), body: createBody());
  }

  Widget createListViewItem(String title, String requestTime, String content,
      {String importanceLevel = "", Color importanceColor = Colors.red}) {
    var titleWidget =
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
      Text(
        title,
        style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
      ),
      Text(
        requestTime,
        style: TextStyle(fontSize: 12, color: Colors.black54),
      ),
    ]);

    if (importanceLevel != "") {
      titleWidget.children.add(Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Text("ความเร่งด่วน:",
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
          Text(importanceLevel,
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: importanceColor)),
        ],
      ));
    }
    return Card(
      child: ListTile(
        title: titleWidget,
        subtitle: Text(content),
        trailing: Icon(MdiIcons.magnify),
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => MaintenanceDetail(title, requestTime)));
        },
      ),
    );
  }

  Widget createBody() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        createUserCard(),
        createScoreboard(),
        createListView()
      ],
    );
  }

  Widget createUserCard() {
    return Container(
      height: 160,
      color: Colors.blue,
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            Icons.person,
            size: 80.0,
            color: Colors.white,
          ),
          Text(
            "Mr.Manu Smart",
            style: TextStyle(fontSize: 20),
          ),
        ],
      ),
    );
  }

  Widget createScoreboard() {
    return Card(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("จำนวนที่แก้ไขได้ในสัปดาห์ที่ผ่านมา: 24"),
            Text("จำนวนที่แก้ไขได้ในสัปดาห์ที่ปัจจุบัน: 13"),
            Text("จำนวนที่แก้ไขในวันนี้: 2"),
          ],
        ),
      ),
    );
  }

  Widget createListView() {
    return Expanded(
      child: ListView(
        children: <Widget>[
          createListViewItem(
              "ใบแจ้งซ่อม ที่ 1: TO-191210-001",
              "Date: 2019-12-10 10:37 AM",
              "อุปกรณ์มีรอยแตกที่บริเวณด้านข้าง และมีสนิทขึ้นมาก ...",
              importanceLevel: "ต้องการทันที"),
          createListViewItem(
              "ใบแจ้งซ่อม ที่ 2: TO-191210-002",
              "Date: 2019-12-10 11:22 AM",
              "มีงานเสียจากการผลิตเยอะจนผิดสังเกตุ",
              importanceLevel: "ต้องการภายใน 1-2 ชม.",
              importanceColor: Colors.orangeAccent),
          createListViewItem(
              "ใบแจ้งซ่อม ที่ 3: TO-191210-003",
              "Date: 2019-12-10 12:12 AM",
              "มีเสียงดังผลิตปกติขณะเครื่องจักรทำงาน",
              importanceLevel: "ต้องการภายใน 1-2 ชม.",
              importanceColor: Colors.orangeAccent),
          createListViewItem(
              "ใบแจ้งซ่อม ที่ 4: TO-191210-003",
              "Date: 2019-12-10 01:12 PM",
              "ยังไม่ได้ทำการตรวจสอบเครื่องจักรรายวัน",
              importanceLevel: "ต้องการภายในวันนี้",
              importanceColor: Colors.blue),
        ],
      ),
    );
  }
}
