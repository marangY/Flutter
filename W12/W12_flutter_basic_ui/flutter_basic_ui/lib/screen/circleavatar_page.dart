import 'package:flutter/material.dart';

class CircleAvatarPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CircleAvatarPage'),
      ),
      body: Center(
        child: CircleAvatar(
          radius: 60,
          backgroundImage: AssetImage('assets/sample.jpg'),
          //child: Icon(Icons.person),
        ),
      ),
    );
  }
}
