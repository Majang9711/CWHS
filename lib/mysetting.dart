import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MySetting extends StatefulWidget {
  @override
  _MySettingState createState() => _MySettingState();
}

class _MySettingState extends State<MySetting> {
  String Key_SchoolGrade_Value = 'C';
  String Key_SchoolClass_Value = 'D';

  String SchoolGrade_Value = '학년을 선택해주세요.';
  String SchoolClass_Value = '반을 선택해주세요.';

  final _ChoiceHightGrade = <String>[
    '학년을 선택해주세요.',
    '1학년',
    '2학년',
    '3학년',
  ];

  final _ChoiceHightClass = <String>[
    '반을 선택해주세요.',
    '1반',
    '2반',
    '3반',
    '4반',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: Text('내설정 - 학년과 반을 선택 해주세요.'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                padding: const EdgeInsets.only(left: 20.0, right: 10.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    color: Colors.grey[200],
                    border: Border.all(width: 1)),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    //학년선택
                    value: SchoolGrade_Value,
                    iconSize: 50,
                    style: TextStyle(color: Colors.black, fontSize: 25),
                    underline: Container(
                      height: 1,
                      color: Colors.grey,
                    ),
                    onChanged: (String newValue) {
                      setState(() {
                        SchoolGrade_Value = newValue;
                        setStringPreferences(Key_SchoolGrade_Value, newValue);
                      });
                    },
                    items: _ChoiceHightGrade.map<DropdownMenuItem<String>>(
                        (String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                padding: const EdgeInsets.only(left: 40.0, right: 10.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    color: Colors.grey[200],
                    border: Border.all(width: 1)),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    //반 선택
                    value: SchoolClass_Value,
                    iconSize: 50,
                    style: TextStyle(color: Colors.black, fontSize: 25),
                    underline: Container(
                      height: 1,
                      color: Colors.grey,
                    ),
                    onChanged: (String newValue) {
                      setState(() {
                        SchoolClass_Value = newValue;
                        setStringPreferences(Key_SchoolClass_Value, newValue);
                      });
                    },
                    items: _ChoiceHightClass.map<DropdownMenuItem<String>>(
                        (String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 20, 0, 10),
              child: Text(
                '# 한번 설정한 정보는 다시 바꾸지 않는 이상 유지됩니다.',
                style: TextStyle(color: Colors.black),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 500, 0, 10),
              child: RaisedButton(
                onPressed: (){
                  Navigator.pop(context);
                },
                color: Colors.green,
                elevation: 0,
                child: Text(
                  '확인',
                  style: TextStyle(
                    color: Colors.white
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  setStringPreferences(String key, String cont) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, cont);
    getStringPreferences(key);
  }

  getStringPreferences(String key) async {
    final prefs = await SharedPreferences.getInstance();
    final myString = prefs.getString(key) ?? '';
    print('$key : $myString');
  }
}
