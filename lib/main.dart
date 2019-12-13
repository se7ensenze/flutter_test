import 'package:flutter/material.dart';
import 'package:shopingmall/screen/home.dart';
import 'package:intl/date_symbol_data_local.dart';

// void main() => runApp(MyApp());
void main(){
  initializeDateFormatting().then((_) => runApp(MyApp()));
}

/// This Widget is the main application widget.
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:Scaffold(
        body: Home(),
      ),
    );
  }
}