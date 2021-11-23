import 'package:flutter/material.dart';
import 'package:new_cwhs/timeList.dart';

import 'package:http/http.dart' as http;
import 'package:new_cwhs/home_page.dart';
import 'dart:convert';
import 'dart:async';

int TimeListtCount;
List<String> TimeListt;
String text = "";
String nexttext = "";

class lodingPage extends StatefulWidget {
  @override
  _lodingPageState createState() => _lodingPageState();
}

class _lodingPageState extends State<lodingPage> {
  void time() async {
    text = "";
    String serviceKey = '5212cf68975f47518ee49b37e19ff956';
    String type = 'json';
    String schoolCode = '7800090';
    String date = '20201008';

    String url =
        'https://open.neis.go.kr/hub/hisTimetable?KEY=${serviceKey}&Type=${type}&pIndex=1&pSize=100&ATPT_OFCDC_SC_CODE=K10&SD_SCHUL_CODE=${schoolCode}&GRADE=3&CLRM_NM=4&TI_FROM_YMD=${date}&TI_TO_YMD=${date}';
    var response = await http.get(url);

    var data = jsonDecode(response.body);

    List<dynamic> ddata = data['hisTimetable'];
    Map<String, dynamic> row = ddata[1];
    List<dynamic> rowList = row['row'];
    TimeListtCount = rowList.length;
    TimeListt = List(TimeListtCount);
    setState(() {
      for (int i = 1; i <= TimeListtCount; i++) {
        Map<String, dynamic> item = rowList[i - 1];
        text = text + i.toString() + "교시 " + item['ITRT_CNTNT'] + "\n";
      }
    });
  }

  void nexttime() async {
    nexttext = "";
    DateTime now = new DateTime.now();
    String serviceKey = '5212cf68975f47518ee49b37e19ff956';
    String type = 'json';
    String schoolCode = '7800090';
    String date = '20201009';
    print(now);
    String url =
        'https://open.neis.go.kr/hub/hisTimetable?KEY=${serviceKey}&Type=${type}&pIndex=1&pSize=100&ATPT_OFCDC_SC_CODE=K10&SD_SCHUL_CODE=${schoolCode}&GRADE=3&CLRM_NM=4&TI_FROM_YMD=${date}&TI_TO_YMD=${date}';
    var response = await http.get(url);

    var data = jsonDecode(response.body);

    List<dynamic> ddata = data['hisTimetable'];
    Map<String, dynamic> row = ddata[1];
    List<dynamic> rowList = row['row'];
    TimeListtCount = rowList.length;
    TimeListt = List(TimeListtCount);
    setState(() {
      for (int i = 1; i <= TimeListtCount; i++) {
        Map<String, dynamic> item = rowList[i - 1];
        nexttext = nexttext + i.toString() + "교시 " + item['ITRT_CNTNT'] + "\n";
      }
    });
  }

  @override
  void initState() {
    super.initState();
    time();
    nexttime();
    Timer(
      Duration(seconds: 2),
      () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => TimeList()),
      ),
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('시간표'),
        elevation: 0,
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.fromLTRB(0, 50, 0, 50),
          child: Text(
            '불러오는중..',
            style: TextStyle(
              fontSize: 30,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
