import 'package:flutter/material.dart';

class TextFieldPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TextFieldPage'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            TextField(),
            SizedBox(
              height: 40,
            ),
            TextField(
              decoration: InputDecoration(
                labelText: '여기에 입력하세요',   // 힌트
              ),
            ),
            SizedBox(
              height: 40,
            ),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),   // 외각선
                labelText: '여기에 입력하세요',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
