import 'package:flutter/material.dart';
import 'package:login_ui/constants.dart';
import 'package:login_ui/login.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
          textSelectionTheme: TextSelectionThemeData(
              cursorColor: Colors.white, selectionHandleColor: Colors.white),
          textTheme: TextTheme(bodyText2: TextStyle(color: Constants.white))),
      home: Login(),
    );
  }
}
