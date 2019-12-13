import 'package:flutter/material.dart';
import 'package:shopingmall/screen/helper/ui.dart';

class LicenseDetailPage extends StatefulWidget {
  @override
  _LicenseDetailPageState createState() => _LicenseDetailPageState();
  final String _title;
  final String _requestTime;
  final String _content;
  final String _importanceLevel;
  final Color _importanceColor;

  LicenseDetailPage(this._title, this._requestTime, this._content,
      this._importanceLevel, this._importanceColor);
}

class _LicenseDetailPageState extends State<LicenseDetailPage>
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
        Expanded(
          child: ListView(
            padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(widget._requestTime, style: TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(widget._importanceLevel,
                      style: TextStyle(fontWeight: FontWeight.bold, color: widget._importanceColor)),
                ],
              ),
              Text(
                  widget._content)
            ],
          ),
        ),
      ],
    );
  }
}
