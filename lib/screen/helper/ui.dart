import 'package:flutter/material.dart';

class MsUiBuilder {

  static PreferredSizeWidget simpleAppBar(BuildContext context)
  {
    return AppBar(
          //  backgroundColor: Colors.white,
          leading: Padding(
            padding: EdgeInsets.only(left: 12),
            child: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('ManuSmart'),
              ]),
              actions: <Widget>[
                IconButton(icon: Icon(Icons.star), onPressed: null,)
              ],
        );
  }

  static Widget createFlatButton(
      IconData iconData, Color iconColor, String text,
      {int notificationCount = 0, Function onPressed}) {
    var stack = Stack(
      children: <Widget>[
        new Icon(
          iconData,
          size: 64.0,
          color: iconColor,
        ),
      ],
    );
    if (notificationCount > 0) {
      stack.children.add(new Positioned(
        right: 0,
        child: new Container(
          padding: EdgeInsets.all(1),
          decoration: new BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(6),
          ),
          constraints: BoxConstraints(
            minWidth: 20,
            minHeight: 20,
          ),
          child: new Text(
            notificationCount.toString(),
            style: new TextStyle(
              color: Colors.white,
              fontSize: 14,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ));
    }

    return FlatButton(
      onPressed: onPressed,
      padding: EdgeInsets.all(10.0),
      child: Column(
        // Replace with a Row for horizontal icon + text
        children: <Widget>[stack, Text(text)],
      ),
    );
  }
}
