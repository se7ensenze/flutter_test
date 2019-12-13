import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:shopingmall/screen/helper/ui.dart';

import 'license_detail_page.dart';

class LicenseListPage extends StatefulWidget {
  @override
  _LicenseListPageState createState() => _LicenseListPageState();
}

class _LicenseListPageState extends State<LicenseListPage>
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
                builder: (context) => LicenseDetailPage(title, requestTime,
                    content, importanceLevel, importanceColor)));
      },
    ));
  }

  Widget createBody() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[createUserCard(), createListView()],
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
          )
        ],
      ),
    );
  }

  Widget createListView() {
    return Expanded(
      child: ListView(
        children: <Widget>[
          createListViewItem(
              "License: Alarm Management for Beginner",
              "Date: 2019-12-10 10:37 AM",
              "ใบอนุญาตสำหรับการจัดการ Alarm สำหรับผู้เริ่มต้น",
              importanceLevel: "จะหมดอายุในอีก 3 สัปดาห์",
              importanceColor: Colors.blue),
          createListViewItem(
              "License: How to calibrate measurement tools",
              "Date: 2019-12-10 11:22 AM",
              "ใบอนุญาติสำหรับการปรับจูนเครื่องมือวัด",
              importanceLevel: "จะหมดอายุในอีก 7 วัน",
              importanceColor: Colors.red),
          createListViewItem(
              "License: How to manage Six Big Losses in Manufacturing",
              "Date: 2019-12-10 12:12 AM",
              "Certificate สำหรับการจัดการกับสิ่งที่เราเรียกว่า Six Big Losses เพื่อเพิ่ม Productivity ในโรงงาน",
              importanceLevel: "จะถึงเวลาสอบในอีก 3 เดือน",
              importanceColor: Colors.green),
        ],
      ),
    );
  }
}
