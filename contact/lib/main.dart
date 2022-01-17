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
      //MaterialApp : 구글 스타일의 앱, 또는 Customize 가능
      //Cupertino : 애플 스타일의 앱 개발 가능
        home: Scaffold(
          //appBar 상 - body 중 - bottomeNavigationBar 하 로 나눠주는 위젯
          appBar: AppBar( title: Text('앱제목') ),
          body: Row(
            mainAxisAlignment: MainAxisAlignment.center, //Row일땐 가로 기준, Column일땐 세로 기준 CSS의 Flex 랑 유사
            crossAxisAlignment: CrossAxisAlignment.stretch,
              children: const[
              Text('케인아? 영양제 먹어라?'),
            ] // List 형식의 자료 - children
          ), //Row 가로 Column 세로
          bottomNavigationBar: BottomAppBar(
            child: SizedBox( //BottomeAppBar 에서의 높이를 조절하고 싶을 때
              height: 50, //아래와 같이 SizeBox 로 감싸서 다시 child 로 Row 소환
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const[
                  Icon(Icons.phone),
                  Icon(Icons.message),
                  Icon(Icons.contact_page)
                ],
              ),
            )
          )
          )
    );
  }
}
