import 'package:flutter/material.dart';
import 'package:navigation/second_stateful.dart';

class FirstStatefulPage extends StatefulWidget {
  @override
  _FirstStatefulPageState createState() => _FirstStatefulPageState();
}

class _FirstStatefulPageState extends State<FirstStatefulPage> {

  @override
  void initState() {
    super.initState();
    print('FirstPage initState()');
  }

  @override
  void dispose() {
    super.dispose();
    print('FirstPage dispose()');
  }

  @override
  Widget build(BuildContext context) {
    print('FirstPage build()');
    String _text = 'First';
    return Scaffold(
      appBar: AppBar(
        title: Text(_text),
      ),
      body: ElevatedButton(
        child: Text('다음 페이지로'),
        onPressed: () async {
          final result = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SecondStatefulPage()),
          );
          print(result);
          setState(() { // setState() 를 추가하여 변화를 확인
            _text = result;
          });
        },
      ),
    );
  }
}
