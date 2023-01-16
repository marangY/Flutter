import 'package:flutter/material.dart';
import 'package:navigation/second_stateless.dart';

class Person {
  String name;
  int age;

  Person(this.name, this.age);
}

class FirstPage extends StatelessWidget {
  Person _person = Person('홍길동', 20);
  Person get person => _person;

  @override
  Widget build(BuildContext context) {
    print('FirstPage build()');
    return Scaffold(
      appBar: AppBar(
        title: Text('First'),
      ),
      body: ElevatedButton(
        child: Text('다음 페이지로'),
        onPressed: () async {
          final result = await Navigator.pushNamed(
            context,
            '/second');
          print(result);
        },
      ),
    );
  }
}