import 'package:flutter/material.dart';

class ImagePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ImagePage'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.network('https://www.bc.ac.kr/_res/bucheon/_share/img/bcu/img-bcu-logo.png'),
          Image.asset('assets/sample.jpg'),
        ],
      ),
    );
  }
}
