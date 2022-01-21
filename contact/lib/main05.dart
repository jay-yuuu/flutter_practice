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
        home: Scaffold(
            appBar: AppBar(),
            body: Row(
              children: [
                Expanded(child:
                  Container(color: Colors.blue), flex: 3),
                Flexible(child:
                  Container(color: Colors.green), flex: 7)
              ],
            ), //Row 가로 Column 세로
        )
    );
  }
}
