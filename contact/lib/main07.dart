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
          appBar: AppBar(
              leading: IconButton(icon: Icon(Icons.list), onPressed: (){}),
              title: Text('Practice05'),
          ),
          body: ListView(
            padding: EdgeInsets.fromLTRB(10, 10, 0, 20),
            children: [
              Column(
              children: [
                ListBody(),
                ListBody(),
                ListBody(),
              ],
            )
            ]
          ),
          //하단바는 커스텀 위젯으로
          bottomNavigationBar: BottomAppBar(),
        )
    );
  }
}

//중단부 커스텀 위젯
class ListBody extends StatelessWidget {
  const ListBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.account_circle_rounded, size: 40, ),
        Container(
            margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
            child: Text('홍길동', style: TextStyle(fontSize: 18))
        ),
      ],
    );
  }
}

//하단부 커스텀 위젯
class BottomAppBar extends StatelessWidget {
  const BottomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(onPressed: (){}, icon: Icon(Icons.phone)),
          IconButton(onPressed: (){}, icon: Icon(Icons.message)),
          IconButton(onPressed: (){}, icon: Icon(Icons.people)),
        ],
      )
    );
  }
}
