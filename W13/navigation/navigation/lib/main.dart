import 'package:flutter/material.dart';
import 'package:navigation/first_stateless.dart';
import 'package:navigation/second_stateless.dart';
import 'package:navigation/first_stateful.dart';

void main() {
    runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue,),
      routes: {
        '/first': (context) => FirstPage(),
        '/second': (context) => SecondPage(person: FirstPage().person),
      },
      home:
        FirstStatefulPage(),
    );
  }
}