import 'dart:html';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp( //이렇게 해줘야한단다...
      MaterialApp(
          home: MyApp()
      )
  );
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

//Friend 자료형 생성
class Friend {
  //member field
  String? name; //null safety => 타입? 변수이름 으로 해결 가능! 물음표 붙여줄것
  String? number;
  //constructor
  Friend({this.name, this.number}); //생성자인듯?
  //ToString 으로 이어줘야 제대로 변수끼리 매칭됨, 이게 get/set method 인듯
  @override
  toString() => 'name: $name, number: $number';

}

class _MyAppState extends State<MyApp> {

  var a = 8;
  var name = ['김1', '김2', '김3', '김4', '나1', '나2', '나3'];
  var like = [0, 0, 0];
  var number = [''];

  var myFriends =
  [
    Friend(name: '김1', number: '010-1234-5678'),
    Friend(name: '김2', number: '010-1111-1111'),
    Friend(name: '김3', number: '010-2222-2222'),
    Friend(name: '김4', number: '010-3389-9283'),
    Friend(name: '나1', number: '010-9082-1147'),
    Friend(name: '나2', number: '010-7249-0842'),
    Friend(name: '나3', number: '010-6293-4131'),
    Friend(name: '나4', number: '010-5827-7002'),
  ];

  final myController = TextEditingController();
  final numberController = TextEditingController();

  void sortBtnClick()
  {
    setState(() {
      name.sort();
      print(name.toString());
      print(myFriends[0].name);
    });
  }

  void sortBtnClick2()
  {
    setState(() {
      List<String> name2 = List.from(name.reversed);
      name = name2;
      print("name2 values : " + name2.toString());
      //print("name.reversed values : " + name.reversed.toString());
    });
  }

  // void deleteBtnClick() //삭제버튼 기능
  // {
  //   setState(() {
  //     int idx = name.indexOf(name[i]);
  //     print("cliked idx value : " + idx.toString());
  //     name.remove(name[i].toString());
  //     a--;
  //   });
  // }

  void onBtnClick() {
    setState(() {
      if(myController.text != '' && !name.contains(myController.text)){
        name.add(myController.text);
        a++;
        Navigator.of(context).pop();
        myController.text = ''; //myController 초기화
      } // 등록 가능 조건절
      else if(name.contains(myController.text) == true) {
        showDialog(context: context, builder: (context)
        {
          return AlertDialog(
            title: Text("중복된 이름은 등록할 수 없습니다!"),
            actions: <Widget>[
              TextButton(onPressed: () {
                Navigator.of(context).pop(); //중복 경고 팝업 끄기
                myController.text = '';
                //Navigator.of(context).pop(); //이름 등록 팝업 끄기
              }, child: Text('OK'))
            ],
          );
        });
      }
      else { //빈칸이면 alert
        showDialog(context: context, builder: (context) {
          return AlertDialog(
            title: Text("빈칸은 입력할 수 없습니다!"),
            actions: <Widget>[
              TextButton(onPressed: (){Navigator.of(context).pop();}, child: Text('OK'))
            ],
        );
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
          showDialog(
              context: context,
              builder: (context){
                return DialogUI(onBtnClick: onBtnClick, myController: myController,);
              }
          );
        },
      ),
      appBar: AppBar( title: Text(a.toString()) ),
      body: Container(
        width: 400,
        child: Column(
            children: [
              Container(
                width: 365, height: 55,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                      tooltip: '가나다 순으로 정리합니다',
                      onPressed: ()=>sortBtnClick(), //sort 기능
                      icon: Icon(Icons.arrow_drop_down),
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                    ),
                      IconButton(
                        tooltip: '가나다 역순으로 정리합니다',
                        onPressed: ()=>sortBtnClick2(), //sort 기능
                        icon: Icon(Icons.arrow_drop_up),
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                      ),
                  ]
                )
              ),
              Expanded(
                child: ListView.builder(
                  //ListView 를 Column 이나 Container 와 같이 쓰려면, 무조건 앞에꺼 높이나 너비 지정해주고,
                  //Expanded 를 통해 남은 자리를 다 써도 된다고 지정해주어야 함.
                  itemCount: myFriends.length,
                  itemBuilder: (c, i){
                    return ListTile(
                        leading: Icon(Icons.account_circle_rounded, size: 40),
                        //title: Text(name[i]),
                        title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(myFriends[i].name.toString()),
                              Text(myFriends[i].number.toString(), style: TextStyle(fontSize: 12, color: Colors.grey),),
                            ]
                        ),
                        //title: InforRow(myFriends: myFriends,),
                        trailing: IconButton(icon: Icon(Icons.delete), iconSize: 30, onPressed: (){
                          setState(() {
                            int idx = myFriends.indexOf(myFriends[i]);
                            var obj = myFriends[idx];
                            print("idx 뽑아보자? : " + idx.toString());
                            print(obj);
                            myFriends.remove(myFriends[idx].toString());
                            //name.remove(name[i].toString());
                            a--;
                          });
                        }, )
                    );
                  },
                ),
              ),
            ],
          ),
      ),
    );
  }
}

class InforRow extends StatelessWidget {
  InforRow({Key? key, this.myFriends, }) : super(key: key);
  final myFriends;
  var i;

  @override
  Widget build(BuildContext context) {
    return Row(
    );
  }
}


class DialogUI extends StatelessWidget {
  DialogUI({Key? key, this.myController, this.numberController, this.onBtnClick}) : super(key: key);
  final myController;
  final numberController;
  final onBtnClick;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Contact'),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            TextField(
              controller: myController,
            ),
            TextField(
              controller: numberController,
            )],
        ),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: (){Navigator.of(context).pop();},
          child: Text('Cancel'),
        ),
        TextButton(
          onPressed: () => onBtnClick(),
          child: Text('OK'),
        )
      ],
    );
  }
}
