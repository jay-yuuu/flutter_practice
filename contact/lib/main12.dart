import 'dart:html';

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

class _MyAppState extends State<MyApp> {
  var a = 3;
  var name = ['김영숙', '홍길동', '피자집'];
  var like = [0, 0, 0];

  final myController = TextEditingController();

  void onBtnClick() {
    setState(() {
      //name.add(myController.text);
      a++;
      Navigator.of(context).pop();
      myController.text = ''; //myController 초기화
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
                return AlertDialog(
                  title: Text('Contact'),
                  content: SingleChildScrollView(
                    child: ListBody(
                      children: <Widget>[TextField(
                        controller: myController,
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
          );
        },
      ),
      appBar: AppBar(),
      body: ListView.builder(
        itemCount: name.length,
        itemBuilder: (c, i){
          print(a.toString());
          return ListTile(
            leading: Icon(Icons.account_circle_rounded, size: 40),
            title: Text(name[i]),
            trailing: Text(a.toString()),
          );
        },
      ),

    );
  }
}

class DialogUI extends StatelessWidget {
  const DialogUI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
