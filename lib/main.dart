import 'package:flutter/material.dart';
import 'package:new_cwhs/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      theme: ThemeData(
        primarySwatch: Colors.green,
        // fontFamily: 'Bazzi',
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      title: '철원고등학교',
    );
  }
}
