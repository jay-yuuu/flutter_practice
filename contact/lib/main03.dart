import 'dart:html';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var co = "안녕 케조씨야";
    return MaterialApp(
      //MaterialApp : 구글 스타일의 앱, 또는 Customize 가능
      //Cupertino : 애플 스타일의 앱 개발 가능
        home: Scaffold(
          //appBar 상 - body 중 - bottomeNavigationBar 하 로 나눠주는 위젯
            appBar: AppBar(
                actions: [Icon(Icons.star), Icon(Icons.phone)],
                leading: Icon(Icons.list),
                title: Text('Contact')
            ),
            body: SizedBox(
             child: IconButton(
               icon: Icon(Icons.access_time_sharp),
               onPressed: (){},

             )
                 //TextButton, IconButton, ElevatedButton() 셋 중 1개가 버튼
                 //2개의 파라미터가 필수적으로 들어가야함 child * onPressed
              
              //[Text(
              //                co,
              //                style: TextStyle(
              //                  color: Colors.deepPurpleAccent,
              //                  fontSize: 20,
              //                  letterSpacing: 10,
              //                  fontWeight: FontWeight.w500,
              //                      //font 색상 주는 법
              //                      //Colors.컬러명 (지정된 컬러만 쓸수 있음)
              //                      //Color(0xffaaaaaa)
              //                      //Color.fromRGBO(r, g, b, opacity)
              //                ),
              //              )
            )
        )
    );
  }
}
