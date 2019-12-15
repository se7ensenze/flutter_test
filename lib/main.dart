import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:shopingmall/screen/login_page.dart';

// void main() => runApp(MyApp());
void main() {
  initializeDateFormatting().then((_) => runApp(MyApp()));
}

/// This Widget is the main application widget.
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
//check token first then select LoginPage or Home Page

    return MaterialApp(
      home: Scaffold(
        body: LoginPage(),
      ),
    );
  }
}
