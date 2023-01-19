import 'package:flutter/material.dart';

class GesturePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GestureDetector/InkWell'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            GestureDetector(
              onTap: () {  // 클릭 시 실행
                print('GestureDetector 클릭!!');
              },
              child: Text('클릭 Me!!'),
            ),
            SizedBox(
              height: 40,
            ),
            InkWell(  // 클릭 시 물결 효과가 나타남
              onTap: () {
                print('InkWell 클릭!!');
              },
              child: Text('클릭 Me!!'),
            ),
          ],
        ),
      ),
    );
  }
}