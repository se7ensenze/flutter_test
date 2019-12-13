import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'helper/ui.dart';

class RequestMantenance extends StatefulWidget {
  @override
  _RequestMantenanceState createState() => _RequestMantenanceState();
}

class _RequestMantenanceState extends State<RequestMantenance>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  String barcode = "";

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
      padding: EdgeInsets.only(top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
              padding: EdgeInsets.only(left: 10, bottom: 10),
              child: Text(
                "Please selecte method to request",
                style: TextStyle(fontSize: 20.0),
              )),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                MsUiBuilder.createFlatButton(
                    MdiIcons.qrcodeScan, Colors.black, "Scan QR",
                    onPressed: () {
                  scan();
                }),
                MsUiBuilder.createFlatButton(
                    MdiIcons.searchWeb, Colors.blue, "Search"),
              ],
            ),
          ),
          Card(
            child: Container(
              padding: EdgeInsets.all(10),
              alignment: Alignment.center,
              child: Text(
                this.barcode,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          )
        ],
      ),
    );
  }

  Future scan() async {
    try {
      String getBarcode =
          await FlutterBarcodeScanner.scanBarcode('#004297', 'Cancel', true);

      //query thing here

      setState(() {
        this.barcode = 'Machine-01';
      });
    } catch (e) {
      setState(() {
        this.barcode = "Unknow error: $e";
      });
    }
  }
}
