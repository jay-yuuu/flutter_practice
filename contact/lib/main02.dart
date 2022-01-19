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
            body: Align(
              alignment: Alignment.center,
              child: Container(
                width: double.infinity, //무한히 주도록
                height: 60,
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.greenAccent,
                  border: Border.all(color: Colors.green)
                ),
                //padding 또는 margin
                //EdgeInsets.all() : LTRB모두 같은 값으로 적용할때
                //EdgeInsets.fromLTRB(왼, 위, 오른, 아래) : 왼쪽부터 시계방향으로, 다른 값 적요
                child: Text('케인아 영양제 먹어라')
              ),
            )

        )
    );
  }
}
