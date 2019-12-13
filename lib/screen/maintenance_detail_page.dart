import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:shopingmall/screen/helper/ui.dart';

class MaintenanceDetail extends StatefulWidget {
  @override
  _MaintenanceDetailState createState() => _MaintenanceDetailState();
  final String _title;
  final String _subTitle;

  MaintenanceDetail(this._title, this._subTitle);
}

class _MaintenanceDetailState extends State<MaintenanceDetail>
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
        child: createForm(),
      ),
    );
  }

  Widget createForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Container(
            padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
            child: Text(widget._title,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0))),
        Container(
          padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
          child: Text(widget._subTitle),
        ),
        Expanded(
          child: ListView(
            padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(10),
                alignment: Alignment.topCenter,
                child: Image.asset("images/example.jpg")),
              Container(
                padding: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text("สถานะ:",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Text("รอการดำเนินการ"),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text("ความเร่งด่วน:",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Text("มากที่สุด",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.red)),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: Text(
                    "อุปกรณ์มีรอยแตกที่บริเวณด้านข้าง และมีสนิทขึ้นมาก ทำให้เครื่องจักรหยุดทำงาน"),
              )
            ],
          ),
        ),
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              MsUiBuilder.createFlatButton(
                  MdiIcons.checkCircle, Colors.greenAccent, "Accept"),
              MsUiBuilder.createFlatButton(
                  MdiIcons.cancel, Colors.redAccent, "Reject")
            ],
          ),
        )
      ],
    );
  }
}
