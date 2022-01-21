import 'dart:html';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

//변수에 위젯을 담는 방법도 있으나, 성능 이슈가 고려됨!
//변수에 담아도 되는 것들은?
//평생 안바뀌는 UI! 로고, 상단바, 하단바, 이런 것들은 괜찮다
var a = SizedBox(
  child: Text('안녕안녕'),
);

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //MaterialApp : 구글 스타일의 앱, 또는 Customize 가능
      //Cupertino : 애플 스타일의 앱 개발 가능
        home: Scaffold(
          //appBar 상 - body 중 - bottomeNavigationBar 하 로 나눠주는 위젯
            appBar: AppBar(),
            body: a,//custom widget
        )
    );
  }
}

//custom widget! 쓰는 법
//stless 기재 -> tab -> 이름 쓰고 return 에 만들거 쓰기
//재사용이 많은 UI, 큰 UI나 안바뀌는 큰 틀을 커스텀 위젯으로
//만들어 두면 좋다! (state 관리 이슈가 있음)
class Items extends StatelessWidget {
  const Items({Key? key}) : super(key: key);

//build 함수가 있어야 위젯으로 인정
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Text('ㅎㅇ!'),
    );
  }
}
