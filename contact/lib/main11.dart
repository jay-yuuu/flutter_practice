import 'dart:html';

import 'package:flutter/material.dart';

void main() {
  runApp( //이렇게 해줘야한단다...
      MaterialApp(
      home: MyApp()
    )
  );
}

//왜 이렇게 빼면 잘 동작할까?
//Context의 개념
//Build 함수 꺼내쓸때 무조건 context 딱 1개만 강제 입력하게 되어있음
//부모 위젯인지 누구인지 정보를 담고 있는 중요한 변수
//즉, myapp 의 context 는 scatffold의 부모 변수가 누구인지 알려줌
//그게 누구라구? MaterialApp!
//context 는 족보다!!! (부모, 조부모, 증조부모,, 등등, 단, 형제들은 안나옴)


class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  var name = ['김영숙', '홍길동', '피자집'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: (){
              //showDialog 를 쓰려면, MaterialApp 을 Myapp 바깥으로!
              showDialog( //버튼 눌렀을때 dialog 뜨게해주는 함수
                  context: context, //materialapp 이 들어있는 context를 입력해야 동작
                  builder: (context){
                    return AlertDialog(
                      title: Text('Contact'),
                      content: SingleChildScrollView(
                        child: ListBody(
                          children: <Widget>[TextField()],
                        ),
                      ),
                      actions: <Widget>[
                        TextButton(
                            onPressed: (){Navigator.of(context).pop();},
                            child: Text('Cancel'),
                        ),
                        TextButton(
                          onPressed: (){Navigator.of(context).pop();},
                          child: Text('OK'),
                        )
                      ],
                    ); //dialog 디자인을 여기에
              }
              );
            },
          ),
          appBar: AppBar(),
          body: ListView.builder(
            itemCount: 3,
            itemBuilder: (c, i){
              return ListTile(
                leading: Icon(Icons.account_circle_rounded, size: 40),
                title: Text(name[i]),
              );
            },
          ),//custom widget

    );
  }
}
