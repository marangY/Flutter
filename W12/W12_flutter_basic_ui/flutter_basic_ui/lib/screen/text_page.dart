import 'package:flutter/material.dart';

class TextPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TextPage'),
      ),
      body: Center(
        child:
        Text(
          'Hello World',
          style: TextStyle(
            fontSize: 40.0,               // 글자 크기
            fontStyle: FontStyle.italic,  // 이탤릭체
            fontWeight: FontWeight.bold,  // 볼드체
            color: Colors.red,            // 색상
            letterSpacing: 4.0,           // 자간
          ),
        ),
      ),
    );
  }
}
