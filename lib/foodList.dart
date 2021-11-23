import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:math';

class FoodList extends StatefulWidget {
  @override
  _FoodListState createState() => _FoodListState();
}

class _FoodListState extends State<FoodList> {
  String l_foodList = "오늘은 중식이 없습니다.";
  String m_foodList = "오늘은 조식이 없습니다.";
  String d_foodList = "오늘은 석식이 없습니다.";

  void food() async {
    String serviceKey = '5212cf68975f47518ee49b37e19ff956';
    String type = 'json';
    String schoolCode = '7800090';
    String date = '20201109';
    List<String> typeTime = [
      '1', //조식
      '2', //중식
      '3' //석식
    ];

    //중식
    String lunch_url =
        'https://open.neis.go.kr/hub/mealServiceDietInfo?KEY=${serviceKey}&Type=${type}&pIndex=1&pSize=100&ATPT_OFCDC_SC_CODE=K10&SD_SCHUL_CODE=${schoolCode}&MMEAL_SC_CODE=${typeTime[1]}&MLSV_YMD=${date}';
    var response = await http.get(lunch_url);

    if (response.body.contains('mealServiceDietInfo') == true) {
      var data = jsonDecode(response.body);
      List<dynamic> ddata = data['mealServiceDietInfo'];
      Map<String, dynamic> item = ddata[1];
      List<dynamic> ittem = item['row'];
      Map<String, dynamic> manuList = ittem[0];
      setState(() {
        l_foodList = manuList['DDISH_NM'];
      });
    }

    //조식
    String morniing_url =
        'https://open.neis.go.kr/hub/mealServiceDietInfo?KEY=${serviceKey}&Type=${type}&pIndex=1&pSize=100&ATPT_OFCDC_SC_CODE=K10&SD_SCHUL_CODE=${schoolCode}&MMEAL_SC_CODE=${typeTime[0]}&MLSV_YMD=${date}';
    var m_response = await http.get(morniing_url);

    if (m_response.body.contains('mealServiceDietInfo') == true) {
      var m_data = jsonDecode(m_response.body);
      List<dynamic> m_ddata = m_data['mealServiceDietInfo'];
      Map<String, dynamic> m_item = m_ddata[1];
      List<dynamic> m_ittem = m_item['row'];
      Map<String, dynamic> m_manuList = m_ittem[0];
      setState(() {
        m_foodList = m_manuList['DDISH_NM'];
      });
      print(DateTime.now());
    }

    //석식
    String diner_url =
        'https://open.neis.go.kr/hub/mealServiceDietInfo?KEY=${serviceKey}&Type=${type}&pIndex=1&pSize=100&ATPT_OFCDC_SC_CODE=K10&SD_SCHUL_CODE=${schoolCode}&MMEAL_SC_CODE=${typeTime[2]}&MLSV_YMD=${date}';
    var d_response = await http.get(diner_url);

    if (d_response.body.contains('mealServiceDietInfo') == true) {
      var d_data = jsonDecode(d_response.body);
      List<dynamic> d_ddata = d_data['mealServiceDietInfo'];
      Map<String, dynamic> d_item = d_ddata[1];
      List<dynamic> d_ittem = d_item['row'];
      Map<String, dynamic> d_manuList = d_ittem[0];
      setState(() {
        d_foodList = d_manuList['DDISH_NM'];
      });
    }
  }

  @override
  void initState() {
    super.initState();
    food();
  }

  @override
  Widget build(BuildContext context) {
    String _m_foodListView = m_foodList.replaceAll('<br/>', '\n- ');
    String _l_foodListView = l_foodList.replaceAll('<br/>', '\n- ');
    String _d_foodListView = d_foodList.replaceAll('<br/>', '\n- ');

    for (int i = 0; i <= 10; i++) {
      _m_foodListView = _m_foodListView.replaceAll(i.toString(), '');
      _l_foodListView = _l_foodListView.replaceAll(i.toString(), '');
      _d_foodListView = _d_foodListView.replaceAll(i.toString(), '');
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('급식'),
        elevation: 0,
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            Card(
              child: ListTile(
                title: Column(
                  children: <Widget>[
                    Text(
                      '조식',
                      style: TextStyle(fontSize: 40, color: Colors.green),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      '- ' + _m_foodListView,
                      style: TextStyle(fontSize: 25),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Card(
              child: ListTile(
                title: Column(
                  children: <Widget>[
                    Text(
                      '중식',
                      style: TextStyle(fontSize: 40, color: Colors.green),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      '- ' + _l_foodListView,
                      style: TextStyle(fontSize: 25),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Card(
              child: ListTile(
                title: Column(
                  children: <Widget>[
                    Text(
                      '석식',
                      style: TextStyle(fontSize: 40, color: Colors.green),
                    ),
                    SizedBox(
                      height: 10,
                      width: 10,
                    ),
                    Text(
                      '- ' + _d_foodListView,
                      style: TextStyle(fontSize: 25),
                    ),
                    SizedBox(
                      height: 10,
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
