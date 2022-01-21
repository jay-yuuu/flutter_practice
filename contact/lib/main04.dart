import 'dart:html';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Test App from Jey!',
      theme: ThemeData(

          primaryColor: Colors.white,
          textTheme: TextTheme(
            bodyText1: TextStyle(color: Colors.grey),
            bodyText2: TextStyle(color: Colors.grey),
          ),
      ),
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Colors.white,
          toolbarTextStyle: TextStyle(color: Colors.grey),
          titleTextStyle: TextStyle(color: Colors.grey),
          leading: IconButton(icon: Icon(Icons.expand_more, color: Colors.grey), onPressed: (){},),
          title: Text('금호동3가'),
          actions: [
            IconButton(icon: Icon(Icons.search, color: Colors.grey), onPressed: (){}),
            IconButton(icon: Icon(Icons.list, color: Colors.grey), onPressed: (){}),
            IconButton(icon: Icon(Icons.notifications, color: Colors.grey), onPressed: (){}),
          ]
        ),
        body: Container(
          margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
          padding: EdgeInsets.all(10),
          width: 500,
          height: 150,
          child: Row(
            children: [
              Image.asset("assets/icon.png", width: 150, ),
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const[
                    Text('캐논 DSLR 100D (단렌즈,\n충전기 16기가SD 포함)', style: TextStyle(fontSize: 18, color: Colors.black, )),
                    Text('성동구 행당동 · 끌올 10분 전', style: TextStyle(fontSize: 12, color: Colors.grey, fontWeight: FontWeight.w400, height: 2), textAlign: TextAlign.left),
                    Text('210,000원', style: TextStyle(fontSize: 15, color: Colors.black, fontWeight: FontWeight.bold, letterSpacing: 0.5), textAlign: TextAlign.left),
                  ],
                ),
              ),
              Row(
                children: [
                  Column(
                    children: [
                      Text('\n\n', style: TextStyle(height:2.4)),
                      IconButton(icon: Icon(Icons.favorite_border, color: Colors.grey, size: 20, ), onPressed: (){},),
                    ],
                  ),
                  Text('4', style: TextStyle(height: 11.2),)
                ],
              )

            ],
          ),
        ),
        )
    );
  }
}
