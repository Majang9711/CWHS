import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:new_cwhs/loding.dart';

class TimeList extends StatefulWidget {
  @override
  _TimeListState createState() => _TimeListState();
}

class _TimeListState extends State<TimeList> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('시간표'),
        elevation: 0,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 10,
            ),
            Card(
              child: ListTile(
                title: Column(
                  children: <Widget>[
                    Text(
                      '오늘의 시간표',
                      style: TextStyle(fontSize: 30, color: Colors.green),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      text,
                      style: TextStyle(fontSize: 30, color: Colors.black),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Card(
              child: ListTile(
                title: Column(
                  children: <Widget>[
                    Text(
                      '내일의 시간표',
                      style: TextStyle(fontSize: 30, color: Colors.green),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      nexttext,
                      style: TextStyle(fontSize: 30, color: Colors.black),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
