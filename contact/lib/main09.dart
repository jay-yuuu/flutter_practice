import 'dart:html';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

//state 쓰는 법 2가지
//1. StatefulWidget - stful 입력 - tab
//2. StatelessWidget 을 StatefulWidget 으로 변경, 이때 이 안에 만든 변수는 자동으로 state변수가 됨

//자주 바뀌는 데이터, 바뀌면 바로바로 보여야하는 데이터 - state


class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  //Flutter 에서는 variable 또는 state
  var cnt = 0; // 이제부터 얘는 state 변수로 쓸수 있음
  //state 로 쓸려면 여기에 선언 + setState로 사용해줘야함

  var name = ['김영숙', '홍길동', '피자집'];

  //state 변수를 가지고, 실제 변경된 값 - 적용 - 재렌더링을 위해서는
  //setState( (){이 안에다 적어줘야 됨됨})

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          //공중에 떠서 기능하는 버튼 만들어보기
          //버튼에는 2가지 파라미터가 반드시 필요하다: child(또는 icon), onPressed
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            //Icon(Icons.favorite),
            onPressed: (){
              setState(() {
                cnt++;
                print(cnt);
              });
            },
          ),

          appBar: AppBar(
            leading: IconButton(icon: Icon(Icons.list), onPressed: (){}),
            title: Text('Practice05'),
          ),
          body: ListView.builder(
            //padding: EdgeInsets.fromLTRB(10, 10, 0, 20),
            //children: []
            itemCount: cnt,
            itemBuilder: (c, itemCount){
              return ListBody();
            },
          ),

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
