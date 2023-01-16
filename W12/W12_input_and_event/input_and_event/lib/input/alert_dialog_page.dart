import 'package:flutter/material.dart';

class AlertDialogPage extends StatefulWidget {
  @override
  _AlertDialogPageState createState() => _AlertDialogPageState();
}

class _AlertDialogPageState extends State<AlertDialogPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AlertDialogPage'),
      ),
      body: ElevatedButton(
        onPressed: () {
          _neverSatisfied();
        },
        child: Text('Alert Dialog'),
      ),
    );
  }

  Future<void> _neverSatisfied() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('제목'),  // 제목영역
          content: SingleChildScrollView(  //ListBody를 함께 사용하여 ListView 효과를 냄
            child: ListBody(
              children: <Widget>[
                Text('Alert Dialog 입니다'),
                Text('OK를 눌러 닫습니다'),
              ],
            ),
          ),
          actions: <Widget>[  // action에 버튼을 정의함
            TextButton(
              child: Text('OK'),
              onPressed: () {
                // Todo
                Navigator.of(context).pop();  // 다이얼로그 닫기
              },
            ),
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
