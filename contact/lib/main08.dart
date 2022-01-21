import 'dart:html';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  var i = 1;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          //공중에 떠서 기능하는 버튼 만들어보기
          //버튼에는 2가지 파라미터가 반드시 필요하다: child(또는 icon), onPressed
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.favorite),
            onPressed: (){
              i++;
              print(i);
            },
          ),

          appBar: AppBar(
            leading: IconButton(icon: Icon(Icons.list), onPressed: (){}),
            title: Text('Practice05'),
          ),
          body: ListView.builder(
              //padding: EdgeInsets.fromLTRB(10, 10, 0, 20),
              //children: []

            //ListView.builder : 반복문을 돌려주는 위젯
            itemCount: i, //반복문 돌릴 횟수

            //어떤 함수를 돌릴건지? 형태는 return 함수명
            //단, itemBuilder (){} 에서, 파라미터는 () 안에 꼭 2개!
            //(context, 1씩 증가하는 정수 i)
            itemBuilder: (context, i){
              //return Text(i.toString()); //출력하면 0,1,2 나옴
              return ListBody(); //이렇게 하면 홍길동 3개 출력됨!

           //출력할 수 있는 함수?
           // print(i); //console 에 출력됨
            },

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
    return ListTile(
      contentPadding: EdgeInsets.fromLTRB(10, 5, 0, 0),
      leading: Icon(Icons.account_circle_rounded, size: 40, color: Colors.deepOrange,),
      title: Text('홍길동', style: TextStyle(fontSize: 18),),
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
