import 'package:flutter/material.dart';

class PaddingPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PaddingPage'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Container(
          color: Colors.red,
        ),
      ),
    );
  }
}
