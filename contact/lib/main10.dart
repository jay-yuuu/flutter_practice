import 'dart:html';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var cnt = [0, 0 ,0];
  var name = ["김영숙", "홍길동", "피자집"];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          appBar: AppBar(),
          body: ListView.builder(
                    itemCount: 3,
                    itemBuilder: (context, i){
                      return ListTile(
                          leading: Text(cnt[i].toString()),
                          title: Text(name[i]),
                          trailing: ElevatedButton(
                            child: Text("좋아요"),
                            onPressed: (){
                              setState(() {
                                cnt[i]++;
                                print(cnt[i]);
                              });
                            },
                          )
                      );
                    }
                )

                  /*ListTile(
                    leading: Text(cnt[0].toString()),
                    title: Text(name[0]),
                      trailing: ElevatedButton(
                        child: Text("좋아요"),
                        onPressed: (){
                          setState(() {
                            cnt[0]++;
                            print(cnt[0]);
                          });
                        },
                      )
                  ),
                  ListTile(
                    leading: Text(cnt[1].toString()),
                    title: Text(name[1]),
                      trailing: ElevatedButton(
                        child: Text("좋아요"),
                        onPressed: (){
                          setState(() {
                            cnt[1]++;
                            print(cnt[1]);
                          });
                        },
                      )
                  ),
                  ListTile(
                    leading: Text(cnt[2].toString()),
                    title: Text(name[2]),
                    trailing: ElevatedButton(
                        child: Text("좋아요"),
                      onPressed: (){
                        setState(() {
                          cnt[2]++;
                          print(cnt[2]);
                        });
                      },
                    )
                  )*/

        )
    );
  }
}
