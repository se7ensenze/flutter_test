import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:shopingmall/screen/helper/ui.dart';

class RequestDetailPage extends StatefulWidget {
  @override
  _RequestDetailPageState createState() => _RequestDetailPageState();
}

class _RequestDetailPageState extends State<RequestDetailPage>
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
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(20),
                  child: Text(
                    "แจ้งซ่อม",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  height: 200,
                  child: Image(
                    image: AssetImage("images/default_image.jpg"),
                  ),
                ),
                Row(
                  children: <Widget>[
                    Icon(MdiIcons.camera, size: 64),
                    Text("ถ่ายภาพประกอบ")
                  ],
                ),
                Container(
                  margin: EdgeInsets.all(8.0),
                  // hack textfield height
                  padding: EdgeInsets.only(bottom: 10.0),
                  child: TextField(
                    maxLines: 8,
                    decoration: InputDecoration(
                      hintText: "รายละเอียดการแจ้งซ่อม",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10.0),
                  child: createDropDownImportantNote(context),
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      MsUiBuilder.createFlatButton(
                          Icons.send, Colors.green.shade400, "ส่งใบแจ้งซ่อม"),
                      MsUiBuilder.createFlatButton(
                          Icons.cancel, Colors.red.shade400, "ยกเลิก")
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }

  String dropdownValue = 'ต้องการทันที';

  Widget createDropDownImportantNote(BuildContext context) {
    return DropdownButton<String>(
        value: dropdownValue,
        icon: Icon(Icons.arrow_downward),
        iconSize: 24,
        elevation: 16,
        style: TextStyle(color: Colors.deepPurple),
        underline: Container(
          height: 2,
          color: Colors.deepPurpleAccent,
        ),
        onChanged: (String newValue) {
          setState(() {
            dropdownValue = newValue;
          });
        },
        items: <String>[
          'ต้องการทันที',
          'ต้องการภายใน 1-2 ชม.',
          'ต้องการภายใน 24ชม.',
          'ต้องการภายใน 2 วัน'
        ].map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList());
  }
}
