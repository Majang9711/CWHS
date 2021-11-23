import 'package:flutter/material.dart';
import 'package:new_cwhs/timeList.dart';
import 'package:new_cwhs/foodList.dart';
import 'package:new_cwhs/mysetting.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:new_cwhs/loding.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> ImagesList = [
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTI2c7QfmDSyMdzugD_z5nzHCORhvnVqiT14w&usqp=CAU",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTI2c7QfmDSyMdzugD_z5nzHCORhvnVqiT14w&usqp=CAU",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTI2c7QfmDSyMdzugD_z5nzHCORhvnVqiT14w&usqp=CAU",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '철원고등학교',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Card(
              child: new Swiper(
                autoplay: true,
                itemBuilder: (BuildContext context, int index) {
                  return new Image.network(
                    ImagesList[index],
                    fit: BoxFit.fill,
                  );
                },
                itemCount: ImagesList.length,
                itemWidth: 300.0,
                itemHeight: 300.0,
                layout: SwiperLayout.STACK,
              ),
            ),
            Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(25, 10, 20, 10),
                  child: Column(
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.settings_applications_rounded),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (content) => MySetting(),
                            ),
                          );
                        },
                        iconSize: 70,
                        color: Colors.green[400],
                      ),
                      Text('내설정'),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(30, 10, 20, 10),
                  child: Column(
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.food_bank_rounded),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => FoodList(),
                            ),
                          );
                        },
                        iconSize: 70,
                        color: Colors.green[400],
                      ),
                      Text('급식'),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(30, 10, 20, 10),
                  child: Column(
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.calendar_today_rounded),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => lodingPage(),
                            ),
                          );
                        },
                        iconSize: 70,
                        color: Colors.green[400],
                      ),
                      Text('시간표'),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(25, 10, 20, 10),
                  child: Column(
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.home),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (content) => MySetting(),
                            ),
                          );
                        },
                        iconSize: 70,
                        color: Colors.grey,
                      ),
                      Text('학교 홈페이지'),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(30, 10, 20, 10),
                  child: Column(
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.medical_services),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => FoodList(),
                            ),
                          );
                        },
                        iconSize: 70,
                        color: Colors.pink[300],
                      ),
                      Text('자가진단'),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(30, 10, 20, 10),
                  child: Column(
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.chat),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => lodingPage(),
                            ),
                          );
                        },
                        iconSize: 70,
                        color: Colors.green[400],
                      ),
                      Text('커뮤니티'),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
