import 'package:flutter/material.dart';

class AlignPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AlignPage'),
      ),
      body: Align(
        alignment: Alignment.bottomRight,
        child: Container(
          color: Colors.red,
          width: 100,
          height: 100,
        ),
      ),
    );
  }
}